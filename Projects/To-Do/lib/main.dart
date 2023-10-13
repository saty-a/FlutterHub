import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/item.dart';
import 'model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static List<ToDo> todoList = [];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _todoController = TextEditingController();
  List<ToDo> _finalToDo = [];

  @override
  void initState() {
    _finalToDo = HomePage.todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEEFF5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.menu,
              size: 30,
              color: Color(0xFF3A3A3A),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              width: 12,
              height: 12,
            )
          ],
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFFEEEFF5),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(0),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 25,
                      ),
                      prefixIconConstraints: BoxConstraints(
                        maxHeight: 20,
                        minWidth: 25,
                      ),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(),
                    ),
                    onChanged: (value) {
                      _searchbar(value);
                    },
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 50,
                          bottom: 25,
                        ),
                        child: const Text(
                          "To-Do's",
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      ),
                      for (ToDo item in _finalToDo)
                        ToDoItem(
                          todo: item,
                          onTap: _ontapitem,
                          onDelete: _ondeleteitem,
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
                      left: 20,
                      bottom: 20,
                      right: 20,
                    ),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _todoController,
                      decoration: const InputDecoration(
                          hintText: "Enter New Item",
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                  ),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      _addnewitem(_todoController.text);
                    },
                    child: const Text(
                      "+",
                      style: TextStyle(
                        fontSize: 32,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _ontapitem(ToDo item) {
    setState(() {
      item.isDone = !item.isDone;
    });
  }

  void _ondeleteitem(String id) {
    setState(() {
      HomePage.todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addnewitem(String todo) {
    setState(() {
      HomePage.todoList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        text: todo,
      ));
    });
    _todoController.clear();
  }

  void _searchbar(String keyword) {
    List<ToDo> results = [];
    if (keyword.isEmpty) {
      results = HomePage.todoList;
    } else {
      results = HomePage.todoList
          .where((item) =>
              item.text!.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _finalToDo = results;
    });
  }
}
