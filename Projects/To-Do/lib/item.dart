import 'package:flutter/material.dart';

import 'model.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final Function onTap;
  final Function onDelete;
  const ToDoItem(
      {Key? key,
      required this.todo,
      required this.onDelete,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListTile(
        onTap: () {
          onTap(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: todo.isDone
            ? const Icon(
                Icons.check_box,
                color: Colors.blue,
              )
            : const Icon(
                Icons.check_box_outline_blank,
                color: Colors.blue,
              ),
        title: Text(
          "${todo.text}",
          style: todo.isDone
              ? const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  fontSize: 20,
                )
              : const TextStyle(
                  fontSize: 20,
                ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          color: Colors.red,
          child: IconButton(
            onPressed: () {
              onDelete(todo.id);
            },
            color: Colors.white,
            icon: const Icon(Icons.delete),
            iconSize: 18,
          ),
        ),
      ),
    );
  }
}
