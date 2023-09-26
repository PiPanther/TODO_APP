import 'package:flutter/material.dart';
import 'package:day1/todoItems.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:day1/modal/todo_items.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _todoController = TextEditingController();
  final todolist = Todo.todolist();
  List<Todo> _foundTodo = [];

  int getDaysLeft() {
    final currentDate = DateTime.now();
    final endOfYear = DateTime(2024, 5, 5);
    return endOfYear.difference(currentDate).inDays;
  }

  void _addTodoitem(String todo) {
    setState(() {
      todolist.add(
        Todo(id: DateTime.now().millisecond.toString(), todoText: todo),
      );
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<Todo> results = [];
    if (enteredKeyword.isEmpty) {
      results = todolist;
    } else {
      results = todolist
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundTodo = results;
    });
  }

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteItem(String id) {
    setState(() {
      todolist.removeWhere((item) => item.id == id);
    });
  }

  @override
  void initState() {
    _foundTodo = todolist;
    super.initState();
  }

  @override
  Widget build(t) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 201, 236, 219),
      appBar: CalendarAppBar(
        // black: Colors.amber,
        onDateChanged: (value) => print(value),
        firstDate: DateTime.now().subtract(const Duration(days: 140)),
        lastDate: DateTime.now(),
        backButton: false,
        padding: 10.0,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Days left for the D-Day : ${getDaysLeft()}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextField(
                    onChanged: (value) => _runFilter(value),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 20,
                      ),
                      prefixIconConstraints:
                          BoxConstraints(maxHeight: 20, minWidth: 25),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 20),
                        child: Text(
                          'All Todos',
                          style: TextStyle(
                              color: Colors.green.shade900,
                              fontSize: 32,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      for (Todo todo in _foundTodo)
                        TodoItem(
                          todo: todo,
                          onTodoChanged: _handleTodoChange,
                          onDeleteItem: _deleteItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.greenAccent[200]!,
                          offset: const Offset(
                            0.0,
                            0.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                        hintText: 'Add a new Todo item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: const EdgeInsets.only(bottom: 20, right: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _addTodoitem(_todoController.text);
                    },
                    child: const Text(
                      '+',
                      style: TextStyle(
                        fontSize: 40,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 35, 84, 220),
                      minimumSize: Size(60, 60),
                      elevation: 10,
                      shape: const CircleBorder(),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
