class Todo {
  String? id;
  String? todoText;
  bool isDone;

  Todo({required this.id, required this.todoText, this.isDone = false});

  static List<Todo> todolist() {
    return [
      Todo(
        id: '01',
        todoText: 'Morning Excercise',
        isDone: true,
      ),
      Todo(
        id: '02',
        todoText: 'Buy Groceries',
        isDone: true,
      ),
      Todo(
        id: '03',
        todoText: 'Yoga',
      ),
      Todo(
        id: '04',
        todoText: 'Listen to a Podcast',
      ),
      Todo(
        id: '05',
        todoText: 'Make schedule for tomorrow',
      ),
      Todo(
        id: '06',
        todoText: 'Chill',
      ),
    ];
  }
}
