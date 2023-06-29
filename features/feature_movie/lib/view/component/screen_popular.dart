import 'package:core_common/core_common.dart';
import 'package:core_model/model/model.dart';
import 'package:core_navigation/navigation/navigation.dart';
import 'package:designsystem/component/component.dart';
import 'package:feature_movie/bloc/popular/popular_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movie_state.dart';

class UiPopularMovie extends StatefulWidget {
  const UiPopularMovie({super.key});

  @override
  State<UiPopularMovie> createState() => _UiPopularMovieState();
}

class _UiPopularMovieState extends State<UiPopularMovie> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularBloc, MovieListState>(builder: (context, state) {
      switch (state.status) {
        case MovieStatus.loading:
          return const Center(child: CircularProgressIndicator());
        case MovieStatus.failure:
          return const Center(child: Text('Oops something went wrong!'));
        case MovieStatus.success:
          return _buildPage(context, state.items);
      }
    });
  }

  Widget _buildPage(BuildContext context, List<Movie> items) {
    return GridView.builder(
      // padding: padding,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1,
      ),

      itemBuilder: (context, index) => _item(context, index, items[index]),
      itemCount: items.length,
    );
  }

  Widget _item(BuildContext context, int index, Movie movie) {
    Log.d(movie.posterPath.asPhotoUrl(Poster.w500));
    return InkWell(
      child: CachedNetworkImageWidget(
        movie.posterPath.asPhotoUrl(Poster.w500),
        scaleType: BoxFit.cover,
      ),
      onTap: () {
        context
            .read<NavigationBloc>()
            .add(NavigationMovieDetail(movieId: movie.id));
      },
    );
  }
}
