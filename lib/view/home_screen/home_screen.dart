import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/utils/app_sessions.dart';
import 'package:todo_list_app/utils/color_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var todoBox = Hive.box(AppSessions.todoBox);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.white,
        appBar: AppBar(
          backgroundColor: ColorConstants.cyan,
          surfaceTintColor: ColorConstants.cyan,
          title: Text(
            "Hi, User",
            style: GoogleFonts.poppins(
              color: ColorConstants.white,
              fontSize: 26,
              fontWeight: FontWeight.w600,
              letterSpacing: -0.4,
            ),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                //
              },
              icon: Icon(
                Icons.library_add_check_rounded,
                size: 30,
                color: ColorConstants.white,
              ),
            ),
            SizedBox(width: 5),
          ],
        ),
        body: ListView.separated(
          padding: EdgeInsets.fromLTRB(14, 22, 14, 14),
          separatorBuilder: (context, index) => SizedBox(height: 20),
          itemCount: 5,
          itemBuilder: (context, index) => Container(
            height: 100,
            padding: EdgeInsets.fromLTRB(12, 12, 1, 15),
            decoration: BoxDecoration(
              color: ColorConstants.cyan,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
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
                    PopupMenuButton(
                      color: ColorConstants.white,
                      iconColor: ColorConstants.white,
                      itemBuilder: (context) => <PopupMenuEntry>[
                        PopupMenuItem(
                          child: Text(
                            "Remove",
                            style: GoogleFonts.poppins(
                              color: ColorConstants.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.6,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  "Due Date",
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
        ),
        floatingActionButton: Container(
          height: 57,
          width: 57,
          decoration: BoxDecoration(
            color: ColorConstants.cyan,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: Icon(Icons.add, size: 40, color: ColorConstants.white),
        ));
  }
}
