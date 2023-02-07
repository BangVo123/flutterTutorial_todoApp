import 'package:flutter/material.dart';
import 'package:flutter_app_todo/EditTask.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTitle extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? DeleteTask;
  final controller;
  Function() onUpdate;

  TodoTitle({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.DeleteTask,
    required this.controller,
    required this.onUpdate,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: DeleteTask,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black54,
              ),
              Text(
                  taskName,
                  // style: TextStyle(
                  //     decoration:
                  //      TextDecoration.lineThrough ),
              ),
              Expanded(child: Container()),
                TextButton(
                  child: Text('Edit',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  onPressed:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditScreen(
                            controller: controller,
                            onUpdate: onUpdate,
                          ),
                      ),
                    );
                  }
                ),
            ],
          ),
        ),
      ),
    );
  }
}
