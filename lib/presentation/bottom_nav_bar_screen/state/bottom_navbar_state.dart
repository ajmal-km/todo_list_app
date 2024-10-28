import 'package:flutter/material.dart';

class BottomNavbarState {
  List<Widget> screens;
  int currentScreenIndex;
  BottomNavbarState({required this.screens, required this.currentScreenIndex});

  BottomNavbarState copyWith({List<Widget>? UIScreens, int? selectedIndex}) => BottomNavbarState(
        screens: UIScreens ?? this.screens,
        currentScreenIndex: selectedIndex ?? this.currentScreenIndex,
      );
}
