import 'package:flutter/material.dart';
import 'package:flutterworkshop/quote_layout.dart';
import 'package:flutterworkshop/quotes.dart';

class ShowQuotes extends StatefulWidget {
  const ShowQuotes({super.key});

  @override
  State<ShowQuotes> createState() => _ShowQuotesState();
}

class _ShowQuotesState extends State<ShowQuotes> {

  List<Quotes> quotes=[
    Quotes(quoteText: "Naa oru thadava sonna.. Nooru thadava sonna madhri...", author: "Thalaivar"),
    Quotes(quoteText: "Vaazhkandradhu oru vattam da..", author: "Anil Nanbar"),
    Quotes(quoteText: "Kanna laddu thinna aasaya", author: "Karthi"),
    Quotes(quoteText: "Edhukkkuuu??", author: "JC")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar:  AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text(
          "Show Quotes",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: quotes.map((item) => QuoteLayout(quotes: item, delete: (){
            setState(() {
              quotes.remove(item);
            });
          })).toList(),
      ),
    );
  }
}
