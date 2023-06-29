import 'package:core_common/core_common.dart';
import 'package:core_model/model/model.dart';
import 'package:designsystem/component/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/bloc.dart';
import '../../bloc/movie_state.dart';

class UiCommingSoonMovie extends StatefulWidget {
  const UiCommingSoonMovie({super.key});

  @override
  State<UiCommingSoonMovie> createState() => _UiCommingSoonMovieState();
}

class _UiCommingSoonMovieState extends State<UiCommingSoonMovie> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchMovieBloc, MovieListState>(
      builder: (context, state) {
        switch (state.status) {
          case MovieStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case MovieStatus.failure:
            return const Center(child: Text('Oops something went wrong!'));
          case MovieStatus.success:
            final PageController controller = PageController();
            return _buildPage(context, controller, state.items);
        }
      }
    );
  }

  Widget _buildPage(
      BuildContext context, PageController controller, List<Movie> items) {
    return GridView.builder(
      // padding: padding,
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
        childAspectRatio: 1,
      ),
      // return a custom ItemCard
      itemBuilder: (context, index) => _item(context, index, items[index]),
      itemCount: items.length,
    );
  }

  Widget _item(BuildContext context, int index, Movie movie) {
    Log.d(movie.posterPath.asPhotoUrl(Poster.w500));
    return InkWell(
      onTap: () {
        // context.read<NavigationBloc>().add("");
        // context.read<ThemeCubit>().add();
      },
      child: CachedNetworkImageWidget(movie.posterPath.asPhotoUrl(Poster.w500),
        scaleType: BoxFit.cover,
      ),
    );
  }
}
