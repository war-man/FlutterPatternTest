// We use name route
// All our routes will be available here
import 'package:flutter/widgets.dart';
import 'package:untitled/auth/login_success/login_success_screen.dart';
import 'package:untitled/auth/sign_in/sign_in_screen.dart';
import 'package:untitled/screens/add_contacts/add_contacts_screen.dart';
import 'package:untitled/screens/home/home_screen.dart';

import 'screens/edit_contacts/edit_contacts_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SignInScreen.routeName: (context) => SignInScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  AddContactsScreen.routeName: (context) => AddContactsScreen(),
  EditContactsScreen.routeName: (context) => EditContactsScreen()
};
