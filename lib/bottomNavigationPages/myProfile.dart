import 'package:flutter/material.dart';

import '../functions.dart';
import '../stellarHome.dart';
import 'QuizPage.dart';

class myProfile extends StatefulWidget {
  const myProfile({Key? key}) : super(key: key);

  @override
  State<myProfile> createState() => _myProfileState();
}

class _myProfileState extends State<myProfile> {
  int _currentIndex = 3;

  void _onItemTapped(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
      switch (index) {
        case 0:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyStellarHome()),
          );
          break;
        // case 1:
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => RecommendationPage()),
        //   );
        //   break;
        case 2:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyQuiz()),
          );
          break;
        case 3:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const myProfile()),
          );
          break;
      }
    }
  }
  List<String> profileListImages = [
    'My Information',
    'Sign Out',
    'Selected Courses',
    'Quizzes Taken',
    'Saved Courses',
    'Change Password',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        //centerTitle: true,
        title: const Text(
          'My Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: PopupMenuButton(
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  child: TextButton(
                    onPressed: () {
                      // Add your help function here
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.help_outline,
                          color: Color.fromARGB(255, 38, 2, 56),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Help',
                          style: TextStyle(
                            color: Color.fromARGB(255, 38, 2, 56),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
              icon: const Icon(
                Icons.more_vert,
                size: 28,
                color: Color.fromARGB(255, 38, 2, 56),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Container(
              height: 200,
              padding: const EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                bottom: 10,
              ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 38, 2, 56),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Welcome back,',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          wordSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      //letterSpacing: 1,
                      wordSpacing: 1,
                      color: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 50.0,
                      child: Image.asset("loginRegisterImages/fantasy.jpg"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: profileListImages.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                child: GestureDetector(
                  onTap: () {
                    // handle tap
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        const SizedBox(width: 10),
                        Image.asset(
                          "profileImages/${profileListImages[index]}.png",
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            profileListImages[index],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.5,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Row(
                          children: const [
                            // other widgets
                            Icon(Icons.arrow_forward_ios),
                            // add more icons here
                          ],
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar:
          buildBottomNavigationBar(_currentIndex, _onItemTapped),
    );
  }
}
