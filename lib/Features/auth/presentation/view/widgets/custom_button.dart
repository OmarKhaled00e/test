import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.text});
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 199.63,
        height: 38.21,

        decoration: BoxDecoration(
          color: Color(0xff64C3BF),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 18, color: Color(0xffFFFFFF)),
            ),
          ),
        ),
      ),
    );
  }
}
