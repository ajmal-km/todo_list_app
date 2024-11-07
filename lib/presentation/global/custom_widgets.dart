import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_constants.dart';

class CustomWidgets {
  // Custom Snackbar :
  static customSnakbar(
      Color background, String snackbarContent, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: background,
        content: Text(
          snackbarContent,
          style: GoogleFonts.poppins(color: ColorConstants.white),
        ),
      ),
    );
  }

  // Custom Text Form Field :
  static TextFormField customTextFormField(
      {TextEditingController? txtController,
      bool hidden = false,
      String? hintTxt,
      IconData? prefix,
      IconData? suffix,
      void Function()? onSuffixTap,
      String? Function(String?)? txtValidator}) {
    return TextFormField(
      obscureText: hidden,
      cursorWidth: 2.3,
      cursorColor: ColorConstants.cyan,
      cursorRadius: Radius.circular(10),
      controller: txtController,
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
        prefixIcon: prefix == null
            ? null
            : Icon(
                Icons.lock,
                color: ColorConstants.grey,
              ),
        hintText: hintTxt,
        hintStyle: GoogleFonts.poppins(
          color: ColorConstants.black,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
        suffixIcon: InkWell(
          onTap: onSuffixTap,
          child: suffix == null
              ? null
              : Icon(
                  suffix,
                  color: ColorConstants.grey,
                ),
        ),
        errorStyle: GoogleFonts.poppins(
          color: ColorConstants.red,
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 2.3, color: ColorConstants.cyan),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 2.3, color: ColorConstants.cyan),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 2.3, color: ColorConstants.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(width: 2.3, color: ColorConstants.grey),
        ),
      ),
      validator: txtValidator,
    );
  }
}
