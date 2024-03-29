// ignore: file_names
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:production_project_application/bottomNavigationPages/recommendations.dart';
import 'bottomNavigationPages/QuizPage.dart';
import 'bottomNavigationPages/myProfile.dart';
import 'coursePages/coursesHome.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


import 'functions.dart';

class MyStellarHome extends StatefulWidget {
  const MyStellarHome({Key? key}) : super(key: key);
  @override
  State<MyStellarHome> createState() => _MyStellarHomeState();
}

class _MyStellarHomeState extends State<MyStellarHome> {
  
  List courseListImages = [
    'Astro Introductory',
    'Planetary Science',
    'Astrobiology',
    'Space Technology'
  ];

  final ValueNotifier<int> _currentNotifier = ValueNotifier<int>(0);
  String _title = '';
  String _imageUrl = '';
  String _date = '';
  String _explanation = '';

  @override
  void initState() {
    super.initState();
    _getApod();
  }

  Future<void> _getApod() async {
    final response = await http.get(
      Uri.parse(
          'https://api.nasa.gov/planetary/apod?api_key=cHy2JPNqqPZfDenVmFYxod8Kt04KMxuYKhkk5dbH'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _title = data['title'];
        _imageUrl = data['url'];
        _date = data['date'];
        _explanation = data['explanation'];
      });
    } else {
      // Handle error
      throw Exception('Failed to fetch photo of the day');
    }
  }

  //making category list for user
  List chooseCategory = [
    'Category',
    'Courses',
    'Books',
    'Videos',
    'Podcasts',
    'Leaderboard',
  ];

  List<Color> categoryColor = [
    const Color(0xffE38763),
    const Color(0xcccdbbb5),
    const Color(0x66624b53),
    const Color(0xbbb5bec7),
    const Color(0xaaa08080),
    const Color(0xccc04327),
  ];
  List<Icon> categoryIcon = [
    const Icon(Icons.category, color: Colors.white, size: 30),
    const Icon(Icons.assignment, color: Colors.white, size: 30),
    const Icon(Icons.book, color: Colors.white, size: 30),
    const Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    const Icon(Icons.podcasts, color: Colors.white, size: 30),
    const Icon(Icons.leaderboard, color: Colors.white, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => showExitDialog(context),
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 15, left: 15, right: 15, bottom: 10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 38, 2, 56),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Icons.dashboard,
                        size: 30,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 3, bottom: 15),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          'Hello User!',
                          textStyle: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                            wordSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                      ],
                      isRepeatingAnimation: true,
                    ),
                  ),
                  //End of code for upper part
                  Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search For Courses...",
                              fillColor:
                                  const Color(0xFFB4B7BF).withOpacity(0.1),
                              filled: true,
                              contentPadding: const EdgeInsets.all(18),
                              hintStyle: const TextStyle(
                                color: Color(0xFFB4B7BF),
                              ),
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              // add your search functionality here
                            },
                            splashColor: const Color(
                                0xFFB4B7BF), // set the color of the ripple effect
                            borderRadius: BorderRadius.circular(10),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                "loginRegisterImages/searchIconOrange.png",
                                height: 35,
                                width: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Column(
                children: [
                  GridView.builder(
                    itemCount: chooseCategory.length, //for looping icons
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1.1),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // TODO: Add your onTap logic here
                              String route = '';
                              if (chooseCategory[index] == 'Category') {
                                route = '/category';
                              } else if (chooseCategory[index] == 'Courses') {
                                route = 'coursepage';
                              } else if (chooseCategory[index] == 'Books') {
                                route = 'books';
                              } else if (chooseCategory[index] == 'Videos') {
                                route = '/videos';
                              } else if (chooseCategory[index] == 'Podcasts') {
                                route = 'podcast';
                              } else if (chooseCategory[index] ==
                                  'Leaderboard') {
                                route = 'leaderboard';
                              }
                              Navigator.pushNamed(context, route);
                            },
                            splashColor: const Color.fromARGB(255, 22, 22, 22),
                            highlightColor:
                                const Color.fromARGB(255, 22, 22, 22),
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: categoryColor[index],
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: categoryIcon[index],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            chooseCategory[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // TextButton(
                      //   onPressed: () {
                      //     // TODO: Add your onPressed logic here
                      //   },
                      const Text(
                        'Choose Your Course',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),

                      TextButton(
                        onPressed: () {
                          // TODO: Add your onPressed logic here
                          Navigator.pushNamed(context, 'explore');
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 38, 2, 56),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  //SingleChildScrollView(
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 220,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 2),
                      enlargeCenterPage: false,
                      viewportFraction: 0.6,
                      aspectRatio: 1,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        _currentNotifier.value =
                            index; // update the ValueNotifier
                      },
                    ),
                    items: courseListImages.map((imageName) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => coursesHome(imageName),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(184, 252, 251, 251),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "courseImages/$imageName.png",
                                  fit: BoxFit.cover,
                                  scale: 1,
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                width: 2,
                                height: 30,
                                margin:
                                    const EdgeInsets.only(right: 30, left: 30),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: const Color.fromARGB(255, 38, 2, 56),
                                ),
                                child: Text(
                                  imageName,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: courseListImages.map(
                      (imageName) {
                        int index = courseListImages.indexOf(imageName);
                        return ValueListenableBuilder<int>(
                          valueListenable: _currentNotifier,
                          builder:
                              (BuildContext context, int value, Widget? child) {
                            return Container(
                              width: 8,
                              height: 8,
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: value == index
                                    ? const Color.fromARGB(255, 38, 2, 56)
                                    : const Color.fromARGB(100, 38, 2, 56),
                              ),
                            );
                          },
                        );
                      },
                    ).toList(),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Photo of the Day from NASA",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_imageUrl.isNotEmpty) {
                              showDialog(
                                // Dialog to show bigger image as well.
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: Image.network(_imageUrl),
                                  );
                                },
                              );
                            }
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: _imageUrl.isNotEmpty
                                ? Image.network(
                                    _imageUrl,
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    "ImpImages/loading.gif",
                                    height: 300,
                                    width: 600,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _title, //Title of API Image
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                _date, //Date of API Image
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                _explanation, //Explanation of API Image
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
        //body: _pages[_selectedIndex],

        // bottomNavigationBar:
        //     buildBottomNavigationBar(_currentIndex, _onItemTapped),
      ),
    );
  }
}
