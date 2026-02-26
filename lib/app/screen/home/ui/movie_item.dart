import 'package:flutter/material.dart';

import '../../../config/app_constants.dart';
import '../../../model/movie.dart';

class MovieImage extends StatelessWidget {
  final Movie movie;

  const MovieImage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: movie.posterPath == null
              ? Icon(Icons.movie)
              : Image.network(
                  "$imagePath${movie.posterPath}",
                  fit: BoxFit.fitWidth,
                ),
        ),
      ],
    );
  }
}
