import 'package:flutter/material.dart';
import 'package:grocery/pages/Fruits.dart';
import 'package:grocery/pages/Home.dart';
import 'package:grocery/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Grocery App';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/images/grocery.png',
              width: 300,
            ),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: Text(
              'We offer groceries at your Door Step',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            decoration: BoxDecoration(),
          ),
          ButtonTheme(
            height: 100,
            minWidth: 200,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginWidget()),
                  );
                },
                child: Text('Get Started'),
                style: ElevatedButton.styleFrom(
                  // Define the button style properties
                  primary: Color(0xff8835ed), // Button background color
                  onPrimary: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(
                      vertical: 26, horizontal: 30), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Button border radius
                  ),
                )),
          )
        ],
      )),
    );
  }
}
