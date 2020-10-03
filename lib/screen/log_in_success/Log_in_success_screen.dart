import 'package:commerce/screen/log_in_success/component/log_in_success_body.dart';
import 'package:flutter/material.dart';

class LogInSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: LogInSuccessBody(),
    );
  }
}
