import 'package:flutter/material.dart';

main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "HomeScreen",
    home : HomePage()
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App",
            style: TextStyle(
                color: Colors.white
            )),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Center(
          child:
          ElevatedButton.icon(
            onPressed: () {
              print("Hi");
            },
            // child: const Text("Press me"),
            label: const Text("Hi"),
            icon: Icon(Icons.ac_unit),

          )

          // TextButton(
          //     onPressed: () {
          //       print("I have been clicked");
          //     },
          //     child: const Text("Press",
          //     style: TextStyle(
          //       color: Colors.white,
          //       backgroundColor: Colors.indigo
          //     )))
          // Image.asset('assets/img.png'),

          // Image(
          //   image: AssetImage('assets/img1.jpeg'),
          // )

          // Image(
          //   image: NetworkImage("https://th.bing.com/th/id/OIP.azAM52kkUEjxllEKoblt4wAAAA?rs=1&pid=ImgDetMain"),
          //   height: 1500,
          // )

          // Icon(
          //   Icons.account_balance,
          //   size: 50,
          //   color: Colors.amberAccent,
          // )

          // Text("This is the home screen",
          // style: TextStyle(
          //   color: Colors.black,
          //   // fontWeight: FontWeight.bold,
          //   // letterSpacing: 2,
          //   // fontStyle: FontStyle.italic,
          //   fontFamily: 'Mukta-Bold',
          //   // backgroundColor: Colors.indigo
          //   fontSize: 18
          // ))
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.access_time_filled_sharp,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}
