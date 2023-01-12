import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import '../../Const/global.dart';
import '../../Model/moviesmodel.dart';
import '../../Services/service.dart';
import 'custumwidgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int randomMovieId;
  late int randompage;
  late int randomIndex;
  @override
  void initState() {
    super.initState();
    randomPage();
  }

  Future<void> randomPage() async {
    randompage = Random().nextInt(500);
    randomIndex = Random().nextInt(19);
    setState(() {});

    List<Movies> list = await MovieDatas().getPopularMovies(randompage);

    randomMovieId = list[randomIndex].id!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TMDB",
          style: TextStyle(color: logoColor, fontSize: textSize2),
        ),
      ),
      body: Column(
        children: [
          customTitles(title: 'Trending Movies', whichList: ''),
          Expanded(
            flex: 2,
            child: FutureBuilder<List<Movies>>(
              future: MovieDatas().getPopularMovies(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final value = snapshot.data![index];
                        return CustomCard(value: value);
                      });
                } else {
                  return const Text("");
                }
              },
            ),
          ),
          customTitles(title: 'Popular Movies', whichList: ''),
          Expanded(
            flex: 2,
            child: FutureBuilder<List<Movies>>(
              future: MovieDatas().getTopRatedMovies(1),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final value = snapshot.data![index];
                        return CustomCard(value: value);
                      });
                } else {
                  return const Text("");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
