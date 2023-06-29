import 'dart:async';

import 'package:data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../movie_state.dart';
import 'searchmovie_event.dart';

// part 'searchmovie_event.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, MovieListState> {
  final MovieRepository _movieRepository;

  SearchMovieBloc(this._movieRepository)
      : super(const MovieListState.loading()) {
    on<SearchMovieEvent>(_onLoadMovieNowplaying);
  }

  Future<FutureOr<void>> _onLoadMovieNowplaying(
      SearchMovieEvent event, Emitter<MovieListState> emit) async {
    var movies = await _movieRepository.getMoviesPopular();
    if (movies.isSuccess) {
      emit(MovieListState.success(movies.data!));
    } else {
      emit(MovieListState.failure(movies.error.toString()));
    }
  }
}
