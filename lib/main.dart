import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/Features/auth/domain/use_cases/button_login.dart';
import 'package:test/Features/auth/domain/use_cases/button_signup.dart';
import 'package:test/Features/auth/presentation/manager/Singup_cubit/signup_cubit.dart';
import 'package:test/Features/auth/presentation/manager/cubit/login_cubit.dart';
import 'package:test/Features/auth/presentation/view/welcome.dart';
import 'package:test/core/utils/setup_service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(getIt.get<ButtonLogin>())),
        BlocProvider(create: (context) => SignupCubit(getIt.get<ButtonSignup>()),)
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Welcome()),
    );
  }
}
