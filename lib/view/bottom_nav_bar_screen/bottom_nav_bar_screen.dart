import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/utils/color_constants.dart';
import 'package:todo_list_app/utils/image_constants.dart';
import 'package:todo_list_app/view/category_screen/category_screen.dart';
import 'package:todo_list_app/view/home_screen/home_screen.dart';
import 'package:todo_list_app/view/profile_screen/profile_screen.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  List<Widget> screens = [
    HomeScreen(),
    CategoryScreen(),
    ProfileScreen(),
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstants.white,
        onTap: (value) {
          selectedIndex = value;
          screens[selectedIndex] = screens[value];
          setState(() {});
        },
        currentIndex: selectedIndex,
        selectedItemColor: ColorConstants.cyan,
        unselectedItemColor: ColorConstants.black,
        selectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          color: ColorConstants.black,
          fontWeight: FontWeight.w700,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Home",
            icon: ImageIcon(AssetImage(ImageConstants.HOME)),
          ),
          BottomNavigationBarItem(
            label: "Category",
            icon: ImageIcon(AssetImage(ImageConstants.CATEGORY)),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: ImageIcon(AssetImage(ImageConstants.USER)),
          ),
        ],
      ),
    );
  }
}
