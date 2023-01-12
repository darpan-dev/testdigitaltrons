import 'package:flutter/material.dart';

import '../../Const/global.dart';
import '../../Model/moviedetails.dart';

class posterAndTitle extends StatelessWidget {
  const posterAndTitle({
    Key? key,
    required this.sizeWidth,
    required this.value,
  }) : super(key: key);

  final double sizeWidth;
  final MovieDetails value;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: sizeWidth,
          child: (value.backdropPath == null)
              ? Image.network(
                  defaultMovieImage,
                  height: 300,
                )
              : Image.network(
                  "$imageBaseUrl${value.backdropPath}",
                  fit: BoxFit.fill,
                ),
        ),
        Positioned(
          bottom: 2,
          child: Container(
            color: Colors.black38,
            constraints: BoxConstraints(maxWidth: sizeWidth),
            child: Text(
              value.title!,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class yearAndRating extends StatelessWidget {
  const yearAndRating({
    Key? key,
    required this.value,
  }) : super(key: key);

  final MovieDetails value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8),
          child: Text(
            "${value.releaseDate!.year}",
            style: const TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        (value.voteAverage) == null
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8),
                child: Row(
                  children: [
                    const Text(
                      'IMDb rating: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Icon(
                      Icons.star,
                      color: Color.fromARGB(255, 250, 239, 43),
                    ),
                    Text(
                      value.voteAverage!.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
