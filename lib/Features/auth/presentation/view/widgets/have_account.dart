import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/Features/auth/presentation/view/login_page.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an Account? '),
        GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (C)=> Login()));
          },
          child: Text('Login' , style: GoogleFonts.inter(textStyle: TextStyle(
            color : Colors.blue,
          )),),
        ),
      ],
    );
  }
}