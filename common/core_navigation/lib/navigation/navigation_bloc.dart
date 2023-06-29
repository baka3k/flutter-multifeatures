import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';

part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, dynamic> {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationBloc(this.navigatorKey) : super(null) {
    on<NavigationPopEvent>(_pop);
    on<NavigationHomeEvent>(_gotoHome);
    on<NavigationMovieDetail>(_gotoMovieDetail);
  }

  FutureOr<void> _pop(NavigationEvent event, Emitter emit) {
    navigatorKey.currentState?.pop();
    // navigatorKey.currentState?.pushNamed('/details');
    // navigatorKey.currentState?.pushNamed('/home');
    emit("pop");
  }
  FutureOr<void> _gotoHome(NavigationEvent event, Emitter emit) {
    navigatorKey.currentState?.pushNamed('/home');
    // Navigator.of(context).pushNamed(RoutePaths.SecondScreen, arguments: event);
    emit("/home");
  }

  FutureOr<void> _gotoMovieDetail(NavigationMovieDetail event, Emitter emit) {
    navigatorKey.currentState?.pushNamed('/details', arguments: event);
    // Navigator.of(context).pushNamed(RoutePaths.SecondScreen, arguments: event);
    emit("/details");
  }
}
