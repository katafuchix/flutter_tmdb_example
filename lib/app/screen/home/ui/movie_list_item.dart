import 'package:flutter/material.dart';

import '../../../model/movie.dart';
import 'movie_item.dart';

class MovieListItem extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  const MovieListItem({Key? key, required this.movie, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: MovieImage(movie: movie),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}
