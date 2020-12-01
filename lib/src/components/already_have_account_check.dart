import 'package:elearningg/src/components/kprimary colors.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccount({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't have an Account ? " : "Already have an Account ?", style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

