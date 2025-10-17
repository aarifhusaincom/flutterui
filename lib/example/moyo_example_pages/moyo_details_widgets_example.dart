import 'package:flutter/material.dart';

import '../../flutterui/flutterui.dart';

class MoyoDetailsWidgetsExample extends StatelessWidget {
  const MoyoDetailsWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Flutter UI"), centerTitle: true),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              color: Colors.brown,
              child: WidgetHeading(heading: "Services Details"),
            ),
          ),
          ServiceDetails(
            category: "Electrician",
            categoryBanner: "https://picsum.photos/200/500",
            dp: "https://picsum.photos/id/64/200/200",
            verified: true,
            name: "Andrew Siamond",
            age: 25,
            serviceCharge: 1000,
            area: 'Khajrana',
            city: "Indore",
            description:
            "गरीब नवाज केटरर्स | गोश्त कोरमा, बटर चिकन, माँडे, ब्रियानी, सीक कबाब, चिकन फ्राय | शादी व पार्टी मे सभी प्रकार का खाना बनाने का ऑर्डर लिया जाता है |",
            phone: "8890879707",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              color: Colors.brown,
              child: WidgetHeading(heading: "Shop Details"),
            ),
          ),
          ShopDetails(
            openTime: "10:00 AM",
            closeTime: "10:00 PM",
            weekDays: ["Monday", "Tuesday", "Thursday", "Friday"],
            shopName: "Hidayah Mobile and accessories",
            verified: true,
            area: "Khajrana",
            address:
            "Shop no. 1 usman patel complex haroon colony near choice bakery pakiza road Khajrana Indore 452016 Madhya Pradesh",
            shopType: ["Retails", "Wholesale", "Service"],
            distance: "13 KM",
            description:
            "गरीब नवाज केटरर्स | गोश्त कोरमा, बटर चिकन, माँडे, ब्रियानी, सीक कबाब, चिकन फ्राय | शादी व पार्टी मे सभी प्रकार का खाना बनाने का ऑर्डर लिया जाता है |",
            phone: "8890879707",
          ),
        ],
      ),
    );
  }
}
