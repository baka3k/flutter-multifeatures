import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import '../bloc/search/searchmovie_event.dart';

class ScreenMovieDetail extends StatefulWidget {
  const ScreenMovieDetail({Key? key}) : super(key: key);

  @override
  State createState() => _ScreenMovieDetailState();
}

class _ScreenMovieDetailState extends State<ScreenMovieDetail> {
  @override
  void initState() {
    super.initState();
    context.read<SearchMovieBloc>().add(SearchMovieEvent(query: ""));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            _title("Detail movie screen"),
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
}
