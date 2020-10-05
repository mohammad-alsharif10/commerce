import 'package:commerce/component/custom_suffix_icon.dart';
import 'package:commerce/component/default_button.dart';
import 'package:commerce/component/form_error.dart';
import 'package:commerce/screen/complete_profile/complete_profile_screen.dart';
import 'package:commerce/util/constants.dart';
import 'package:commerce/util/size_config.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  String confirmPassword;

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          buildRepeatPasswordFormField(),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          FormErrors(
            errors: errors,
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          )
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

  TextFormField buildRepeatPasswordFormField() {
    return TextFormField(
      onSaved: (newValue) => confirmPassword = newValue,
      onChanged: (value) {
        onChangeRepeatPasswordValue(value);
      },
      validator: (value) {
        return passwordRepeatValidator(value);
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Repeat Your Password",
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
    email = value;
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
    password = value;
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

  void onChangeRepeatPasswordValue(value) {
    if (value.isNotEmpty) {
      removeError(error: kPassNullError);
    }
    if (password == value) {
      removeError(error: kMatchPassError);
    }
    confirmPassword = value;
  }

  String passwordRepeatValidator(value) {
    if (value.isEmpty) {
      addError(error: kPassNullError);
      return "";
    } else if ((password != value)) {
      addError(error: kMatchPassError);
      return "";
    }
    return null;
  }
}
