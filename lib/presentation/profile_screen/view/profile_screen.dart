import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/utils/color_constants.dart';
import 'package:todo_list_app/utils/image_constants.dart';

import '../controller/profile_controller.dart';
import '../state/profile_screen_state.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileScreenState =
        ref.watch(profileScreenProvider) as ProfileScreenState;
    TextEditingController nameController = TextEditingController();
    TextEditingController dateOfBirthController = TextEditingController();
    return Scaffold(
      backgroundColor: ColorConstants.white,
      appBar: AppBar(
        backgroundColor: ColorConstants.cyan,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            color: ColorConstants.white,
            fontSize: 26,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.4,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 35, bottom: 14),
        children: <Widget>[
          Image.asset(
            ImageConstants.MALE_AVATAR,
            height: 200,
            width: 200,
          ),
          SizedBox(height: 40),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
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
                  readOnly: profileScreenState.isNameReadOnly,
                  style: GoogleFonts.poppins(
                    color: ColorConstants.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => ref
                          .read(profileScreenProvider.notifier)
                          .onEditTapped(),
                      icon: Icon(
                        Icons.edit,
                        color: ColorConstants.cyan,
                      ),
                    ),
                    hintText: "Name",
                    hintStyle: GoogleFonts.poppins(
                      color: ColorConstants.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
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
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
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
                    suffixIcon: profileScreenState.isNameReadOnly
                        ? null
                        : IconButton(
                            onPressed: () async {
                              dateOfBirthController.text = await ref
                                  .read(profileScreenProvider.notifier)
                                  .updateDOB(context);
                            },
                            icon: Icon(
                              Icons.calendar_month_outlined,
                              color: ColorConstants.cyan,
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
                Visibility(
                  visible: profileScreenState.isWidgetVisible,
                  child: SizedBox(height: 20),
                ),
                Visibility(
                  visible: profileScreenState.isWidgetVisible,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () => ref
                              .read(profileScreenProvider.notifier)
                              .onSaveOrCancelTapped(),
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorConstants.cyan,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Text(
                              "Save",
                              style: GoogleFonts.poppins(
                                color: ColorConstants.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => ref
                              .read(profileScreenProvider.notifier)
                              .onSaveOrCancelTapped(),
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorConstants.cyan,
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.poppins(
                                color: ColorConstants.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.5,
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
          SizedBox(height: 15),
          Column(
            children: <Widget>[
              ListTile(
                tileColor: ColorConstants.white,
                iconColor: ColorConstants.cyan,
                leading: Icon(Icons.settings),
                title: Text(
                  "Settings",
                  style: GoogleFonts.poppins(
                    color: ColorConstants.cyan,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorConstants.cyan,
                  size: 20,
                ),
              ),
              ListTile(
                tileColor: ColorConstants.white,
                iconColor: ColorConstants.cyan,
                leading: Icon(Icons.info),
                title: Text(
                  "About",
                  style: GoogleFonts.poppins(
                    color: ColorConstants.cyan,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorConstants.cyan,
                  size: 20,
                ),
              ),
              ListTile(
                tileColor: ColorConstants.white,
                iconColor: ColorConstants.cyan,
                leading: Icon(Icons.logout),
                title: Text(
                  "Logout",
                  style: GoogleFonts.poppins(
                    color: ColorConstants.cyan,
                    fontSize: 19,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
