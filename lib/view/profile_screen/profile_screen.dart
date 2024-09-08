import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/utils/color_constants.dart';
import 'package:todo_list_app/utils/image_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  bool isNameReadOnly = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView(
            padding: EdgeInsets.only(left: 14, right: 14, bottom: 14),
            children: <Widget>[
              SizedBox(height: 20),
              Image.asset(
                ImageConstants.MALE_AVATAR,
                height: 200,
                width: 200,
              ),
              SizedBox(height: 25),
              Column(
                children: <Widget>[
                  TextFormField(
                    cursorWidth: 2.3,
                    cursorColor: ColorConstants.black,
                    cursorRadius: Radius.circular(10),
                    controller: nameController,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    },
                    readOnly: isNameReadOnly,
                    style: GoogleFonts.poppins(
                      color: ColorConstants.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          isNameReadOnly = false;
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.edit,
                          color: ColorConstants.cyan,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 2.3, color: ColorConstants.grey),
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
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 2.3, color: ColorConstants.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(width: 2.3, color: ColorConstants.cyan),
                      ),
                      suffixIcon: isNameReadOnly
                          ? null
                          : IconButton(
                              onPressed: () async {
                                var birthDate = await showDatePicker(
                                  context: context,
                                  firstDate: DateTime(1930),
                                  lastDate: DateTime.now(),
                                );
                                dateOfBirthController.text =
                                    DateFormat('yMd').format(birthDate!);
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
                    visible: !isNameReadOnly,
                    child: SizedBox(height: 20),
                  ),
                  Visibility(
                    visible: !isNameReadOnly,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              isNameReadOnly = !isNameReadOnly;
                              setState(() {});
                            },
                            child: Container(
                              height: 54,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorConstants.cyan,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                "Save",
                                style: GoogleFonts.poppins(
                                  color: ColorConstants.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 14),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              isNameReadOnly = !isNameReadOnly;
                              setState(() {});
                            },
                            child: Container(
                              height: 54,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorConstants.cyan,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.poppins(
                                  color: ColorConstants.white,
                                  fontSize: 22,
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
