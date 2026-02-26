import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
    BlocProvider.of<HomeCubit>(context).fetchMovies();
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
      listener: (context, state) {},
      builder: (context, state) {
        return state.screen.when(
          initial: () => const CustomLoadingIndicator(),
          loading: () => const CustomLoadingIndicator(),
          // Listener が Loading を出すので空でOK
          error: (message) =>
              Center(child: CustomErrorWidget(errMessage: message)),
          success: (results) => LayoutBuilder(
            builder: (context, constraints) {
              return results.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(5.0),
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
                    )
                  : Center(child: Text("Data is empty!"));
            },
          ),
        );
      },
    );
  }

  Widget _movieItemWidget(Movie movie, BuildContext context) {
    return MovieListItem(
      movie: movie,
      onTap: () {
        /*Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieDetailPage(movie: movie),
          ),
        );  */
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
      cubit.searchMovies(query: query);
    } else {
      cubit.fetchMovies();
    }
  }
}
