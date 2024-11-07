import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../state/registration_screen_state.dart';

final registrationScreenProvider = StateNotifierProvider<
    RegistrationControllerStateNotifier,
    RegistrationScreenState>((ref) => RegistrationControllerStateNotifier());

class RegistrationControllerStateNotifier
    extends StateNotifier<RegistrationScreenState> {
  RegistrationControllerStateNotifier()
      : super(
          RegistrationScreenState(
              passwordObscure: true,
              confirmPasswordObscure: true,
              loading: false),
        );

  void showPassword() {
    state = state.copyWith(passHidden: !state.passwordObscure);
  }

  void showConfirmPassword() {
    state = state.copyWith(confirmPassHidden: !state.confirmPasswordObscure);
  }

  Future<void> onRegistration(String name, String email, String password) async {
    state = state.copyWith(isLoading: true);
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", name);
    pref.setString("email", email);
    pref.setString("password", password);
    pref.setBool("isLogged", true);
    state = state.copyWith(isLoading: false);
  }
}
