import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/utils/color_constants.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({
    super.key,
    this.onGridTap,
  });

  final void Function()? onGridTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onGridTap,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: ColorConstants.cyan,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Category",
              style: GoogleFonts.poppins(
                color: ColorConstants.white,
                fontSize: 23,
                fontWeight: FontWeight.w600,
                letterSpacing: -1,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "progress",
              style: GoogleFonts.poppins(
                color: ColorConstants.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.6,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: LinearProgressIndicator(
                value: 1 / 1.5,
                color: ColorConstants.black,
                borderRadius: BorderRadius.circular(7),
                minHeight: 9,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
