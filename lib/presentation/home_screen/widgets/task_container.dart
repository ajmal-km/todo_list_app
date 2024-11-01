import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/utils/color_constants.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: ColorConstants.cyan,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 6),
            child: Row(
              children: <Widget>[
                Text(
                  "Title",
                  style: GoogleFonts.poppins(
                    color: ColorConstants.white,
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.5,
                  ),
                ),
                Spacer(),
                Text(
                  "Date",
                  style: GoogleFonts.poppins(
                    color: ColorConstants.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Text(
                "Due Date",
                style: GoogleFonts.poppins(
                  color: ColorConstants.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.3,
                ),
              ),
              Spacer(),
              PopupMenuButton(
                color: ColorConstants.white,
                iconColor: ColorConstants.white,
                itemBuilder: (context) => <PopupMenuEntry>[
                  PopupMenuItem(
                    child: Text(
                      "Remove",
                      style: GoogleFonts.poppins(
                        color: ColorConstants.cyan,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
