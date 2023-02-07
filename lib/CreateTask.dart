import 'package:flutter/material.dart';

class createTask extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  createTask({super.key, required this.controller, required this.onSave}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30,),
        children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Task Name',
            ),
          ),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: onSave, child: Text('Submit')),
        ],
      ),
    );
  }
  // void SubmitData(){
  //
  // }
}
