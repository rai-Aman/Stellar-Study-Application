import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PodcastDetailPage extends StatelessWidget {
  final Podcast podcast;

  PodcastDetailPage({required this.podcast});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 38, 2, 56),
        elevation: 0,
        title: Text(podcast.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(podcast.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    podcast.title,
                    style: const TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 36),
                  ElevatedButton(
                    onPressed: () async {
                      /*The launch method attempts to open the specified URL using the appropriate app on the user’s device. For example, if the URL is a web address, it will open in the user’s default web browser.
                      On the other hand, the canLaunch method checks if the specified URL can be handled by any app installed on the user’s device. It returns a Future that completes with a bool value indicating whether or not the URL can be launched.*/

                      // ignore: deprecated_member_use
                      if (await canLaunch(podcast.link)) {
                        // ignore: deprecated_member_use
                        await launch(podcast.link);
                      } else {
                        throw 'Could not launch ${podcast.link}';
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white54,
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Listen Now',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              podcast.title,
              style: const TextStyle(
                  fontSize: 28, fontWeight: FontWeight.bold, wordSpacing: 4),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              podcast.description,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class Podcast {
  final String title;
  final String image;
  final String description;
  final String link;

  Podcast({
    required this.title,
    required this.image,
    required this.description,
    required this.link,
  });
}
