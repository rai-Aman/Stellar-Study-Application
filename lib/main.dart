import 'package:flutter/material.dart';
import 'package:production_project_application/registration.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login': (context) => const MyLogin(),
    'register': (context) => const MyRegistration(),
     },
  ));
}

