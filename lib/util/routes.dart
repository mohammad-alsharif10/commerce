import 'package:commerce/screen/complete_profile/complete_profile_screen.dart';
import 'package:commerce/screen/forgot_password/forgot_password_screen.dart';
import 'package:commerce/screen/log_in_success/Log_in_success_screen.dart';
import 'package:commerce/screen/otp/otp_screen.dart';
import 'package:commerce/screen/sign_in/sign_in_screen.dart';
import 'package:commerce/screen/sign_up/sign_up_screen.dart';
import 'package:commerce/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LogInSuccessScreen.routeName: (context) => LogInSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  // HomeScreen.routeName: (context) => HomeScreen(),
  // DetailsScreen.routeName: (context) => DetailsScreen(),
  // CartScreen.routeName: (context) => CartScreen(),
};
