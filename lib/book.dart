import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Book {
  final String title;
  final String author;
  final String image;
  final String pdf;

  Book(
      {required this.title,
      required this.author,
      required this.image,
      required this.pdf});
}

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  _BookPageState createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  List<Book> books = [
    Book(
        title: 'PALE BLUE DOT',
        author: 'Carl Sagan',
        image: 'courseImages/pale.jpg',
        pdf:
            'https://cominsitu.files.wordpress.com/2019/06/carl-sagan-pale-blue-dot_-a-vision-of-the-human-future-in-space-1997.pdf'),
    Book(
        title: 'Book 2',
        author: 'Author 2',
        image: 'assets/images/book2.jpg',
        pdf: 'https://example.com/book2.pdf'),
    Book(
        title: 'Book 3',
        author: 'Author 3',
        image: 'assets/images/book3.jpg',
        pdf: 'https://example.com/book3.pdf'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 38, 2, 56),
        elevation: 0,
        title: const Text('Book Section'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: GestureDetector(
                      onTap: () {
                        // navigate to book detail page
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 38, 2, 56),
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              spreadRadius: 10,
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 24, horizontal: 20),
                                  height: 168,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    // borderRadius: const BorderRadius.all(
                                    //   Radius.circular(8),
                                    // ),
                                    image: DecorationImage(
                                      image: AssetImage(books[index].image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ), // for book and books picture
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        books[index].title,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'by ${books[index].author}',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                      const SizedBox(height: 18),
                                      ElevatedButton(
                                        onPressed:
                                            // download book pdf
                                            () async {
                                          /*The launch method attempts to open the specified URL using the appropriate app on the user’s device. For example, if the URL is a web address, it will open in the user’s default web browser.
                      On the other hand, the canLaunch method checks if the specified URL can be handled by any app installed on the user’s device. It returns a Future that completes with a bool value indicating whether or not the URL can be launched.*/

                                          // ignore: deprecated_member_use
                                          if (await canLaunch(
                                              books[index].pdf)) {
                                            // ignore: deprecated_member_use
                                            await launch(books[index].pdf);
                                          } else {
                                            throw 'Could not launch ${books[index].pdf}';
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromARGB(
                                              255, 38, 2, 56),
                                        ),
                                        child: const Text('Download PDF'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: IconButton(
                                onPressed: () {
                                  // add your second button action here
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Information About Book'),
                                        content: const Text(
                                            'This is some information about Astronomy Astronomy is the study of everything in the universe beyond Earth atmosphere.That includes objects we can see with our naked eyes, like the Sun , the Moon , the planets, and the stars . It also includes objects we can only see with telescopes or other instruments, like faraway galaxies and tiny particles.'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color.fromARGB(
                                                          255, 244, 243, 244)),
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                          Color>(
                                                      const Color.fromARGB(
                                                          255, 38, 2, 56)),
                                            ),
                                            child: const Text('Okay'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.info_outline_rounded),
                                color: const Color.fromARGB(255, 38, 2, 56),
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
          ],
        ),
      ),
    );
  }
}
