import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/utils/app_utils.dart';
import '../state/login_screen_state.dart';

final loginScreenProvider =
    StateNotifierProvider<LoginControllerStateNotifier, LoginScreenState>(
        (ref) => LoginControllerStateNotifier());

class LoginControllerStateNotifier extends StateNotifier<LoginScreenState> {
  LoginControllerStateNotifier()
      : super(
          LoginScreenState(isObscure: true, loading: false),
        );

  void showPassword() {
    state = state.copyWith(isHidden: !state.isObscure);
  }

  Future<int> onLogin(String email, String password) async {
    var registeredData = await AppUtils.getRegisteredCredentials();
    if (registeredData.isEmpty) {
      return -1;
    }
    if (registeredData["email"] == email && registeredData["password"] == password) {
      
      return 0;
    }
    return 1;
  }
}
