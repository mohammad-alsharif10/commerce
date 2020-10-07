import 'package:commerce/util/constants.dart';
import 'package:commerce/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: getProportionateScreenHeight(46),
          width: getProportionateScreenWidth(46),
          padding: EdgeInsets.all(
            getProportionateScreenWidth(12),
          ),
          decoration: BoxDecoration(
            color: kSecondaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/Bell.svg"),
        ),
        Container(
          width: getProportionateScreenWidth(16),
          height: getProportionateScreenHeight(16),
          decoration: BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
            border: Border.all(
              width: getProportionateScreenWidth(2),
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
