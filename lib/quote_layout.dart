import 'package:flutter/material.dart';
import 'package:flutterworkshop/quotes.dart';

class QuoteLayout extends StatelessWidget {
  // const QuoteLayout({super.key});

  final Quotes quotes;
  final VoidCallback delete;

  QuoteLayout({required this.quotes, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 14.0, 15.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quotes.quoteText,
              style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black
              ),
            ),
            const SizedBox(height: 2.0,),

            Text(
              quotes.author,
              style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black
              ),
            ),
            const SizedBox(height: 1.0,),
            TextButton.icon(
                onPressed: (){
                  delete();
                },
                icon: const Icon(Icons.delete),
                label: const Text("Delete Quote"))
          ],
        ),)
    );
  }
}
