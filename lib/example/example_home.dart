import 'package:flutter/material.dart';

import 'aaspas_example_pages/aaspas.dart';

class ExampleHome extends StatelessWidget {
  const ExampleHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Projects"), centerTitle: true),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.work_outline),
            title: Text("Aaspas Project"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Aaspas()),
              );
            },
          ),
        ],
      ),
    );
  }
}
