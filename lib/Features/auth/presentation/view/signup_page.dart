import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/Features/auth/presentation/manager/Singup_cubit/signup_cubit.dart';
import 'package:test/Features/auth/presentation/view/login_page.dart';
import 'package:test/Features/auth/presentation/view/widgets/custom_button.dart';
import 'package:test/Features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:test/Features/auth/presentation/view/widgets/have_account.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Image.asset('assets/top.png'),
                  Gap(40),
                  Text(
                    'Create Account',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff64C3BF),
                      ),
                    ),
                  ),
                  Text(
                    'Enter your Personal Data',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Gap(40),

                  // name
                  CustomTextField(
                    controller: nameController,
                    hintText: 'Name',
                    validator: (value) {
                      if (value!.isEmpty) return "Enter your name";
                      return null;
                    },
                  ),
                  Gap(15),

                  // email
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    validator: (value) {
                      if (value!.isEmpty) return "Enter email";
                      if (!value.contains("@")) return "Email not valid";
                      return null;
                    },
                  ),
                  Gap(15),

                  // password
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',
                    validator: (value) {
                      if (value!.isEmpty) return "Enter password";
                      if (value.length < 6)
                        return "Password must be at least 6 chars";
                      return null;
                    },
                  ),
                  Gap(15),

                  // confirm
                  CustomTextField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    validator: (value) {
                      if (value!.isEmpty) return "Confirm password";
                      if (value != passwordController.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  Gap(15),

                  // ============================
                  //   BlocConsumer هنا مهم
                  // ============================
                  BlocConsumer<SignupCubit, SignupState>(
                    listener: (context, state) {
                      if (state is SignupFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errMassage)),
                        );
                      } else if (state is SignupSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Account created successfully!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        // مثال: الانتقال للصفحة التالية
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Login()));
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is SignupLoading;

                      return isLoading
                          ? CupertinoActivityIndicator(color: Colors.blue)
                          : CustomButton(
                              text: "Signup",
                              onTap: () {
                                if (formkey.currentState!.validate()) {
                                  context.read<SignupCubit>().Signup(
                                    name: nameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                            );
                    },
                  ),

                  Gap(20),
                  HaveAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
