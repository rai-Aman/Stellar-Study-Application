import 'package:flutter/material.dart';

class coursesHome extends StatefulWidget {
  String img;
  coursesHome(this.img, {super.key});
  @override
  State<coursesHome> createState() => _coursesHomeState();
}

class _coursesHomeState extends State<coursesHome> {
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.info,
              size: 28,
              color: Color.fromARGB(255, 38, 2, 56),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(5),
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
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
