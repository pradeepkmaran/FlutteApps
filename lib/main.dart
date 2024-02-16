import 'package:flutter/material.dart';
import 'package:flutterworkshop/show_quotes.dart';

main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "HomeScreen",
    home : HomePage(),
    routes: {
      '/quotes' : (context) => ShowQuotes(),
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int level = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("Quotes App",
            style: TextStyle(
                color: Colors.black
            )),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/img.png"),
                  radius: 50,
                )
            ),
            Divider(height: 50.0, color: Colors.grey,),
            Text(
              "Pradeep KM",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0
              )
            ),
            SizedBox(height: 10.0),
            Text(
              "Flutter Developer",
              style: TextStyle(
                color: Colors.amberAccent,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0),
            Text(
                "Current Level",
                style: TextStyle(
                    color: Colors.grey,
                    letterSpacing: 2.0
                )
            ),
            SizedBox(height: 10.0),
            Text(
              '$level',
              style: TextStyle(
                  color: Colors.amberAccent,
                  letterSpacing: 2.0,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                ),
                SizedBox(width: 15.0,),
                Text(
                  "pradeep2210432@ssn.edu.in",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                    letterSpacing: 1.0
                  ),
                )
              ],
            )
          ],
        )
      ),
        // bottomNavigationBar:  BottomNavigationBar( items: const [
        //   BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        //   BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        //   BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Accounts'),
        // ],
        //   currentIndex: _selectedIndex,
        //   onTap: _onItemTapped,
        //   backgroundColor: Colors.amberAccent,
        //   selectedItemColor: Colors.black,
        // ),

      bottomNavigationBar: NavigationBar(destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home", selectedIcon: Icon(Icons.home),),
        NavigationDestination(icon: Icon(Icons.question_answer_outlined), label: "Quotes", selectedIcon: Icon(Icons.question_answer),),
        NavigationDestination(icon: Badge(child: Icon(Icons.notifications_sharp)), label: "Notifications"),
      ],
        backgroundColor: Colors.amberAccent,
        indicatorColor: const Color.fromRGBO(10, 10, 10, 0.2),
        onDestinationSelected: (int index){
          setState(() {
            _selectedIndex = index;
            if(_selectedIndex==1){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowQuotes()));
              Navigator.pushNamed(context, '/quotes');
            }
          });
        },
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            // Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowQuotes()));
            setState(() {
              level+=1;
            });
          },
          backgroundColor: Colors.amberAccent,
          child: Icon(Icons.add, color: Colors.black,),
        ),
    );
  }
}
