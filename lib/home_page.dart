import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterui/flutterui/card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Flutter UI"), centerTitle: true),
      body: ListView(
        children: [
          FlutterUiCard.aaspasShopListCard(
            verified: false,
            title: "Capital O 77828 Hotel Twinkle Regency",
            dp: "https://picsum.photos/200/200",
            distance: "13 KM",
            address:
                "Shop no. 1 usman patel complex haroon colony near choice bakery pakiza road Khajrana Indore 452016 Madhya Pradesh",
            onPress: () {
              log("Card pressed");
            },
          ),
          FlutterUiCard.aaspasServiceListCard(
            verified: false,
            title: "Sadik Pathan",
            dp: "https://images.unsplash.com/photo-1759431318039-0666f33d504b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            serviceCharge: 150,
            phone: "8890879707",
            onPress: () {},
          ),
        ],
      ),
    );
  }
}
