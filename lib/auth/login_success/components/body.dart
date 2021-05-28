import 'package:flutter/material.dart';
import 'dart:math';
import 'package:untitled/auth/components/default_button.dart';
import 'package:untitled/auth/providers/auth_client.dart';
import 'package:untitled/size_config.dart';
import 'package:untitled/screens/home/home_screen.dart';

class Body extends StatelessWidget {
  ToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    print(SizeConfig.screenHeight);
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          "assets/images/success.png",
          height: SizeConfig.screenHeight * 0.4,
          width: SizeConfig.screenWidth, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Go to home",
            press: () {
              ToHomeScreen(context);
            },
          ),
        ),
        Spacer(),
      ],
    );
  }
}
