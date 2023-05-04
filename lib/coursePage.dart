import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final ValueNotifier<double> _progressNotifier = ValueNotifier<double>(0.0);

  @override
  void dispose() {
    _progressNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Course'),
        backgroundColor: const Color.fromARGB(255, 38, 2, 56),
      ),
      body: Column(
        children: [
          ValueListenableBuilder<double>(
            valueListenable: _progressNotifier,
            builder: (context, value, _) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: LinearProgressIndicator(
                  value: value,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    const Color.fromARGB(255, 38, 2, 56),
                  ),
                ),
              );
            },
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              pauseAutoPlayOnTouch: true,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                // Update progress notifier when the carousel page changes
                _progressNotifier.value = (index + 1) / 3;
              },
            ),
            items: [
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/course1.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/course2.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/course3.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            'Course Name',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 38, 2, 56),
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            'Course Description',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Enroll Now',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              // ignore: deprecated_member_use
              primary: const Color.fromARGB(255, 38, 2, 56),
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
