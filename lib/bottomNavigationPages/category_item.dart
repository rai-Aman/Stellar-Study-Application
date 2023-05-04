import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {super.key,
      required this.data,
      this.bgColor = const Color.fromARGB(255, 38, 2, 56),
      this.selectedcolor = const Color(0xbbb5bec7), 
      this.isSelected = false, this.onTap});
  final data;
  final Color selectedcolor;
  final Color bgColor;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            //color: Color.fromARGB(255, 38, 2, 56),
            color: isSelected ? selectedcolor : bgColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black87.withOpacity(.05),
                blurRadius: .5,
                spreadRadius: .5,
                offset: Offset(1, 1),
              ),
            ]),
        child: Row(
          children: [
            SvgPicture.asset(
              // "CategoriesIcon/all.svg",
              data["icon"],
              color: isSelected ? Color(0xFF3E4249) : Colors.white,
              width: 16,
              height: 16,
            ),
            SizedBox(width: 5),
            Text(
              data["name"],
              style: TextStyle(
                color: isSelected ? Color(0xFF3E4249) : Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
