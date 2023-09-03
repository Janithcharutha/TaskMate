import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../data/hometoday.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';
import '../data/database.dart';


class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final _myBox11 = Hive.box('mybox11');
  ToDoDataBase11 db11 = ToDoDataBase11();

  void initState() {

    if (_myBox11.get("TODOLIST11") == null) {
      db11.createInitialData11();
    } else {
      db11.loadData11();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged11(bool? value, int index) {
    setState(() {
      db11.toDoList11[index][1] = !db11.toDoList11[index][1];
    });
    db11.updateDataBase11();
  }


void createNewTask11() {
  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask11,
        onCancel: () => Navigator.of(context).pop(),
      );
    },
  );
}

void saveNewTask11() {
  setState(() {
    db11.toDoList11.add([_controller.text, false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
  db11.updateDataBase11();
}


  void deleteTask11(int index) {
    setState(() {
      db11.toDoList11.removeAt(index);
    });
    db11.updateDataBase11();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        title: Text('Shopping Item'),
        elevation: 0,
        backgroundColor: Colors.blueGrey[400],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask11,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db11.toDoList11.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db11.toDoList11[index][0],
            taskCompleted: db11.toDoList11[index][1],
            onChanged: (value) => checkBoxChanged11(value, index),
            deleteFunction: (context) => deleteTask11(index),
          );
        },
      ),
    );
  }
  }



