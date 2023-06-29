import 'package:data/repository/repository.dart';
import 'package:data_database/dao/movie_dao.dart';
import 'package:data_database/dao/type_movie_dao.dart';
import 'package:feature_movie/bloc/bloc.dart';
import 'package:feature_movie/bloc/commingsoon/bloc.dart';
import 'package:feature_movie/view/home_screen_movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageMovie extends StatelessWidget {
  final MovieRepository _movieRepository = MovieRepositoryImpl(
      networkDataSource: RetrofitMovieNetworkDataSource(),
      movieDao: MovieDaoImpl(),
      typeMovieDao: TypeMovieDaoImpl());

  HomePageMovie({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => HomePageMovie());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NowPlayingBloc>(
          create: (BuildContext context) => NowPlayingBloc(_movieRepository),
        ),
        BlocProvider<PopularBloc>(
          create: (BuildContext context) => PopularBloc(_movieRepository),
        ),
        BlocProvider<SearchMovieBloc>(
          create: (BuildContext context) => SearchMovieBloc(_movieRepository),
        ),
        BlocProvider<CommingSoonBloc>(
          create: (BuildContext context) => CommingSoonBloc(_movieRepository),
        ),
      ],
      child: const ScreenHomeMovie(),
    );
  }
}
