import 'package:feature_movie/bloc/bloc.dart';
import 'package:feature_movie/bloc/commingsoon/bloc.dart';
import 'package:feature_movie/view/component/screen_comming_soon.dart';
import 'package:feature_movie/view/component/screen_popular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'component/component.dart';

class ScreenHomeMovie extends StatefulWidget {
  const ScreenHomeMovie({Key? key}) : super(key: key);

  @override
  State createState() => _ScreenHomeMovieState();
}

class _ScreenHomeMovieState extends State<ScreenHomeMovie> {
  @override
  void initState() {
    super.initState();
    context.read<NowPlayingBloc>().add(GetNowplayingEvent());
    context.read<PopularBloc>().add(GetPopularEvent());
    context.read<CommingSoonBloc>().add(GetComminSoonEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _searchLayout(),
            _nowPlaying(),
            _title("Travel, Tours and Tracking"),
            _uiPopularMovie(),
            _title("Comming soon"),
            _uiUpComming(),
          ],
        ),
      ),
    );
  }

  Widget _title(String title) => SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Text(title),
      ));

  Widget _nowPlaying() {
    return SliverToBoxAdapter(
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.6,
        child: const UiNowPlaying(),
      ),
    );
  }

  Widget _uiPopularMovie() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.4,
          child: const UiPopularMovie(),
        ),
      ),
    );
  }

  Widget _uiUpComming() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.4,
          child: const UiCommingSoonMovie(),
        ),
      ),
    );
  }

  Widget _searchLayout() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(7.0, 17.0, 7.0, 7.0),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
            labelText: 'Input text to search',
            hintText: "Input text to search",
          ),
        ),
      ),
    );
  }


}
