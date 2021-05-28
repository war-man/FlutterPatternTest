import 'package:flutter/material.dart';

import 'components/body.dart';

class AddContactsScreen extends StatelessWidget {
  static String routeName = "/addcontact";
  final int contactID;
  AddContactsScreen({this.contactID});
  @override
  Widget build(BuildContext context) {
    print(contactID);
    return Body(contactID: contactID);
  }
}
