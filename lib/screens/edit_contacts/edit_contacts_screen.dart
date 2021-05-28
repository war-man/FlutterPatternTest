import 'package:flutter/material.dart';

import 'components/body.dart';

class EditContactsScreen extends StatelessWidget {
  static String routeName = "/editcontact";
  final int contactID;
  EditContactsScreen({this.contactID});
  @override
  Widget build(BuildContext context) {
    return Body(contactID: contactID);
  }
}
