import 'package:afourthon/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/loginPage.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white10,
        primarySwatch: Colors.cyan,
        primaryColor: Colors.cyan,
      ),
      home: const LoginPage(),
    );
  }
}
