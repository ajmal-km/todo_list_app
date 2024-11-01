import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/utils/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/utils/image_constants.dart';
import '../../bottom_nav_bar_screen/view/bottom_nav_bar_screen.dart';
import '../controller/user_controller.dart';

class UserScreen extends ConsumerStatefulWidget {
  const UserScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserScreenState();
}

class _UserScreenState extends ConsumerState<UserScreen> {
  var nameController = TextEditingController();
  var dateOfBirthController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
        children: <Widget>[
          Image.asset(
            ImageConstants.REG_LOGO,
            height: 360,
            width: double.infinity,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  cursorWidth: 2.3,
                  cursorColor: ColorConstants.black,
                  cursorRadius: Radius.circular(10),
                  controller: nameController,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  style: GoogleFonts.poppins(
                    color: ColorConstants.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                  decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: GoogleFonts.poppins(
                      color: ColorConstants.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                    errorStyle: GoogleFonts.poppins(
                      color: ColorConstants.red,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.cyan),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.cyan),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your name";
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  readOnly: true,
                  controller: dateOfBirthController,
                  style: GoogleFonts.poppins(
                    color: ColorConstants.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                  decoration: InputDecoration(
                    hintText: "Date of Birth",
                    hintStyle: GoogleFonts.poppins(
                      color: ColorConstants.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                    errorStyle: GoogleFonts.poppins(
                      color: ColorConstants.red,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.cyan),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.cyan),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        dateOfBirthController.text = await ref
                            .read(userScreenProvider.notifier)
                            .setDOB(context);
                      },
                      icon: Icon(
                        Icons.calendar_month_outlined,
                        color: ColorConstants.black,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Select your date of birth";
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: GestureDetector(
          onTap: () {
            ref
                .read(userScreenProvider.notifier)
                .setUserInfo(nameController.text, dateOfBirthController.text)
                .then(
              (value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BottomNavBarScreen(),
                  ),
                );
              },
            );
          },
          child: Container(
            height: 60,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorConstants.cyan,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Text(
              "Let's go",
              style: GoogleFonts.poppins(
                color: ColorConstants.white,
                fontSize: 25,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.9,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
