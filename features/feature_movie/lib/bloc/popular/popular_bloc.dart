import 'dart:async';

import 'package:data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../home_movie_bloc.dart';
import '../movie_state.dart';

part 'popular_event.dart';

class PopularBloc extends Bloc<GetPopularEvent, MovieListState> {
  final MovieRepository _movieRepository;

  PopularBloc(this._movieRepository) : super(const MovieListState.loading()) {
    on<GetPopularEvent>(_onLoadMovieNowplaying);
  }

  Future<FutureOr<void>> _onLoadMovieNowplaying(
      GetPopularEvent event, Emitter<MovieListState> emit) async {
    var movies = await _movieRepository.getMoviesPopular();
    if (movies.isSuccess) {
      emit(MovieListState.success(movies.data!));
    }
    else{
      emit(MovieListState.failure(movies.error.toString()));
    }
  }

  void deleteItem(int id) {}
}
