import 'package:afourthon/screens/home.dart';
import 'package:afourthon/screens/loginPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../services/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final AuthServices authService = AuthServices();
  final TextEditingController kEmailController = TextEditingController();
  final TextEditingController kPasswordController = TextEditingController();
  final TextEditingController kNameController = TextEditingController();
  final TextEditingController kConfirmPass = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    kEmailController.dispose();
    kPasswordController.dispose();
    kNameController.dispose();
    kConfirmPass.dispose();
  }

  void signUpUser() {
    authService.registerUser(
      context: context,
      email: kEmailController.text,
      password: kPasswordController.text,
      name: kNameController.text,
      confirmPass: kConfirmPass.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Create Account",
                  style: TextStyle(
                      color: kLogTColour,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _signUpFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                  color: kLogTextfiled,
                                  border: Border.all(color: Colors.white54),
                                  borderRadius: BorderRadius.circular(13)),
                              child: TextFormField(
                                controller: kNameController,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter your UserName';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13)),
                                  labelText: 'UserName',
                                  labelStyle: const TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
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
                                  borderRadius: BorderRadius.circular(13)),
                              child: TextFormField(
                                controller: kEmailController,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter your Email';
                                  }
                                  return null;
                                },
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13)),
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
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
                                  borderRadius: BorderRadius.circular(13)),
                              child: TextFormField(
                                controller: kPasswordController,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter your password ';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13)),
                                  labelText: 'password',
                                  labelStyle: const TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
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
                                  borderRadius: BorderRadius.circular(13)),
                              child: TextFormField(
                                controller: kConfirmPass,
                                validator: (val) {
                                  if (val == null || val.isEmpty) {
                                    return 'Enter your password again';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13)),
                                  labelText: 'Confirm password',
                                  labelStyle: const TextStyle(
                                    color: Colors.redAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),

                                  //hintTextDirection: TextDirection.rtl,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "All Ready Have an Account  ",
                              style: TextStyle(color: kLogTColour),
                            ),
                            TextButton(
                              child: const Text("Login Here",
                                  style: TextStyle(color: Colors.blue)),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    (context),
                                    CupertinoPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              },
                            ),
                          ],
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.transparent)),
                            onPressed: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                                Navigator.pushReplacement(
                                    (context),
                                    CupertinoPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            },
                            child: Container(
                              height: 70,
                              width: MediaQuery.of(context).size.width / 2,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                gradient: const LinearGradient(
                                    colors: [Colors.redAccent, kLogTColour],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: Row(
                                children: const [
                                  Text("SignUp "),
                                  Icon(Icons.arrow_forward_ios)
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
