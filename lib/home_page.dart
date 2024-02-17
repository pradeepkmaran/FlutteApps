import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Menu"),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount:2,
          itemBuilder: (context, index){
            return Padding(padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: CardView(item: 'Mix Veg', price: '100', delete: (){}, update: (){}),
            );
          }
          )
    );
  }
}

class CardView extends StatelessWidget {
  final String item;
  final String price;
  final VoidCallback delete;
  final VoidCallback update;
  const CardView({required this.item, required this.price, required this.delete, required this.update});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Icon(Icons.currency_rupee, color: Colors.black,),
                  Text(price, style: TextStyle(fontSize: 16),)
                ],
              )
            ],
          ),),
          Padding(padding: EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.delete, color: Colors.red,)
              ),
              SizedBox(width: 20.0,),
              IconButton(
                  onPressed: (){

                  },
                  icon: Icon(Icons.update, color: Colors.green,)
              ),
            ],
          )
            ,)
        ],
      )
    );
  }
}

