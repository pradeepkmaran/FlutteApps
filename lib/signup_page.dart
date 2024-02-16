import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("SignUp Page"),
            backgroundColor: Colors.amberAccent,
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.all(20.0),
            child: SignUpForm(),
          )
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
        ),SizedBox(height: 20,),
        TextField(
          controller: pwController,
          decoration: InputDecoration(
              labelText: "Confirm pw",
              prefixIcon: Icon(Icons.lock),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(onPressed: () {
          // Add SignUp actions
        },
          child: Text('SignUp'),
          style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 28),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )),)
      ],
    );
  }
}


