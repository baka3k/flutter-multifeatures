import 'dart:async';

import 'package:data/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../movie_state.dart';

part 'nowplaying_event.dart';

class NowPlayingBloc extends Bloc<GetNowplayingEvent, MovieListState> {
  final MovieRepository _movieRepository;

  NowPlayingBloc(this._movieRepository)
      : super(const MovieListState.loading()) {
    on<GetNowplayingEvent>(_onLoadMovieNowplaying);
  }

  Future<FutureOr<void>> _onLoadMovieNowplaying(
      GetNowplayingEvent event, Emitter<MovieListState> emit) async {
    var movies = await _movieRepository.getNowPlaying();
    if (movies.isSuccess) {
      emit(MovieListState.success(movies.data!));
    } else {
      emit(MovieListState.failure(movies.error.toString()));
    }
  }
}
