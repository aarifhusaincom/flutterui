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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            FlutterUiCard.whatsappChat(
              title: "This is title",
              dp: "https://picsum.photos/200/200",
              lastMessageTime: "Yesterday",
              isSeen: true,
              unreadMessages: 4,
            ),
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
          ],
        ),
      ),
    );
  }
}
