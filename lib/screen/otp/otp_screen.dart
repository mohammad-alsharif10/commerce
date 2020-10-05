import 'package:commerce/screen/otp/component/otp_body.dart';
import 'package:commerce/util/size_config.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: OtpBody(),
    );
  }
}
