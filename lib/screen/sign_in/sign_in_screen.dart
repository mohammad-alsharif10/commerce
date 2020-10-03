import 'package:commerce/screen/sign_in/component/sign_in_body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign In",
            textAlign: TextAlign.center,
          ),
        ),
        body: SignInScaffoldBody(),
      ),
    );
  }
}
