import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterui/flutterui/flutterui.dart';

class MoyoListCardsExample extends StatelessWidget {
  const MoyoListCardsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MoyoColorBox.moyoScaffoldGradient,
      appBar: AppBar(title: Text("Flutter UI"), centerTitle: true),
      body: ListView(
        children: [
          UserServiceListCard(
            category: "Home",
            subCategory: "Cleaning",
            date: "Dec 07, 2025",
            dp: "https://picsum.photos/200/200",
            price: "250",
            duration: "4 hours",
            priceBy: "Hourly",
            providerCount: 7,
            status: "ongoing",

            onPress: () {
              log(" Card pressed");
            },
          ),
          ProviderServiceListCard(
            category: "Home",
            subCategory: "Cleaning",
            date: "Dec 07, 2025",
            dp: "https://picsum.photos/200/200",
            price: "250",
            duration: "4 hours",
            priceBy: "Hourly",
            providerCount: 7,
            status: "accepted",
            // status: "Time out",
            // status: "Bided",
            // status: "Completed",
            // status: "Cancelled",
            onPress: () {
              log(" Card pressed");
            },
          ),
        ],
      ),
    );
  }
}
