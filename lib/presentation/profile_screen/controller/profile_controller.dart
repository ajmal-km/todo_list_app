import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo_list_app/utils/app_utils.dart';
import '../state/profile_screen_state.dart';

final profileScreenProvider =
    StateNotifierProvider<ProfileControllerStateNotifier, ProfileScreenState>(
        (ref) => ProfileControllerStateNotifier());

class ProfileControllerStateNotifier extends StateNotifier<ProfileScreenState> {
  ProfileControllerStateNotifier()
      : super(
          ProfileScreenState(
            name: "",
            dateOfBirth: "",
            loading: false,
          ),
        );

  Future<void> getUserInfo() async {
    state = state.copyWith(isLoading: true);
    state = state.copyWith(
      usrname: await AppUtils.getUserName(),
      birthdate: await AppUtils.getUserBirthdate(),
      isLoading: false,
    );
  }

  Future<void> onLoggedout() async {
    await AppUtils.onLogout();
  }

  Future<void> onDeleteMyAccount() async {
    await AppUtils.onDeleteAccount();
  }

  Future<void> onUpdate(String usrname, String birthdate) async {
    await AppUtils.setUserInfo(usrname, birthdate);
    getUserInfo();
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
