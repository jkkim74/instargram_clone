import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instargram Clone"
          ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
