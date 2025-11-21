import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/Features/auth/presentation/view/login_page.dart';
import 'package:test/Features/auth/presentation/view/signup_page.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset('assets/top.png'),
          Gap(40),
          Text(
            'Welcome!',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xff64C3BF),
              ),
            ),
          ),
          Text(
            'Find the things that you Love!',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 16, color: Color(0xff000000)),
            ),
          ),
          Gap(75),

          Image.asset('assets/welcome.png'),
          Gap(30),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => Signup()),
              );
            },
            child: Container(
              width: 199.63,
              height: 38.21,

              decoration: BoxDecoration(
                color: Color(0xff64C3BF),
                borderRadius: BorderRadius.circular(10),
              ),

              child: Center(
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Gap(20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (c) => Login()),
              );
            },
            child: Container(
              width: 199.63,
              height: 38.21,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xff64C3BF), width: 2),
              ),

              child: Center(
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontSize: 18,
                      color: Color(0xff64C3BF),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
