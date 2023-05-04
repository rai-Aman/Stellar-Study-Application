import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:production_project_application/bottomNavigationPages/category_item.dart';
import 'package:production_project_application/stellarHome.dart';

import 'data.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key});

  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  final TextEditingController _searchController =
      TextEditingController(); //TextEditingController to get the value of the search query

  List courseList = [
    'Astro Introductory',
    'Planetary Science',
    'Astrobiology',
    'Space Technology'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 38, 2, 56),
            pinned: true,
            title: getAppBar(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
              child: getSearchBox(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, bottom: 5),
              child: getCategories(),
            ),
          ),
          SliverList(delegate: getCourses())
        ],
      ),
    );
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        children: const [
          Text(
            "Explore",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }

  Widget getSearchBox() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        hintText: "Search",
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        prefixIcon: const Icon(Icons.search,
            size: 22, color: Color.fromARGB(255, 38, 2, 56)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(width: 2.0, color: Color.fromARGB(255, 38, 2, 56)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(width: 2.0, color: Color.fromARGB(255, 38, 2, 56)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(width: 2.0, color: Color.fromARGB(255, 38, 2, 56)),
        ),
        isDense: true,
      ),
      textAlignVertical: TextAlignVertical.center,
      textInputAction: TextInputAction.search,
      style: TextStyle(fontSize: 16),
      onSubmitted: (String value) {
        // Handle search here
      },
    );
  }

  int selectedCategoryIndex = 0;
  Widget getCategories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
            categories.length,
            (index) => CategoryItem(
                  onTap: () {
                    setState(() {
                      selectedCategoryIndex = index;
                    });
                  },
                  isSelected: selectedCategoryIndex == index,
                  data: categories[index],
                )),
      ),
    );
  }

  getCourses() {
    return SliverChildBuilderDelegate((context, index) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Container(
          width: 200,
          height: 290,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 5, bottom: 5),
          decoration: BoxDecoration(
              color: Color.fromARGB(185, 246, 248, 248),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black87.withOpacity(.1),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(1, 1),
                )
              ]),
          child: Stack(
            children: [
              ...courseList.map((imageName) {
                //added the spread operator ... before courseList.map(...) to extract the individual widgets from the list.
                return Container(
                  width: double.infinity,
                  height: 190,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("courseImages/$imageName.png"),
                    ),
                  ),
                );
              }).toList(),
              Positioned(
                top: 175,
                right: 15,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black87.withOpacity(.05),
                        spreadRadius: .5,
                        blurRadius: .5,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: SvgPicture.asset(
                    "CategoriesIcon/bookmark.svg",
                    color: const Color(0xffE38763),
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
              // Positioned(
              //   top: 195,
              //   child: Column(
              //     children: [
              //       Text(
              //         imageName,
              //         style: TextStyle(
              //           fontSize: 20,
              //           fontWeight: FontWeight.w500,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      );
    });
  }
}
