import 'package:commerce/component/social_card.dart';
import 'package:commerce/screen/sign_up/component/sign_up_form.dart';
import 'package:commerce/util/constants.dart';
import 'package:commerce/util/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              Text(
                "Register Account",
                style: headingStyle,
              ),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              SignUpForm(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
