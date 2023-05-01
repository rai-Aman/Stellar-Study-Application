import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:production_project_application/bottomNavigationPages/myProfile.dart';
import 'package:production_project_application/bottomNavigationPages/quizPage.dart';
import 'package:production_project_application/bottomNavigationPages/recommendations.dart';
import 'package:production_project_application/stellarHome.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  int currentIndex = 0;
  final List<Widget> _pages = [
    const MyStellarHome(),
    const RecommendationPage(),
    const MyQuiz(),
    const myProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: const Color.fromARGB(255, 38, 2, 56),
        ),
        child: BottomNavigationBar(
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
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          selectedItemColor: const Color(0xffE38763),
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
