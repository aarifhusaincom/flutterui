import 'package:flutter/material.dart';

import 'aaspas_example_pages/aaspas.dart';
import 'moyo_example_pages/moyo.dart';

export 'aaspas_example_pages/aaspas.dart';
export 'moyo_example_pages/moyo.dart';

class ExampleHome extends StatelessWidget {
  const ExampleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Projects"), centerTitle: true),
      body: ListView(
        children: [
          listTile(
            context: context,
            title: "Aaspas Project",
            routeTo: Aaspas(),
          ),
          listTile(context: context, title: "Moyo Project", routeTo: Moyo()),
        ],
      ),
    );
  }

  /// build tile for listview

  Widget listTile({
    required BuildContext context,
    required String title,
    required Widget routeTo,
  }) {
    return ListTile(
      leading: Icon(Icons.work_outline),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => routeTo),
        );
      },
    );
  }
}
