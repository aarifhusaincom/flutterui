import 'package:flutter/material.dart';

import 'moyo_details_widgets_example.dart';
import 'moyo_list_cards_example.dart';
import 'moyo_other_widgets_example.dart';

export 'moyo_details_widgets_example.dart';
export 'moyo_list_cards_example.dart';
export 'moyo_other_widgets_example.dart';

class Moyo extends StatelessWidget {
  const Moyo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Moyo UI"), centerTitle: true),
      body: ListView(
        children: [
          _listTile(context, "List Cards", MoyoListCardsExample()),
          _listTile(context, "Details Widgets", MoyoDetailsWidgetsExample()),
          _listTile(context, "Other Widgets", MoyoOtherWidgetsExample()),
        ],
      ),
    );
  }

  Widget _listTile(BuildContext context, String title, Widget page) {
    return ListTile(
      leading: Icon(Icons.interests),
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
