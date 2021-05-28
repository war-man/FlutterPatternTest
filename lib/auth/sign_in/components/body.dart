import 'package:flutter/material.dart';
import 'package:untitled/auth/components/no_account_text.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Column(
        children: <Widget>[
          SignForm(),
        ],
      ),
    );
  }
}
