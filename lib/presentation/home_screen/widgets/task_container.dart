import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/utils/color_constants.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      tileColor: ColorConstants.cyan,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.check_circle_rounded,
          color: ColorConstants.white,
        ),
      ),
      title: Text(
        "Title",
        style: GoogleFonts.poppins(
          color: ColorConstants.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}
