import 'dart:math' hide log;
import 'dart:developer';
import 'package:flutter/material.dart';

class Selectcards extends StatefulWidget {
  const Selectcards({super.key});

  @override
  State<Selectcards> createState() => _SelectcardsState();
}

class _SelectcardsState extends State<Selectcards> {
  @override
  Widget build(BuildContext context) {
    List<String> cards = ["♥", "♦", "♠", "♣", "🃏"];
    List<String> currentCards = ["❔", "❔", "❔"];
    String result = "";
    void selectCards() {
      setState(() {
        Random random = Random();
        for (int i = 0; i < 3; i++) {
          currentCards[i] = cards[random.nextInt(5)];

          if (currentCards[i] == '🃏') {
            result = "🃏 The Joker is in there!";
          }
        }
      });
    }

    void reset() {
      setState(() {
        currentCards = ["❔", "❔", "❔"];
        result = "";
      });
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              Text(currentCards[0], style: TextStyle(fontSize: 60)),
              Text(currentCards[1], style: TextStyle(fontSize: 60)),
              Text(currentCards[2], style: TextStyle(fontSize: 60)),
            ],
          ),
          SizedBox(height: 60),
          result == ""
              ? SizedBox(height: 10)
              : Text(result, style: TextStyle(fontSize: 30)),
          SizedBox(height: 60),
          ElevatedButton(
            onPressed: selectCards,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
            child: Text("Select Cards"),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: reset,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            child: Text("Reset", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
