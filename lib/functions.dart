//Email Validation
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'stellarHome.dart';
import 'bottomNavigationPages/myProfile.dart';
import 'bottomNavigationPages/quizPage.dart';

// void onItemTapped(BuildContext context, int selectedIndex, int index) {
//   //Conditions if the user has tapped on the same item and no action should be taken.
//   if (index != selectedIndex) {
//     switch (index) {
//       case 0:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const MyStellarHome()),
//         );
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const MyQuiz()),
//         );
//         break;
//       // case 2:
//       //   Navigator.push(
//       //     context,
//       //     MaterialPageRoute(builder: (context) => RecommendationPage()),
//       //   );
//       //   break;
//       case 3:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const myProfile()),
//         );
//         break;
//     }
//   }
// }

// BottomNavigationBar buildBottomNavigationBar({
//   required int selectedIndex,
//   required void Function(int) onItemTapped,
// }) {
//   return BottomNavigationBar(
//     onTap: onItemTapped,
//     currentIndex: selectedIndex,
//     iconSize: 24,
//     selectedItemColor: const Color(0xccc04327),
//     selectedFontSize: 14,
//     unselectedItemColor: Colors.black,
//     items: const [
//       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//       BottomNavigationBarItem(icon: Icon(Icons.quiz_rounded), label: 'Quiz'),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.recommend), label: 'Recommendation'),
//       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//     ],
//   );
// }

Widget buildBottomNavigationBar(int currentIndex, void Function(int)? onTap) {
  return Theme(
    data: ThemeData(
      canvasColor: const Color.fromARGB(255, 38, 2, 56),
    ),
    child: BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: const Color(0xffE38763),
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.recommend),
          label: 'Recommendations',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz_rounded),
          label: 'Quiz',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    ),
  );
}

Future<bool> showExitDialog(BuildContext context) async {
  final shouldPop = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        'Stellar Study E-Learning',
        style: TextStyle(
          color: Color.fromARGB(255, 38, 2, 56),
          decoration: TextDecoration.underline,
          decorationThickness: 1,
          decorationColor: Color.fromARGB(255, 38, 2, 56),
        ),
      ),
      content: const Text('Are you sure you want to exit?'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text(
            'No',
            style: TextStyle(
              color: Color.fromARGB(255, 38, 2, 56),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true);
            SystemNavigator.pop();
          },
          child: const Text(
            'Yes',
            style: TextStyle(
              color: Color.fromARGB(255, 38, 2, 56),
            ),
          ),
        ),
      ],
    ),
  );
  return shouldPop ?? false;
}


String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter your email';
  }

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(email)) {
    return 'Please enter a valid email address';
  }

  final domain = email.split('@')[1];
  final validDomains = [
    'gmail.com',
    'yahoo.com',
    'hotmail.com'
  ]; // valid domain for validation
  if (!validDomains.contains(domain)) {
    return 'Invalid email domain';
  }
  return null;
}

//Function for checking password and confirm password

String? validatePassword(String? value, String? confirmPassword) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (confirmPassword != null && confirmPassword != value) {
    return 'Passwords do not match';
  }
  if (value.length < 8) {
    return 'Password should be at least 8 characters long';
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password should contain at least one uppercase letter';
  }
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password should contain at least one lowercase letter';
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password should contain at least one digit';
  }
  return null;
}
