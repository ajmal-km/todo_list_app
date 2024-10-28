import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../state/profile_screen_state.dart';

final profileScreenProvider =
    StateNotifierProvider((ref) => ProfileControllerStateNotifier());

class ProfileControllerStateNotifier extends StateNotifier<ProfileScreenState> {
  ProfileControllerStateNotifier()
      : super(
          ProfileScreenState(isNameReadOnly: true, isWidgetVisible: false),
        );

  void onEditTapped() {
    state = state.copyWith(
      isReadOnly: false,
      isVisible: true
    );
  }

  void onSaveOrCancelTapped() {
    state = state.copyWith(
      isReadOnly: true,
      isVisible: false
    );
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
