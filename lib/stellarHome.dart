// ignore: file_names
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyStellarHome extends StatefulWidget {
  const MyStellarHome({Key? key}) : super(key: key);
  @override
  State<MyStellarHome> createState() => _MyStellarHomeState();
}

class _MyStellarHomeState extends State<MyStellarHome> {
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
    const Color(0xeee6e3e2),
    const Color(0xcccdbbb5),
    const Color(0x66624b53),
    const Color(0xccc04327),
    const Color(0xbbb5bec7),
    const Color(0xaaa08080),
  ];
  List<Icon> categoryIcon = [
    const Icon(Icons.category, color: Colors.white, size: 30),
    const Icon(Icons.assignment, color: Colors.white, size: 30),
    const Icon(Icons.book, color: Colors.white, size: 30),
    const Icon(Icons.play_circle_fill, color: Colors.white, size: 30),
    const Icon(Icons.podcasts, color: Colors.white, size: 30),
    const Icon(Icons.leaderboard, color: Colors.white, size: 30),
  ];
  List courseListImages = [
    'Astro Introductory',
    'Planetary Science',
    'Astrobiology',
    'Space Technology'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
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
                            fillColor: const Color(0xFFB4B7BF).withOpacity(0.1),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1.1),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // TODO: Add your onTap logic here
                          },
                          splashColor: const Color.fromARGB(255, 22, 22, 22),
                          highlightColor: const Color.fromARGB(255, 22, 22, 22),
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
                    TextButton(
                      onPressed: () {
                        // TODO: Add your onPressed logic here
                      },
                      child: const Text(
                        'Courses',
                        style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Add your onPressed logic here
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
                GridView.builder(
                  itemCount: courseListImages.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.height - 50 - 25) /
                            (4 * 240),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // TODO: Add your onTap logic here
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 195, 192, 192),
                        ),
                        child: InkWell(
                          onTap: () {
                            // TODO: Add your onTap logic here
                          },
                          splashColor: Colors.grey,
                          highlightColor: const Color.fromARGB(255, 22, 22, 22),
                          borderRadius:
                              BorderRadius.circular(30), // Set the splash color
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                      "courseImages/${courseListImages[index]}.png",
                                      fit: BoxFit.cover,
                                      // width: 100,
                                      // height: 100,
                                      scale: 4),
                                ),
                              ),
                              //const SizedBox(height: 5),
                              // TextButton(
                              //   onPressed: () {
                              //     // TODO: Add your onPressed logic here
                              //   },
                              Text(
                                courseListImages[index],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              // ),
                              //const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  // TODO: Add your onPressed logic here
                                },
                                child: Text(
                                  '8 Videos',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 32,
        selectedItemColor: const Color(0xccc04327),
        selectedFontSize: 18,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.question_answer), label: 'Quiz'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Wishlist'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
