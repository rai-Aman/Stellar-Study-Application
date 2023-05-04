import 'package:flutter/material.dart';

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 38, 2, 56),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Recommended for You',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore these courses and expand your knowledge of astronomy and space science!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                // Add this line
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    _buildRecommendationItem(
                      'The Big Bang',
                      'Learn about the origins of the universe and how the Big Bang theory explains the formation of galaxies and stars.',
                      'loginRegisterImages/fantasy.jpg',
                    ),
                    _buildRecommendationItem(
                      'Black Holes',
                      'Discover the fascinating properties of black holes and their role in the cosmos.',
                      'assets/black_hole.jpg',
                    ),
                    _buildRecommendationItem(
                      'Exoplanets',
                      'Explore the search for planets beyond our solar system and the possibility of life on other worlds.',
                      'assets/exoplanet.jpg',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(
      String title, String description, String imageAsset) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        //padding: EdgeInsets.symmetric(horizontal: 10), // Add this line
        width: 550,
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageAsset,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    // Add this line
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10), // Add this line

                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 38, 2, 56),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    // Add this line
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10), // Add this line

                    child: Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    alignment: Alignment.bottomRight,
                    width: double.infinity,
                    // decoration: BoxDecoration(
                    //   color: Color.fromARGB(255, 38, 2, 56),
                    //   borderRadius: BorderRadius.circular(20),
                    // ),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric( horizontal: 20),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View more ➜',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 38, 2, 56),
                          ),
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
    );
  }
}
