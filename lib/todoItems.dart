import 'package:day1/modal/todo_items.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final onTodoChanged;
  final onDeleteItem;
  const TodoItem(
      {Key? key,
      required this.todo,
      required this.onDeleteItem,
      required this.onTodoChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onTodoChanged(todo);
        },
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: const Color.fromARGB(255, 252, 252, 252),
        leading: Icon(
            todo.isDone
                ? Icons.check_box
                : Icons.check_box_outline_blank_outlined,
            color: const Color.fromARGB(255, 4, 173, 61)),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            color: const Color.fromARGB(255, 0, 0, 0),
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            onPressed: () {
              onDeleteItem(todo.id);
            },
            color: Color.fromARGB(255, 255, 0, 0),
            iconSize: 25,
            icon: const Icon(Icons.delete),
            padding: const EdgeInsets.only(bottom: 8, right: 10),
          ),
        ),
      ),
    );
  }
}
