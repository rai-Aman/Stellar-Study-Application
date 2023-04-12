import 'package:flutter/material.dart';
import 'lesson_section.dart';
import 'videos_section.dart';

// ignore: camel_case_types
class coursesHome extends StatefulWidget {
  String img;
  coursesHome(this.img, {super.key});
  @override
  State<coursesHome> createState() => _coursesHomeState();
}

// ignore: camel_case_types
class _coursesHomeState extends State<coursesHome> {
  bool isVideoSection = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.img,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.info,
                size: 28,
                color: Color.fromARGB(255, 38, 2, 56),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Information'),
                      content: const Text(
                          'This is some information about Astronomy.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Color.fromARGB(255, 244, 243, 244)),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 38, 2, 56)),
                          ),
                          child: const Text('Okay'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xbbb5bec7),
                image: DecorationImage(
                  image: AssetImage(
                    "courseImages/${widget.img}.png",
                  ),
                  fit: BoxFit
                      .cover, // Apply BoxFit.cover to make the image fit the whole container
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 38, 2, 56),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Color.fromARGB(204, 243, 238, 237),
                    size: 45,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              "${widget.img} Course",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Reference of videos",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "8 Videos",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Material(
                    //ternary operator for if isVideosection is true to change the color
                    color: isVideoSection
                        ? const Color.fromARGB(255, 38, 2, 56)
                        : const Color.fromARGB(255, 38, 2, 56).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        //To change value of isVideoSection
                        setState(() {
                          isVideoSection = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: const Text(
                          "Videos",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    //ternary operator for if isVideosection is true to change the color
                    color: isVideoSection
                        ? const Color.fromARGB(255, 38, 2, 56).withOpacity(0.5)
                        : const Color.fromARGB(255, 38, 2, 56),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        //To change value of isVideoSection
                        setState(
                          () {
                            isVideoSection = false;
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 35),
                        child: const Text(
                          "Lessons",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Creating two different sections for videos and lessons
            const SizedBox(height: 10),
            //again conditional ternary operator to show if the isVideo slecetion is true or false
            isVideoSection ? VideoSection() : LessonSection()
          ],
        ),
      ),
    );
  }
}
