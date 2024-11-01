import 'package:flutter/material.dart';
import 'package:todo_list_app/presentation/login_screen/view/login_screen.dart';
import 'package:todo_list_app/utils/color_constants.dart';
import 'package:todo_list_app/utils/image_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then(
      (value) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Center(
        child: Image.asset(
          ImageConstants.TODO_LOGO,
          scale: 1.9,
        ),
      ),
    );
  }
}
