import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/presentation/bottom_nav_bar_screen/controller/bottom_navbar_controller.dart';
import 'package:todo_list_app/presentation/bottom_nav_bar_screen/state/bottom_navbar_state.dart';
import 'package:todo_list_app/utils/color_constants.dart';
import 'package:todo_list_app/utils/image_constants.dart';

class BottomNavBarScreen extends ConsumerWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navBarState = ref.watch(navBarProvider) as BottomNavbarState;
    return Scaffold(
      body: navBarState.screens[navBarState.currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorConstants.white,
        onTap: (value) {
          ref.read(navBarProvider.notifier).changeScreen(value);
        },
        currentIndex: navBarState.currentScreenIndex,
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
