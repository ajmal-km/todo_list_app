import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/color_constants.dart';
import '../../login_screen/view/login_screen.dart';
import '../controller/registration_controller.dart';
import '../state/registration_screen_state.dart';

class RegistrationScreen extends ConsumerStatefulWidget {
  const RegistrationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState extends ConsumerState<RegistrationScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var confirmPassController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registrationScreenScreenState =
        ref.watch(registrationScreenProvider) as RegistrationScreenState;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Creat Account",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  cursorWidth: 2.3,
                  cursorColor: ColorConstants.cyan,
                  cursorRadius: Radius.circular(10),
                  controller: emailController,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  style: GoogleFonts.poppins(
                    color: ColorConstants.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.mail,
                      color: ColorConstants.grey,
                    ),
                    hintText: "Your Email",
                    hintStyle: GoogleFonts.poppins(
                      color: ColorConstants.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                    errorStyle: GoogleFonts.poppins(
                      color: ColorConstants.red,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.cyan),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.cyan),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.grey),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.contains("@")) {
                      return null;
                    } else {
                      return "Enter a Valid Email";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: registrationScreenScreenState.passwordObscure,
                  cursorWidth: 2.3,
                  cursorColor: ColorConstants.cyan,
                  cursorRadius: Radius.circular(10),
                  controller: passController,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  style: GoogleFonts.poppins(
                    color: ColorConstants.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: ColorConstants.grey,
                    ),
                    hintText: "Your password",
                    hintStyle: GoogleFonts.poppins(
                      color: ColorConstants.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                    suffixIcon: InkWell(
                      onTap: () => ref
                          .read(registrationScreenProvider.notifier)
                          .showPassword(),
                      child:
                          registrationScreenScreenState.passwordObscure == true
                              ? Icon(
                                  Icons.visibility,
                                  color: ColorConstants.grey,
                                )
                              : Icon(
                                  Icons.visibility_off,
                                  color: ColorConstants.grey,
                                ),
                    ),
                    errorStyle: GoogleFonts.poppins(
                      color: ColorConstants.red,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.cyan),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.cyan),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.grey),
                    ),
                  ),
                  validator: (value) {
                    if (value != null && value.length >= 6) {
                      return null;
                    } else {
                      return "Enter a Valid Password";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText:
                      registrationScreenScreenState.confirmPasswordObscure,
                  cursorWidth: 2.3,
                  cursorColor: ColorConstants.cyan,
                  cursorRadius: Radius.circular(10),
                  controller: confirmPassController,
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus!.unfocus();
                  },
                  style: GoogleFonts.poppins(
                    color: ColorConstants.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: ColorConstants.grey,
                    ),
                    hintText: "Confirm your password",
                    hintStyle: GoogleFonts.poppins(
                      color: ColorConstants.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        ref
                            .read(registrationScreenProvider.notifier)
                            .showConfirmPassword();
                      },
                      child: registrationScreenScreenState
                                  .confirmPasswordObscure ==
                              true
                          ? Icon(
                              Icons.visibility,
                              color: ColorConstants.grey,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: ColorConstants.grey,
                            ),
                    ),
                    errorStyle: GoogleFonts.poppins(
                      color: ColorConstants.red,
                      fontWeight: FontWeight.w600,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.cyan),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.cyan),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.red),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide:
                          BorderSide(width: 2.3, color: ColorConstants.grey),
                    ),
                  ),
                  validator: (value) {
                    if (value == passController.text) {
                      return null;
                    } else {
                      return "Password doesn't match";
                    }
                  },
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      ref
                          .read(registrationScreenProvider.notifier)
                          .onRegistration(
                            emailController.text,
                            passController.text,
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: ColorConstants.green,
                          behavior: SnackBarBehavior.floating,
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(25),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                          ),
                          content: Text(
                            "Registration Success..!",
                            style: GoogleFonts.poppins(
                              fontSize: 15.7,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    } else {
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
                            "Registration Failed !",
                            style: GoogleFonts.poppins(
                              fontSize: 15.7,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorConstants.cyan,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: Text(
                      "Sign up",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign in",
                        style: GoogleFonts.poppins(
                          color: ColorConstants.cyan,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.3,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
