import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import '../../../core/widget/custom_error_widget.dart';
import '../../../core/widget/custom_loading_indicator.dart';
import '../../model/movie.dart';
import 'home_cubit.dart';
import 'state/home_state.dart';
import 'ui/movie_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomeScreen> {
  final TextEditingController _formController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            _searchCustomBox(),
            Expanded(child: _homePageBody()),
          ],
        ),
      ),
    );
  }

  Widget _homePageBody() {
    return BlocConsumer<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          previous.screen != current.screen ||
          previous.dialog != current.dialog,
      listener: (context, state) {
        if (state.screen is ScreenLoading ||
            state.screen is ScreenLoadingMore) {
          SmartDialog.showLoading(msg: 'Loading...');
        } else {
          SmartDialog.dismiss();
        }
      },
      builder: (context, state) {
        return state.screen.when(
          initial: (_) => const CustomLoadingIndicator(),
          loading: (_) => const CustomLoadingIndicator(),
          error: (message, _) =>
              Center(child: CustomErrorWidget(errMessage: message)),
          success: (results, _, _) => _buildGridView(context, results),
          loadingMore: (results, _) => _buildGridView(context, results),
        );
      },
    );
  }

  Widget _buildGridView(BuildContext context, List<Movie> results) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return results.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: RefreshIndicator(
                    color: Colors.red,
                    onRefresh: () async {
                      context.read<HomeCubit>().fetchMovies();
                    },
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollInfo) {
                        FocusScope.of(context).unfocus();
                        // スクロールが一番下（の90%くらい）に来たら次を読み込む
                        if (scrollInfo.metrics.pixels >=
                            scrollInfo.metrics.maxScrollExtent * 0.9) {
                          context.read<HomeCubit>().loadNextPage();
                        }
                        return true;
                      },
                      child: SingleChildScrollView(
                        child: StaggeredGrid.count(
                          crossAxisCount: constraints.maxWidth > 900 ? 5 : 3,
                          mainAxisSpacing: 0,
                          crossAxisSpacing: 0,
                          children: results
                              .map((movie) => _movieItemWidget(movie, context))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                )
              : Center(child: Text("Data is empty!"));
        },
      ),
    );
  }

  Widget _movieItemWidget(Movie movie, BuildContext context) {
    return MovieListItem(
      movie: movie,
      onTap: () {
        FocusScope.of(context).unfocus();
        context.push('/detail', extra: movie);
      },
    );
  }

  Widget _searchCustomBox() {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Card(
          child: ListTile(
            leading: Icon(Icons.search),
            title: TextField(
              controller: _formController,
              decoration: InputDecoration(
                hintText: 'Search movie...',
                border: InputBorder.none,
              ),
              onChanged: _onSearchTextChanged,
            ),
            trailing: IconButton(
              icon: Icon(Icons.clear, color: Colors.grey),
              onPressed: () {
                _formController.clear();
                _onSearchTextChanged('');
              },
            ),
          ),
        ),
      ),
    );
  }

  void _onSearchTextChanged(String query) {
    final cubit = context.read<HomeCubit>();

    if (query.isNotEmpty || query != "") {
      cubit.setSearchWord(query);
      cubit.searchMovies(query: query);
    } else {
      cubit.fetchMovies();
    }
  }
}
