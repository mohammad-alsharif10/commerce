import 'package:commerce/screen/home/component/notification_bell.dart';
import 'package:commerce/screen/home/component/search_products.dart';
import 'package:commerce/util/size_config.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20),
                  vertical: getProportionateScreenHeight(10)),
              child: Row(
                children: [
                  SearchProducts(),
                  NotificationBell(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
