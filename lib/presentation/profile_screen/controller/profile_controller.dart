import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../state/profile_screen_state.dart';

final profileScreenProvider =
    StateNotifierProvider((ref) => ProfileControllerStateNotifier());

class ProfileControllerStateNotifier extends StateNotifier<ProfileScreenState> {
  ProfileControllerStateNotifier()
      : super(ProfileScreenState(
          isNameReadOnly: true,
          isWidgetVisible: false,
          name: "",
          dateOfBirth: "",
          loading: false,
        ));

  void onEditTapped() {
    state = state.copyWith(isReadOnly: false, isVisible: true);
  }

  void onCancelTapped() {
    state = state.copyWith(isReadOnly: true, isVisible: false);
  }

  Future<void> getUserInfo() async {
    state = state.copyWith(isLoading: true);
    final SharedPreferences pref = await SharedPreferences.getInstance();
    state = state.copyWith(
      usrname: pref.getString("username"),
      birthdate: pref.getString("birthday"),
      isLoading: false,
    );
  }

  Future<void> onUpdate(String usrname, String birthdate) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("username", usrname);
    pref.setString("birthday", birthdate);
    getUserInfo().then((value) => onCancelTapped());
  }

  Future<String> updateDOB(BuildContext context) async {
    var birthDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1930),
      lastDate: DateTime.now(),
    );
    return DateFormat('yMd').format(birthDate!);
  }
}
