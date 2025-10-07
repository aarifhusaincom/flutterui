import 'dart:developer';

import 'package:flutter/material.dart';

import 'flutterui/flutterui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Flutter UI"), centerTitle: true),
      body: ListView(
        children: [
          ShopListCard(
            anyJob: true,
            verified: true,
            title: "Capital O 77828 Hotel Twinkle Regency",
            dp: "https://picsum.photos/200/200",
            distance: "13 KM",
            address:
                "Shop no. 1 usman patel complex haroon colony near choice bakery pakiza road Khajrana Indore 452016 Madhya Pradesh",
            onPress: () {
              log("Shop Card pressed");
            },
          ),
          ServiceListCard(
            verified: true,
            title: "Sadik Pathan",
            dp: "https://images.unsplash.com/photo-1759431318039-0666f33d504b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            serviceCharge: 150,
            category: "Cleaning Service",
            area: "Vijay Nagar ",
            phone: "8890879707",
            onPress: () {
              log("Service Card pressed");
            },
          ),
          PropertyListCard(
            noAnyBroker: true,
            verified: true,
            title: "₹ 8 Lakh /-",
            dp: "https://images.unsplash.com/photo-1759431318039-0666f33d504b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
            totalArea: 12000,
            itemType: "1 BHK House",
            area: "Vijay Nagar ",
            city: "Indore",
            phone: "8890879707",
            onPress: () {
              log("Property Card pressed");
            },
          ),
        ],
      ),
    );
  }
}
