import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:yawwn/pages/authentication/authentication.dart';
import 'package:yawwn/pages/homepage.dart';
import 'package:yawwn/pages/instructions.dart';
import 'package:yawwn/pages/progress.dart';

import 'global_state/authentication_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => AuthenticationState(),
        builder: (context, _) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            textTheme: const TextTheme(
              headline1: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600),
              button: TextStyle(color: Colors.white),
              bodyText1: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
              bodyText2: TextStyle(
                  color: Colors.white,
                  height: 1.4,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            primaryColor: const Color(0xFF084FFF),
            backgroundColor: const Color(0xFF291467)),
        initialRoute: Authentication.route,
        routes: {
          MyHomePage.route: (context) => const MyHomePage(),
          Instructions.route: (context) => const Instructions(),
          Progress.route: (context) => const Progress(),
          Authentication.route: (context) => Consumer<AuthenticationState>(
              builder: (context, authState, _) => Authentication(
                    loginState: authState.loginState,
                    startLogin: authState.startLogin,
                    startRegister: authState.startRegister,
                  ))
        });
  }
}
