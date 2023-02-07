import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase{

  List todoList = [];

  final _myBox = Hive.box('mybox');

  //the 1st ever opening this app
  void createDefaultData(){
    todoList = [
      ['Make Tutorial', false],
      ['Do exercise', false]
    ];
  }

  void loadData(){
    todoList = _myBox.get('TODOLIST');
  }

  void updateData(){
    _myBox.put("TODOLIST", todoList);
  }

}

