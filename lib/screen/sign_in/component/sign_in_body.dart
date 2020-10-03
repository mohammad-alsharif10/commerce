import 'package:commerce/component/no_account_text.dart';
import 'package:commerce/component/social_card.dart';
import 'package:commerce/screen/sign_in/component/sign_form.dart';
import 'package:commerce/util/size_config.dart';
import 'package:flutter/material.dart';

class SignInScaffoldBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome BacK",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \nor continue with social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                SignInForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialCard(
                      press: () {},
                      icon: "assets/icons/facebook-2.svg",
                    ),
                    SocialCard(
                      press: () {},
                      icon: "assets/icons/google-icon.svg",
                    ),
                    SocialCard(
                      press: () {},
                      icon: "assets/icons/twitter.svg",
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(18)),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
