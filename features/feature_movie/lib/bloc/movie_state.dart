// part of 'home_movie_bloc.dart';

import 'package:core_model/model/model.dart';
import 'package:equatable/equatable.dart';

enum MovieStatus { loading, success, failure }

class MovieListState extends Equatable {
  const MovieListState._({
    this.status = MovieStatus.loading,
    this.items = const <Movie>[],
    this.errorMess = ""
  });

  const MovieListState.loading() : this._();

  const MovieListState.success(List<Movie> items)
      : this._(status: MovieStatus.success, items: items, errorMess: "");

  const MovieListState.failure(String error) : this._(status: MovieStatus.failure, errorMess: error);

  final MovieStatus status;
  final List<Movie> items;
  final String errorMess;

  @override
  List<Object> get props => [status.index, items];
}