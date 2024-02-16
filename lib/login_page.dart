import 'package:flutter/material.dart';
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
              labelText: "Enter pw",
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(onPressed: () {
          // Add login actions
        },
            child: Text('Login'),
            style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 28),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
        ),
        SizedBox(height: 20,),
        TextButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage()));
        },
            child: Text("Dont have an account? Sign Up here!",
            style: TextStyle(
              fontSize: 18.0
            ),))

      ],
    );
  }
}


