import 'package:flutter/material.dart';
import 'package:flutterworkshop/login_page.dart';

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "HomeScreen",
    home : LoginPage(),
  ));
}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
