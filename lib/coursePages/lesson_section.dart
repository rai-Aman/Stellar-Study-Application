import 'package:flutter/material.dart';

class LessonSection extends StatelessWidget {
  LessonSection({super.key});
  List courseList = [
    'Introduction to the Solar System',
    'Galaxies 101: A Beginner Guide',
    'Star Formation and the Life Cycle of Stars',
    'Exploring the Planets: From Mercury to Neptune',
    'The Milky Way: Our Home in the Universe',
    'A Tour of the Universe: From the Big Bang to the Present Day',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: courseList.length,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index == 0
                  ? const Color.fromARGB(255, 38, 2, 56)
                  : const Color.fromARGB(255, 38, 2, 56).withOpacity(0.6),
            ),
            child: const Icon(
              Icons.list_alt_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(courseList[index]),
          subtitle: Text(
              'Chapter ${index + 1}'), // To increase the chapter as number of chapter increase in list
        );
      },
    );
  }
}
