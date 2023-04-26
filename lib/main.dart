import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:production_project_application/Leaderboard.dart';
import 'package:production_project_application/PodcastDetailPage.dart';
import 'package:production_project_application/bottomNavigationPages/quizPage.dart';
import 'package:production_project_application/podcast.dart';
import 'package:production_project_application/registration.dart';
import 'package:production_project_application/stellarHome.dart';
import 'bottomNavigationPages/myProfile.dart';
import 'login.dart';
import 'otp.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'stellarHome',
    routes: {
      'login': (context) => const MyLogin(),
      'register': (context) => const MyRegistration(),
      'otp': (context) => const MyOtp(),
      'stellarHome': (context) => const MyStellarHome(),
      'quiz': (context) => const MyQuiz(),
      'leaderboard': (context) => MyLeaderboard(),
      'profile': (context) => const myProfile(),
      'podcast': (context) => PodcastsPage()
    },
  ));
}
