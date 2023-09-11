import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todolist.dart';
import 'package:todo_app/widgets/home_card.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.checklist)),
                Tab(icon: Icon(Icons.notifications_on)),
              ],
            ),
            title: const Text('My App'),
          ),
          body: const TabBarView(
            children: [Tab(icon: Icon(Icons.home)), TodoList(), HomeCard()],
          ),
        ),
      ),
    );
  }
}
