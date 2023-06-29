

import 'package:equatable/equatable.dart';

class SearchMovieEvent extends Equatable {
  String query;

  SearchMovieEvent({required this.query});
  List<Object?> get props => [];
}
