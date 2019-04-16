import 'package:flutter/material.dart';
import 'package:my_movies/src/blocs/movies_bloc.dart';
import 'package:my_movies/src/ui/movie_list.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: MovieBlocProvider(
          child: MovieList(),
        ),
      ),
    ),
  );
}
