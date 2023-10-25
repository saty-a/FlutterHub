import 'package:flutter/material.dart';


import '../constants/constants.dart';

class ResetPass   extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            const Text (
              "Enter your Email Here",style: TextStyle(fontSize: 28,color: kLogTColour),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: kLogTextfiled,
                      border: Border.all(color: Colors.white54),
                      borderRadius: BorderRadius.circular(13)),
                  child: const TextField(
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 15)
                      //hintTextDirection: TextDirection.rtl,
                    ),
                  )),
            ),


          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 4,

          onPressed: () {},
          label: const Text("Submit"),
        ),
      ),
    );
  }
}
