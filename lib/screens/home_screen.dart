import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hompage')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement button.
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}