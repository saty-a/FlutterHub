import 'package:flutter/material.dart';
import 'package:grocery/pages/Home.dart';

class LoginWidget extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff824df4),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(Icons.person),
          ],
        ),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 46,
                    fontFamily: 'Roboto',
                  ),
                ),
                SizedBox(height: 30.0),
                Image.asset(
                  'assets/images/boss.png', // Replace with your image path
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 40.0),
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Username",
                  ),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 26.0),
                Container(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                    child: Text("Submit"),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff824df4),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      ); // You can use the username for further processing
                    },
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
