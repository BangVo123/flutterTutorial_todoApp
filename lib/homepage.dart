import 'package:flutter/material.dart';
import 'package:flutter_app_todo/CreateTask.dart';
import 'package:flutter_app_todo/data.dart';
import 'package:flutter_app_todo/todo_list.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // the 1st opening the app, create default data
    if(_myBox.get('TODOLIST') == null){
      db.createDefaultData();
    }else{
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  // List todoList = [
  //   ['Todo List', false],
  //   ['Add', true],
  // ];

  //click into checkbox
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateData();
}

//save new task
  void SaveNewTask(){
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //Uppdate task
  void Update(int index){
    setState(() {
      Navigator.pop(context);
      db.todoList[index][0] = _controller.text;
      _controller.clear();
    });
    db.updateData();
  }

//create a new task
  createTask createNewTask( {required void onSave}){
    // showDialog(context: context, builder: (context){
    //   return DialogBox(
    //     controller: _controller,
    //     onSave: SaveNewTask,
    //     onCancel: ()=> Navigator.of(context).pop(),
    //   );
    //   },
    // );
    return createTask(
      onSave: SaveNewTask,
      controller: _controller,
    );
  }

  //delete task
  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 30,),
        backgroundColor: Colors.lightBlue,
        onPressed: /*createNewTask*/ NavigateAddScreen,
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index){
          return TodoTitle(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            DeleteTask: (context)=> deleteTask(index),
            controller: _controller,
            onUpdate: ()=> Update(index),

          );
        },
      ),
    );
  }

  void NavigateAddScreen(){
    final route = MaterialPageRoute(builder: (context) => createTask(
      controller: _controller,
      onSave: SaveNewTask,));
    Navigator.push(context, route);
  }
}

