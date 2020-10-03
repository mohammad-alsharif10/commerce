import 'package:commerce/screen/forgot_password/component/forgot_password_form.dart';
import 'package:commerce/util/size_config.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Forgot Your Password",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20),
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Please enter your email and we will send \nyou a link to return to your account",
            textAlign: TextAlign.center,
          ),
          ForgotPasswordForm(),
        ],
      ),
    );
  }
}
