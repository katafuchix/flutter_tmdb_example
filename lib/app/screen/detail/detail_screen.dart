import 'package:flutter/material.dart';

import '../../config/app_color.dart';
import '../../model/movie.dart';
import '../../util/util_text.dart';
import '../home/ui/movie_item.dart';

class DetailScreen extends StatelessWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title.toString())),
      body: _movieDetail(),
    );
  }

  Widget _movieDetail() {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: constraints.maxWidth > 900 ? 500.0 : 200.0,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MovieImage(movie: movie),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(movie.title, style: UtilText.textStyle18No),
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.0, bottom: 16.0),
                child: Text(
                    "${movie.releaseDate} • ${movie.originalLanguage} • "
                        "${movie.voteCount} • ${movie.adult}",
                    style: UtilText.textStyle16),
              ),
              Divider(height: 1.0, color: AppColor.colorWhite),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    "Overview :",
                    style: UtilText.textStyle20,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text(
                    movie.overview ?? "",
                    style: UtilText.textStyle16,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
