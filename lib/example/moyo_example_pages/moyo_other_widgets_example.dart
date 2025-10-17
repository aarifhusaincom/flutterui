import 'package:flutter/material.dart';

import '../../flutterui/flutterui.dart';

class MoyoOtherWidgetsExample extends StatelessWidget {
  const MoyoOtherWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Flutter UI"), centerTitle: true),
      body: ListView(
        children: [
          WidgetHeading(
            heading: "All items/services",
            textButtonName: "View All",
          ),
          Row(
            spacing: 10,
            children: [
              CategoryChip(imageUrl: '', catName: 'Electrician'),
              CategoryChipClose(imageUrl: '', catName: 'Electrician'),
            ],
          ),
        ],
      ),
    );
  }
}
