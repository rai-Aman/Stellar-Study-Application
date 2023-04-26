import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyLeaderboard extends StatefulWidget {
  // String img;
  // MyLeaderboard(this.img, {super.key});
  @override
  State<MyLeaderboard> createState() => _MyLeaderboardState();
}

class _MyLeaderboardState extends State<MyLeaderboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 247, 247),
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white, elevation: 0,
        centerTitle: true,
        title: const Flexible(
          child: Text(
            'LEADERBOARD',
            style: TextStyle(
              color: Color.fromARGB(255, 38, 2, 56),
              fontFamily: 'Courier New',
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // backgroundColor: Color.fromARGB(255, 38, 2, 56),
      ), // <-- Closing brace for AppBar widget
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Column(
                    children: [
                      Image.asset("courseImages/2nd.png"),
                      Image.asset("courseImages/top3.png"),
                      const Text(
                        'username2',
                        style: TextStyle(
                            color: Color.fromARGB(255, 38, 2, 56),
                            fontFamily: 'Courier New',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'score2',
                        style: TextStyle(
                            color: Color.fromARGB(255, 38, 2, 56),
                            fontFamily: 'Courier New',
                            // letterSpacing: 2,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 45),
                  child: Column(
                    children: [
                      Image.asset("courseImages/1st.png"),
                      Image.asset("courseImages/top3.png"),
                      const Text(
                        'username1',
                        style: TextStyle(
                            color: Color.fromARGB(255, 38, 2, 56),
                            fontFamily: 'Courier New',
                            // letterSpacing: 2,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'score1',
                        style: TextStyle(
                            color: Color.fromARGB(255, 38, 2, 56),
                            fontFamily: 'Courier New',
                            // letterSpacing: 2,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25),
                  child: Column(children: [
                    //SizedBox(height: 46),
                    Image.asset("courseImages/3rd.png"),
                    Image.asset(
                      "courseImages/top3.png",
                    ),
                    const Text(
                      'username3',
                      style: TextStyle(
                          color: Color.fromARGB(255, 38, 2, 56),
                          fontFamily: 'Courier New',
                          // letterSpacing: 2,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'score3',
                      style: TextStyle(
                          color: Color.fromARGB(255, 38, 2, 56),
                          fontFamily: 'Courier New',
                          // letterSpacing: 2,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
              ],
            ),
            const SizedBox(height: 1), //gap between scoreboard and top3
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                    top: 0), // add 100 pixels of space above the container

                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 38, 2, 56).withOpacity(0.9),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                      child: Container(
                        height: 50, // set the height to 100

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.white),
                        child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(width: 15),
                              Text(
                                '${index + 1}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 38, 2, 56),
                                    fontFamily: 'Courier New',
                                    // letterSpacing: 2,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                  width:
                                      10), // add space between text and image

                              ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Image.asset(
                                  "courseImages/USER_LEADERBOARD.png",
                                  width: 50,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                  width:
                                      20), // add space between text and image
                              const Text(
                                'Student',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 38, 2, 56),
                                    fontFamily: 'Courier New',
                                    //letterSpacing: 1,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(
                                    width: 80,
                                    height: 40,
                                    margin: const EdgeInsets.only(right: 10),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 132, 99, 129),
                                          Color.fromARGB(255, 38, 2, 56)
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                      ),
                                    ),
                                    child: const Text(
                                      '0000',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 242, 240, 240),
                                          fontFamily: 'Courier New',
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
