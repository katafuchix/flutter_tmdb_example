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
      buildWhen: (previous, current) {
        // success 状態から success 状態への遷移（追加読み込みなど）では
        // 全体を再描画させず、スクロール位置を守る
        return previous.screen != current.screen;
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
                  // スクロールが動いたら
                  if (scrollInfo is ScrollUpdateNotification) {
                    primaryFocus?.unfocus(); // キーボードをしまう
                  }
                  // スクロール位置が最大値の90%を超えたら次を読み込む
                  if (scrollInfo.metrics.pixels >=
                      scrollInfo.metrics.maxScrollExtent * 0.9) {
                    context.read<HomeCubit>().loadNextPage();
                  }
                  return true;
                },
                child: MasonryGridView.builder(
                  // 1. スクロール位置を保持するためのキー
                  key: const PageStorageKey<String>('movie_grid_scroll'),

                  // 2. 以前の constraints を利用して列数を決定
                  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > 900
                        ? 5
                        : 3,
                  ),

                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,

                  // 3. 全件描画せず、画面に見えている分だけ描画（ListViewと同じ挙動）
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    return _movieItemWidget(results[index], context);
                  },

                  // 4. StaggeredGridと同じ見た目にするための設定
                  physics: const AlwaysScrollableScrollPhysics(),
                ),
              ),
            ),
          )
        : const Center(child: Text("Data is empty!"));
  }

  Widget _movieItemWidget(Movie movie, BuildContext context) {
    return MovieListItem(
      movie: movie,
      onTap: () {
        primaryFocus?.unfocus();
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
