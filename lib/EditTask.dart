import 'package:flutter/material.dart';

class EditScreen extends StatelessWidget {
  final controller;
  VoidCallback onUpdate;
  EditScreen({
    super.key,
    required this.controller,
    required this.onUpdate,
});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Todo List'
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30,),
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Input new task name',
            ),
          ),
          const SizedBox(height: 15,),
          ElevatedButton(
              child: Text('Submit'),
              onPressed: onUpdate,
          ),
        ],
      ),
    );
  }
}
