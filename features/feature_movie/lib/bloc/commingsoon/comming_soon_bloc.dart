import 'dart:async';

import 'package:data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../movie_state.dart';

part 'comming_soon_event.dart';

class CommingSoonBloc extends Bloc<GetComminSoonEvent, MovieListState> {
  final MovieRepository _movieRepository;

  CommingSoonBloc(this._movieRepository)
      : super(const MovieListState.loading()) {
    on<GetComminSoonEvent>(_onLoadMovieNowplaying);
  }

  Future<FutureOr<void>> _onLoadMovieNowplaying(
      GetComminSoonEvent event, Emitter<MovieListState> emit) async {
    var movies = await _movieRepository.getUpComming();
    if (movies.isSuccess) {
      emit(MovieListState.success(movies.data!));
    } else {
      emit(MovieListState.failure(movies.error.toString()));
    }
  }
}
