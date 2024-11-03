import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../state/bottom_navbar_state.dart';
import '../../category_screen/view/category_screen.dart';
import '../../home_screen/view/home_screen.dart';
import '../../profile_screen/view/profile_screen.dart';

final navBarProvider = StateNotifierProvider<BottomNavBarStateNotifier, BottomNavbarState>((ref) => BottomNavBarStateNotifier());

class BottomNavBarStateNotifier extends StateNotifier<BottomNavbarState> {
  BottomNavBarStateNotifier()
      : super(
          BottomNavbarState(
            screens: <Widget>[
              HomeScreen(),
              CategoryScreen(),
              ProfileScreen(),
            ],
            currentScreenIndex: 0,
          ),
        );

  void changeScreen(value) {
    state = state.copyWith(selectedIndex: value);
  }
}
