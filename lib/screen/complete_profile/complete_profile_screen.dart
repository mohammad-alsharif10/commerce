import 'package:commerce/screen/complete_profile/component/complete_profile_body.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Complete Profile"),
        ),
        body: CompleteProfileBody(),
      ),
    );
  }
}
