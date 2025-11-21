import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/Features/auth/presentation/manager/cubit/login_cubit.dart';
import 'package:test/Features/auth/presentation/view/widgets/custom_button.dart';
import 'package:test/Features/auth/presentation/view/widgets/custom_text_field.dart';
import 'package:test/Features/auth/presentation/view/widgets/dont_account.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              key: formKey,
              child: Column(
                children: [
                  Image.asset('assets/top.png'),
                  Gap(20),
                  Text(
                    'Welcome!',
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff64C3BF),
                      ),
                    ),
                  ),
                  Text(
                    'Login',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                  Gap(20),
                  Image.asset('assets/welcome.png', width: 320),
                  Gap(20),

                  // Email field
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Email',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  Gap(15),

                  // Password field
                  CustomTextField(
                    controller: passwordController,
                    hintText: 'Password',

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  Gap(8),

                  Padding(
                    padding: const EdgeInsets.only(left: 250),
                    child: Text(
                      'Forget Password?',
                      style: const TextStyle(color: Color(0xff64C3BF)),
                    ),
                  ),
                  Gap(10),

                  // Login Button with BlocConsumer
                  BlocConsumer<LoginCubit, LoginState>(
                    listener: (context, state) {
                      if (state is LoginFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(state.errMasagge)),
                        );
                      } else if (state is LoginSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Login successful!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                        // مثال: الانتقال للصفحة الرئيسية
                        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is LoginLoading;
                      return isLoading
                          ? CupertinoActivityIndicator(color: Colors.white)
                          : CustomButton(
                              text: "Login",
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<LoginCubit>().login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                            );
                    },
                  ),
                  const SizedBox(height: 20),
                  DontAccount(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
