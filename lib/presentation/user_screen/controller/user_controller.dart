import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/presentation/user_screen/state/user_screen_state.dart';

final userScreenProvider = StateNotifierProvider((ref) => UserControllerStateNotifier());

class UserControllerStateNotifier extends StateNotifier<UserScreenState> {
  UserControllerStateNotifier()
      : super(
          UserScreenState(),
        );

  Future<void> setUserInfo(String usrname, String birthdate) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("username", usrname);
    pref.setString("birthday", birthdate);
  }
}
