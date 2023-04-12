import 'package:flutter/material.dart';

class VideoSection extends StatelessWidget {
  VideoSection({super.key});
  List videoList = [
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
      itemCount: videoList.length,
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
              Icons.play_arrow_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          title: Text(videoList[index]),
          subtitle: const Text('10 min 50 sec'),
        );
      },
    );
  }
}
