import 'package:flutter/material.dart';
import 'package:production_project_application/registration.dart';
import 'package:production_project_application/stellarHome.dart';
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
    },
  ));
}
