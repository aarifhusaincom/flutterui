import 'package:flutter/material.dart';
import 'package:flutterui/example/aaspas_example_pages/aaspas_other_widgets_example.dart';

import 'aaspas_details_widgets_example.dart';
import 'aaspas_list_cards_example.dart';

class Aaspas extends StatelessWidget {
  const Aaspas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Aaspas UI"), centerTitle: true),
      body: ListView(
        children: [
          _listTile(context, "List Cards", AaspasListCardsExample()),
          _listTile(context, "Details Widgets", AaspasDetailsWidgetsExample()),
          _listTile(context, "Other Widgets", AaspasOtherWidgetsExample()),
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
