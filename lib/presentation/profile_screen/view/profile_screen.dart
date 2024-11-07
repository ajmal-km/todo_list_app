import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/presentation/login_screen/view/login_screen.dart';
import 'package:todo_list_app/presentation/profile_screen/controller/profile_controller.dart';
import 'package:todo_list_app/utils/image_constants.dart';

import '../../../utils/color_constants.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        ref.read(profileScreenProvider.notifier).getUserInfo();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileSreenState = ref.watch(profileScreenProvider);
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
      body: profileSreenState.loading
          ? Center(
              child: CircularProgressIndicator(color: ColorConstants.cyan),
            )
          : Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              ImageConstants.MALE_AVATAR,
                              height: 100,
                              width: 100,
                            ),
                            SizedBox(width: 25),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  profileSreenState.name,
                                  style: GoogleFonts.poppins(
                                    color: ColorConstants.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.7,
                                  ),
                                ),
                                Visibility(
                                  visible:
                                      profileSreenState.dateOfBirth.isNotEmpty
                                          ? true
                                          : false,
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(height: 5),
                                      Text(
                                        profileSreenState.dateOfBirth,
                                        style: GoogleFonts.poppins(
                                          color: ColorConstants.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.7,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: ColorConstants.cyan,
                              borderRadius: BorderRadius.circular(17),
                            ),
                            child: Text(
                              "Edit profile",
                              style: GoogleFonts.poppins(
                                color: ColorConstants.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.7,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      size: 30,
                      color: ColorConstants.grey,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    leading: Icon(
                      Icons.account_circle,
                      size: 30,
                      color: ColorConstants.grey,
                    ),
                  ),
                  ListTile(
                    onTap: () async {
                      ref
                          .read(profileScreenProvider.notifier)
                          .onLoggedout()
                          .then(
                        (value) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                            (route) => false,
                          );
                        },
                      );
                    },
                    leading: Icon(
                      Icons.logout,
                      size: 30,
                      color: ColorConstants.grey,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
