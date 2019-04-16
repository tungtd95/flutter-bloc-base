import 'package:flutter/material.dart';

import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<ItemModel>();

  Observable<ItemModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    ItemModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

class MovieBlocProvider extends InheritedWidget {
  final MoviesBloc bloc;

  MovieBlocProvider({Key key, Widget child})
      : bloc = MoviesBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    return true;
  }

  static MoviesBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MovieBlocProvider)
    as MovieBlocProvider)
        .bloc;
  }
}
