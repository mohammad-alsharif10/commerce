import 'package:commerce/screen/sign_in/component/sign_in_scaffold_body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
          textAlign: TextAlign.center,
        ),
      ),
      body: SignInScaffoldBody(),
    );
  }
}
