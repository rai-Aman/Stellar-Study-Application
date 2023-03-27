import 'package:flutter/material.dart';
import 'package:production_project_application/registration.dart';
import 'package:production_project_application/stellarHome.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'stellarHome',
    routes: {
      'stellarHome': (context) => const MyStellarHome(),
      'login': (context) => const MyLogin(),
      'register': (context) => const MyRegistration(),
    },
  ));
}
