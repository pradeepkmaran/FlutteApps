import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "HomeScreen",
    home : HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = '';
  List urls = [];
  String desc = '';

  void getAPIData() async {
    try{
      var response = await http.get(Uri.parse('https://dummyjson.com/products/1'));
      var resData = jsonDecode(response.body);
      setState(() {
        url = resData['thumbnail'];
        urls= resData['images'];
        desc = resData['description'];
      });
      print(resData);
    }
    catch(ex){
      print("Something went wrong: $ex");
    }
  }





  @override
  void initState(){
    print("I'm the starting method of this stateful widget..");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("API App"),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                getAPIData();
              }, child: Text("Show API Data")),
              Center(child: url.isNotEmpty? Image.network(url) : Text('Image not loaded')),
              SizedBox(height: 50,),
              Text(desc,
              style: TextStyle(
                color: Colors.black,
              ),),
              SizedBox(height: 50,),
              Column(
                children: urls.map((image_url) =>Image.network(image_url)).toList(),
              )
            ],
          ),
        ),
      )
    );
  }
}
