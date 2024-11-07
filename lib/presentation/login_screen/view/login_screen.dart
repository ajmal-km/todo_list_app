import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list_app/presentation/global/custom_widgets.dart';
import 'package:todo_list_app/presentation/home_screen/view/home_screen.dart';
import '../../../utils/color_constants.dart';
import '../../registration_screen/view/registration_screen.dart';
import '../controller/login_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginScreenState = ref.watch(loginScreenProvider);
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
                  "Welcome Back!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.7,
                  ),
                ),
                SizedBox(height: 30),
                // email input fied
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
                    hintText: "Your email",
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
                // password input field
                TextFormField(
                  obscureText: loginScreenState.isObscure,
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
                      onTap: () {
                        ref.read(loginScreenProvider.notifier).showPassword();
                      },
                      child: loginScreenState.isObscure == true
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: ColorConstants.grey),
                            ),
                            child: Icon(
                              Icons.check,
                              color: ColorConstants.blue,
                              size: 10,
                            ),
                          ),
                        ),
                        Text(
                          "Remember me",
                          style: GoogleFonts.poppins(
                            color: ColorConstants.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.5,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Forgot password",
                      style: GoogleFonts.poppins(
                        color: ColorConstants.cyan,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.5,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    int statusCode = await ref
                        .read(loginScreenProvider.notifier)
                        .onLogin(emailController.text, passController.text);
                    if (statusCode == 0) {
                      CustomWidgets.customSnakbar(
                          ColorConstants.green, "Login Sucess", context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    } else if (statusCode < 0) {
                      CustomWidgets.customSnakbar(ColorConstants.red,
                          "Please register to login!", context);
                    } else {
                      CustomWidgets.customSnakbar(
                          ColorConstants.red, "Invalid credentials", context);
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
                      "Sign in",
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
                      "Don't have an account?",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.3,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegistrationScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
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
