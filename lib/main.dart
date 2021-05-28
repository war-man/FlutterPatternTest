import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/auth/sign_in/sign_in_screen.dart';
import 'package:untitled/core/providers/phone_provider.dart';
import 'package:untitled/routes.dart';
import 'package:untitled/theme.dart';
import 'package:untitled/auth/providers/user_provider.dart';

void main() {
  print('Start App...');
  runApp(MyApp());
  print('Exit App...');
  ;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PhoneProvider>(
          create: (BuildContext context) {
            return PhoneProvider();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Test",
        theme: theme(),
        initialRoute: SignInScreen.routeName,
        routes: routes,
      ),
    );
  }
}
