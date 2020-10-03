import 'package:commerce/util/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormErrors extends StatelessWidget {
  const FormErrors({
    Key key,
    this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length,
        (index) => buildRowError(error: errors[index]),
      ),
    );
  }

  Row buildRowError({String error}) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/Error.svg",
          width: getProportionateScreenWidth(14),
          height: getProportionateScreenHeight(14),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error),
      ],
    );
  }
}
