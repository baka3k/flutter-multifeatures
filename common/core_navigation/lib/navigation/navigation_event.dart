part of 'navigation_bloc.dart';

class NavigationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
class NavigationPopEvent extends NavigationEvent {
  @override
  List<Object?> get props => [];
}
class NavigationHomeEvent extends NavigationEvent {
  @override
  List<Object?> get props => [];
}
class NavigationMovieDetail extends NavigationEvent {
  int movieId;

  NavigationMovieDetail({required this.movieId});
  @override
  List<Object?> get props => [];
}
