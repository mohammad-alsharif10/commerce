import 'package:commerce/component/default_button.dart';
import 'package:commerce/component/form_error.dart';
import 'package:commerce/screen/forgot_password/forgot_password_screen.dart';
import 'package:commerce/screen/log_in_success/Log_in_success_screen.dart';
import 'package:commerce/util/constants.dart';
import 'package:commerce/util/size_config.dart';
import 'package:flutter/material.dart';

import '../../../component/custom_suffix_icon.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          FormErrors(
            errors: errors,
          ),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          Row(
            children: [
              Checkbox(
                activeColor: kPrimaryColor,
                value: rememberMe,
                onChanged: (value) => setState(() => rememberMe = value),
              ),
              Text("Remember Me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, LogInSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        onChangePasswordValue(value);
      },
      validator: (value) {
        return passwordValidator(value);
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter Your Password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"),
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

  void onChangePasswordValue(value) {
    if (value.isNotEmpty && errors.contains(kPassNullError)) {
      setState(() {
        errors.remove(kPassNullError);
      });
    } else if (value.length >= 8 && errors.contains(kShortPassError)) {
      setState(() {
        errors.remove(kShortPassError);
      });
    }
  }

  String passwordValidator(value) {
    if (value.isEmpty && !errors.contains(kPassNullError)) {
      setState(() {
        errors.add(kPassNullError);
      });
      return "";
    } else if (value.length < 8 && !errors.contains(kShortPassError)) {
      setState(() {
        errors.add(kShortPassError);
      });
      return "";
    }
    return null;
  }
}
