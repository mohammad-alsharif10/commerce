import 'package:commerce/component/custom_suffix_icon.dart';
import 'package:commerce/component/default_button.dart';
import 'package:commerce/component/form_error.dart';
import 'package:commerce/component/no_account_text.dart';
import 'package:commerce/util/constants.dart';
import 'package:commerce/util/size_config.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatefulWidget {
  @override
  _ForgotPasswordFormState createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            buildEmailFormField(),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            FormErrors(
              errors: errors,
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                }
              },
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            NoAccountText(),
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) => email = newValue,
      onChanged: (value) => onChangeEmailValue(value),
      validator: (value) => emailValidator(value),
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter Your Email",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  String emailValidator(value) {
    if (value.isEmpty && !errors.contains(kEmailNullError)) {
      setState(() {
        errors.add(kEmailNullError);
      });
      return "";
    } else if (!emailValidatorRegExp.hasMatch(value) &&
        !errors.contains(kInvalidEmailError)) {
      setState(() {
        errors.add(kInvalidEmailError);
      });
      return "";
    }
    return null;
  }

  void onChangeEmailValue(value) {
    if (value.isNotEmpty && errors.contains(kEmailNullError)) {
      setState(() {
        errors.remove(kEmailNullError);
      });
    } else if (emailValidatorRegExp.hasMatch(value) &&
        errors.contains(kInvalidEmailError)) {
      setState(() {
        errors.remove(kInvalidEmailError);
      });
    }
  }
}
