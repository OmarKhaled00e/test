import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/Features/auth/presentation/view/signup_page.dart';

class DontAccount extends StatelessWidget {
  const DontAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don’t Have Account?'),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (C) => Signup()),
            );
          },
          child: Text(
            'Signup',
            style: GoogleFonts.inter(
              textStyle: TextStyle(color: Colors.blue),
            ),
          ),
        ),
        
      ],
    );
  }
}
