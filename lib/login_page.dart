// import 'dart:js_interop';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterworkshop/db/database.dart';
import 'package:flutterworkshop/home_page.dart';
import 'package:flutterworkshop/signup_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
          backgroundColor: Colors.amberAccent,
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: LoginForm(),
        )
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: emailController,
          decoration: InputDecoration(
            labelText: "Enter email",
            prefixIcon: Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          ),
        ),
        SizedBox(height: 20,),
        TextField(
          controller: pwController,
          decoration: InputDecoration(
              labelText: "Enter password",
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(onPressed: () async {
          // Add login actions
          String email = emailController.text;
          String pw = pwController.text;
          if(email.isNotEmpty && pw.isNotEmpty){
            List<Map<String, dynamic>> loginResult = await DatabaseHelper.instance.querySingleUser(email, pw);
            if(loginResult.isNotEmpty){
              print(loginResult);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
            }
            else{
              print("Sign up or Enter correct details");
              showAlert('AppSays', "Sign up or Enter correct details!");
            }
          }
          else{
            print("Enter all details");
            showAlert('AppSays', "Enter all required details!");
          }
        },
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 28),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
          child: const Text('Login'),
        ),
        const SizedBox(height: 20,),
        TextButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
            child: const Text("Dont have an account? Sign Up here!",
              style: TextStyle(
                fontSize: 18.0
              ),
            )
        )
      ],
    );
  }

  // This function is to show alert dialogs
  showAlert(String alertName, String text){
    String actionBtn = "OK";
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text(alertName),
        content: Text(text),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              child: Text(actionBtn))
        ],
      );
    }
    );
  }

}


