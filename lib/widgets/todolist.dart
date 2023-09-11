import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TextEditingController _textFieldController = TextEditingController();
  final List<Todo> _todos = <Todo>[];

  void _handleTodoChange(Todo todo) {
    setState(() {
      todo.checked = !todo.checked;
    });
  }

  void _addTodoItem(String name) {
    setState(() {
      _todos.add(Todo(name: name, checked: false));
    });

    _textFieldController.clear();
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a new todo item'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Type your new todo'),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _addTodoItem(_textFieldController.text);
                  },
                  child: const Text('Add'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: _todos.map((Todo todo) {
          return TodoItem(todo: todo, onTodoChanged: _handleTodoChange);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(),
        tooltip: 'Add Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final Todo todo;
  final void Function(Todo todo) onTodoChanged;

  const TodoItem({required this.todo, required this.onTodoChanged, super.key});

  TextStyle? _getTextStyle(bool checked) {
    if (!checked) return null;
    return const TextStyle(
        color: Colors.black54, decoration: TextDecoration.lineThrough);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTodoChanged(todo);
      },
      leading: CircleAvatar(
        child: Text(todo.name[0]),
      ),
      title: Text(
        todo.name,
        style: _getTextStyle(todo.checked),
      ),
    );
  }
}
