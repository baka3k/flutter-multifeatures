import 'package:data/repository/repository.dart';
import 'package:data_database/dao/movie_dao.dart';
import 'package:data_database/dao/type_movie_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import 'screen_movie_detail.dart';
class PageMovieDetail extends StatelessWidget {
  final MovieRepository _movieRepository = MovieRepositoryImpl(
      networkDataSource: RetrofitMovieNetworkDataSource(),
      movieDao: MovieDaoImpl(),
      typeMovieDao: TypeMovieDaoImpl());

  PageMovieDetail({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => PageMovieDetail());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchMovieBloc>(
          create: (BuildContext context) => SearchMovieBloc(_movieRepository),
        ),
        // BlocProvider<PopularBloc>(
        //   create: (BuildContext context) => PopularBloc(_movieRepository),
        // ),
      ],
      child: const ScreenMovieDetail(),
    );
  }
}
