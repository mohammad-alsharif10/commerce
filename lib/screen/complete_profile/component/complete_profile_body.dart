import 'package:commerce/screen/complete_profile/component/complete_profile_form.dart';
import 'package:commerce/util/constants.dart';
import 'package:commerce/util/size_config.dart';
import 'package:flutter/material.dart';

class CompleteProfileBody extends StatelessWidget {
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
                "Complete Profile",
                style: headingStyle,
              ),
              Text(
                "Complete your details or continue \nwith social media",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              CompleteProfileForm(),
            ],
          ),
        ),
      ),
    );
  }
}
