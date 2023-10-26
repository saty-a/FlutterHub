import 'package:afourthon/screens/ForgetPass.dart';
import 'package:afourthon/screens/home.dart';
import 'package:afourthon/screens/regestrationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isVisible =false;
  final AuthServices authService = AuthServices();
  final _signInFormKey = GlobalKey<FormState>();
  bool isApiCall = false;
  bool hidepass = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? pass;
  String? username;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signInUser() {
    authService.signInUser(
      context: context,
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key: _signInFormKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                      decoration: BoxDecoration(
                          backgroundBlendMode: BlendMode.lighten,
                          gradient: const LinearGradient(
                            // radius: 0.7,
                            colors: [
                              Colors.redAccent,
                              kLogTColour,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),

                          // color: kLogTColour,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(width / 3),
                              bottomLeft: Radius.circular(width / 3))),
                      child: Center(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(50)),
                          child: const Icon(
                            Icons.android,
                            color: kLogTColour,
                            size: 80,
                          ),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment(-1, -1),
                  child: Flexible(
                      flex: 1,
                      child: Text(
                        "Hello, \nWelcome Again",
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: kLogTColour),
                      )),
                ),
                const SizedBox(
                  height: 10,
                  child: Divider(
                    thickness: 2,
                    color: Colors.redAccent,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: kLogTextfiled,
                                  border: Border.all(color: Colors.white54),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter your Email';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelText: "Email",
                                    labelStyle: const TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    )
                                    //hintTextDirection: TextDirection.rtl,
                                    ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: kLogTextfiled,
                                  border: Border.all(color: Colors.white54),
                                  borderRadius: BorderRadius.circular(20)),
                              child: TextFormField(
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter your UserName';
                                  }
                                  return null;
                                },
                                controller: passwordController,
                                obscureText: true,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: const TextStyle(
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20))
                                    //hintTextDirection: TextDirection.rtl,
                                    ),
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't Have an Account? ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kLogTColour),
                            ),
                            TextButton(
                              child: const Text(
                                "Register Here ",
                                style: TextStyle(color: Colors.blue),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const RegisterScreen()));
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => const ResetPass()));
                          },
                          child: const Text(
                            "Forget Password ",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.transparent)),
                            onPressed: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
                                Navigator.pushReplacement(
                                    (context),
                                    CupertinoPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 30, horizontal: 50),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                        colors: [Colors.redAccent, kLogTColour],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight),
                                    //test color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("SignIn"),
                                      Icon(Icons.arrow_forward_ios)
                                    ],
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
