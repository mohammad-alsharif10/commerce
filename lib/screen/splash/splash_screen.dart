import 'package:commerce/screen/splash/widget/scaffold_body.dart';
import 'package:commerce/util/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: ScaffoldBody(),
    );
  }
}
