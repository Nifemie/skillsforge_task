import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly/models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;
  String? _newTaskContent;
  Box? _box;

  @override
  void initState() {
    super.initState();
    _initializeHive();
  }

Future<void> _initializeHive() async {
  await Hive.openBox('tasks');
  setState(() {}); // Refresh UI after box is opened
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        toolbarHeight: _deviceHeight * 0.15,
        title: const Text(
          "Taskly!",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: _tasksView(),
      floatingActionButton: _addTaskButton(context),
    );
  }

Widget _tasksView() {
  return FutureBuilder(
    future: Hive.openBox('tasks'),
    builder: (BuildContext _context, AsyncSnapshot _snapshot) {
    if ( _snapshot.hasData) {
      _box = _snapshot.data;
      return _tasksList();

    }else {
      return const Center (
        child : CircularProgressIndicator(),);
    }
  },);
}

  Widget _tasksList() {
    List tasks = _box!.values.toList();
    return ListView.builder(itemCount: tasks.length,itemBuilder: (BuildContext _context, int _index) {
      var task = Task.fromMap(tasks[_index]);
      return ListTile(
          title: Text(
            task.content,
            style: TextStyle(
              decoration: task.done ? TextDecoration.lineThrough : null
            ),
          ),
          subtitle: Text(
            task.timestamp.toString(),
          ),
          trailing: Icon(
            task.done ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
            color: Colors.red,
          ),
          onTap: () {
            task.done = !task.done;
            _box!.putAt(_index, task.toMap(),);
            setState(() {

            });
          },
          onLongPress: () {
            _box!.deleteAt(_index);
            setState(() {
              
            });
          },
      );
    },);
    
    
    
  }
  Widget _addTaskButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _displayTaskPopup(context),
      child: const Icon(Icons.add),
    );
  }

  void _displayTaskPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add a New Task"),
          content: TextField(
            onSubmitted: (_) {
              if (_newTaskContent != null) {
                var _task = Task(content: _newTaskContent!, timestamp: DateTime.now(), done: false);
                _box!.add(_task.toMap());
                setState(() {
                  _newTaskContent = null;
                  Navigator.pop(context);
                });
              }
            },
            onChanged: (_value) {
              setState(() {
                _newTaskContent = _value;
              });
            },
          ),
        );
      },
    );
  }
}
