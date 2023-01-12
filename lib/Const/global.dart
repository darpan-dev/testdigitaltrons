import 'package:flutter/material.dart';

const Color textbuttonColor = Color.fromARGB(255, 25, 133, 141);
const Color positiveButtonColor = Color(0xff272A80);
const Color negativeButtonColor = Color(0xffE91E63);
const Color logoColor = Color.fromARGB(197, 74, 252, 255);

const String apiKey = "f974ddfef83b8e6e3e882fbd071219ee";
const String movieBaseUrl = "https://api.themoviedb.org/3";
const String imageBaseUrl = "https://image.tmdb.org/t/p/w500/";
const String defaultCastImage =
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png";
const String defaultMovieImage =
    "https://eticketsolutions.com/demo/themes/e-ticket/img/movie.jpg";

const double textSize1 = 16;
const double textSize2 = 40;
const double padding1 = 8;
const double padding2 = 10;
const double height1 = 330;
const double width1 = 200;

class Genres {
  Map<int, String> listOfGenres = {
    28: 'Action',
    12: 'Adventure',
    16: 'Animation',
    35: 'Comedy',
    80: 'Crime',
    99: 'Documentary',
    18: 'Drama',
    10751: 'Family',
    14: 'Fantasy',
    36: 'History',
    27: "Horror",
    10402: 'Music',
    9648: 'Mystery',
    10749: 'Romance',
    878: 'Science Fiction',
    10770: 'TV Movie',
    53: 'Thriller',
    10752: 'War',
    37: 'Western'
  };
}
