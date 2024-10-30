import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/presentation/login_screen/state/login_screen_state.dart';
import 'package:todo_list_app/utils/color_constants.dart';

final loginScreenProvider =
    StateNotifierProvider((ref) => LoginControllerStateNotifier());

class LoginControllerStateNotifier extends StateNotifier<LoginScreenState> {
  LoginControllerStateNotifier()
      : super(
          LoginScreenState(isObscure: true, loading: false),
        );

  void showPassword() {
    state = state.copyWith(isHidden: !state.isObscure);
  }

  Future<void> onLogin(String email, String password, BuildContext context) async {
    state = state.copyWith(isLoading: true);
    
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? regEmail = pref.getString("email");
    String? regPasssword = pref.getString("password");

    if (regEmail == null || regPasssword == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: ColorConstants.red,
          behavior: SnackBarBehavior.floating,
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(25),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          content: Text(
            "Please Register to Login !",
            style: GoogleFonts.poppins(
              fontSize: 15.7,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.1,
            ),
          ),
        ),
      );
    } else {
      // 
    }
    state = state.copyWith(isLoading: false);
  }
}
