import 'package:core_common/core_common.dart';
import 'package:core_model/model/model.dart';
import 'package:core_navigation/navigation/navigation.dart';
import 'package:designsystem/component/image_caching.dart';
import 'package:feature_movie/bloc/nowplaying/nowplaying_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/movie_state.dart';

class UiNowPlaying extends StatefulWidget {
  const UiNowPlaying({super.key});

  @override
  State<UiNowPlaying> createState() => _UiNowPlayingState();
}

class _UiNowPlayingState extends State<UiNowPlaying> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingBloc, MovieListState>(
      builder: (context, state) {
        switch (state.status) {
          case MovieStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case MovieStatus.failure:
            return const Center(child: Text('Oops something went wrong!'));
          case MovieStatus.success:
            final PageController controller = PageController(
              viewportFraction: 0.85,
            );
            return _buildPage(context, controller, state.items);
        }
      },
    );
  }

  Widget _buildPage(
      BuildContext context, PageController controller, List<Movie> items) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return _item(context, index, items[index]);
      },
      controller: controller,
      itemCount: items.length,

    );
  }

  Widget _item(BuildContext context, int index, Movie movie) {
    Log.d(movie.posterPath.asPhotoUrl(Poster.w500));
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
      child: InkWell(
        child: cachedNetworkImage(movie.posterPath.asPhotoUrl(Poster.w500)),
        onTap: () {
          context.read<NavigationBloc>().add(NavigationMovieDetail(movieId: movie.id));
        },
      ),
    );
  }

  Widget cachedNetworkImage(String photoUrl) {
    return CachedNetworkImageWidget(photoUrl, scaleType: BoxFit.cover);
  }
}
