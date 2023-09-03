import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/database.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';
import 'Onbording/Onbording.dart';
import 'data/hometoday.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('mybox');
  final _myBox2 = Hive.box('mybox2');
  final _myBox3 = Hive.box('mybox3');
  final _myBox4 = Hive.box('mybox4');
  final _myBox5 = Hive.box('mybox5');
  final _myBox6 = Hive.box('mybox6');
  final _myBox7 = Hive.box('mybox7');
  final _myBox8 = Hive.box('mybox8');
  // final _myBox9 = Hive.box('mybox9');

//shopping

  ToDoDataBase db = ToDoDataBase();
  ToDoDataBase2 db2 = ToDoDataBase2();
  ToDoDataBase3 db3 = ToDoDataBase3();
  ToDoDataBase4 db4 = ToDoDataBase4();
  ToDoDataBase5 db5 = ToDoDataBase5();
  ToDoDataBase6 db6 = ToDoDataBase6();
  ToDoDataBase7 db7 = ToDoDataBase7();
  ToDoDataBase8 db8 = ToDoDataBase8();
  // ToDoDataBase9 db9 = ToDoDataBase9();



  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    ////////////////////////////////////////////////////////////////////////
    if (_myBox2.get("TODOLIST2") == null) {
      db2.createInitialData2();
    } else {
      db2.loadData2();
    }
    if (_myBox3.get("TODOLIST3") == null) {
      db3.createInitialData3();
    } else {
      db3.loadData3();
    }
    if (_myBox4.get("TODOLIST4") == null) {
      db4.createInitialData4();
    } else {
      db4.loadData4();
    }
    if (_myBox5.get("TODOLIST5") == null) {
      db5.createInitialData5();
    } else {
      db5.loadData5();
    }
    if (_myBox6.get("TODOLIST6") == null) {
      db6.createInitialData6();
    } else {
      db6.loadData6();
    }
    if (_myBox7.get("TODOLIST7") == null) {
      db7.createInitialData7();
    } else {
      // there already exists data
      db7.loadData7();
    }
    if (_myBox8.get("TODOLIST8") == null) {
      db8.createInitialData8();
    } else {
      // there already exists data
      db8.loadData8();
    }

    // if (_myBox9.get("TODOLIST9") == null) {
    //   db9.createInitialData9();
    // } else {
    //   // there already exists data
    //   db9.loadData9();
    // }
    ////////////////////////////////////////////////////////////////////////
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // tese2
  void checkBoxChanged2(bool? value, int index) {
    setState(() {
      db2.toDoList2[index][1] = !db2.toDoList2[index][1];
    });
    db2.updateDataBase2();
  }

  void checkBoxChanged3(bool? value, int index) {
    setState(() {
      db3.toDoList3[index][1] = !db3.toDoList3[index][1];
    });
    db3.updateDataBase3();
  }

  void checkBoxChanged4(bool? value, int index) {
    setState(() {
      db4.toDoList4[index][1] = !db4.toDoList4[index][1];
    });
    db4.updateDataBase4();
  }

  void checkBoxChanged5(bool? value, int index) {
    setState(() {
      db5.toDoList5[index][1] = !db5.toDoList5[index][1];
    });
    db5.updateDataBase5();
  }

  void checkBoxChanged6(bool? value, int index) {
    setState(() {
      db6.toDoList6[index][1] = !db6.toDoList6[index][1];
    });
    db6.updateDataBase6();
  }

  void checkBoxChanged7(bool? value, int index) {
    setState(() {
      db7.toDoList7[index][1] = !db7.toDoList7[index][1];
    });
    db7.updateDataBase7();
  }

  void checkBoxChanged8(bool? value, int index) {
    setState(() {
      db8.toDoList8[index][1] = !db8.toDoList8[index][1];
    });
    db8.updateDataBase8();
  }

  // void checkBoxChanged9(bool? value, int index) {
  //   setState(() {
  //     db9.toDoList9[index][1] = !db9.toDoList9[index][1];
  //   });
  //   db9.updateDataBase9();
  // }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // tese2
  void saveNewTask2() {
    setState(() {
      db2.toDoList2.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db2.updateDataBase2();
  }

  void saveNewTask3() {
    setState(() {
      db3.toDoList3.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db3.updateDataBase3();
  }

  void saveNewTask4() {
    setState(() {
      db4.toDoList4.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db4.updateDataBase4();
  }

  void saveNewTask5() {
    setState(() {
      db5.toDoList5.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db5.updateDataBase5();
  }

  void saveNewTask6() {
    setState(() {
      db6.toDoList6.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db6.updateDataBase6();
  }

  void saveNewTask7() {
    setState(() {
      db7.toDoList7.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db7.updateDataBase7();
  }

  void saveNewTask8() {
    setState(() {
      db8.toDoList8.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db8.updateDataBase8();
  }

  //
  // void saveNewTask9() {
  //   setState(() {
  //     db9.toDoList9.add([_controller.text, false]);
  //     _controller.clear();
  //   });
  //   Navigator.of(context).pop();
  //   db9.updateDataBase9();
  // }


  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // tese 2
  void createNewTask2() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask2,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void createNewTask3() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask3,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void createNewTask4() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask4,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void createNewTask5() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask5,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void createNewTask6() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask6,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void createNewTask7() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask7,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void createNewTask8() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask8,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //
  // void createNewTask9() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return DialogBox(
  //         controller: _controller,
  //         onSave: saveNewTask9,
  //         onCancel: () => Navigator.of(context).pop(),
  //       );
  //     },
  //   );
  // }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  // tese 2
  void deleteTask2(int index) {
    setState(() {
      db2.toDoList2.removeAt(index);
    });
    db2.updateDataBase2();
  }

  void deleteTask3(int index) {
    setState(() {
      db3.toDoList3.removeAt(index);
    });
    db3.updateDataBase3();
  }

  void deleteTask4(int index) {
    setState(() {
      db4.toDoList4.removeAt(index);
    });
    db4.updateDataBase4();
  }

  void deleteTask5(int index) {
    setState(() {
      db5.toDoList5.removeAt(index);
    });
    db5.updateDataBase5();
  }

  void deleteTask6(int index) {
    setState(() {
      db6.toDoList6.removeAt(index);
    });
    db6.updateDataBase6();
  }

  void deleteTask7(int index) {
    setState(() {
      db7.toDoList7.removeAt(index);
    });
    db7.updateDataBase7();
  }

  void deleteTask8(int index) {
    setState(() {
      db8.toDoList8.removeAt(index);
    });
    db8.updateDataBase8();
  }
  //
  // void deleteTask9(int index) {
  //   setState(() {
  //     db9.toDoList9.removeAt(index);
  //   });
  //   db9.updateDataBase9();
  // }

  /////////////////////////////////////////////

  ////////////////////////////////////////////

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 55,
          title: Text("TaskMate"),
          backgroundColor: Colors.blueGrey[400],
          centerTitle: true,
          // brightness: Brightness.dark,
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.yellowAccent,
            onPressed: () {
              Navigator.of(context).pushNamed('/menu');
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              color: Colors.yellowAccent,
              onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('showHome', false);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Onbording()),
                );
              },
            ),
            IconButton(
                icon: Icon(Icons.account_circle_outlined),
                color: Colors.yellowAccent,
                onPressed: () {
                  // Navigator.of(context).pushNamed('/second');
                  Navigator.of(context).pushNamed('/login');
                })
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(35),
            child: TabBar(
              labelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(fontSize: 15),
              unselectedLabelColor: Colors.yellowAccent,
              indicatorColor: Colors.black,
              isScrollable: true,
              tabs: tabs,
              indicatorPadding: EdgeInsets.all(5),
              indicator: BoxDecoration(
                  border: Border.all(color: Colors.yellow),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding:  EdgeInsets.only(left: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/Shoping');
                },
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.blue,
                // Set the background color
                foregroundColor: Colors.black,
                // Set the icon color
                elevation: 2.0,
                // Set the elevation
                highlightElevation: 4.0,
              ),
              Expanded(child: Container()),
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/calandar');
                },
                child: Icon(
                  Icons.calendar_month_outlined,
                  size: 50,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                backgroundColor: Colors.blue,
                // Set the background color
                foregroundColor: Colors.black,
                // Set the icon color
                elevation: 2.0,
                // Set the elevation
                highlightElevation: 4.0,
              ),
            ],
          ),
        ),
        body: Stack(children: [
          TabBarView(
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Today...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {
                              createNewTask();
                            },
                            icon: Icon(
                              Icons.add_circle_sharp,
                              size: 40,
                              color: Colors.yellowAccent,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 0),
                          )
                        ],
                      ),
                      height: 40,
                      // padding: EdgeInsets.all(10),
                      // width: double.infinity,
                      color: Colors.blueGrey,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: db.toDoList.length,
                        itemBuilder: (context, index) {
                          return ToDoTile(
                            taskName: db.toDoList[index][0],
                            taskCompleted: db.toDoList[index][1],
                            onChanged: (value) => checkBoxChanged(value, index),
                            deleteFunction: (context) => deleteTask(index),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Tomorrow...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {
                              createNewTask2();
                            },
                            icon: Icon(
                              Icons.add_circle_sharp,
                              size: 40,
                              color: Colors.yellow,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 0),
                          )
                        ],
                      ),
                      height: 40,
                      // padding: EdgeInsets.all(10),
                      // width: double.infinity,
                      color: Colors.blueGrey,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: db2.toDoList2.length,
                        itemBuilder: (context, index) {
                          return ToDoTile(
                            taskName: db2.toDoList2[index][0],
                            taskCompleted: db2.toDoList2[index][1],
                            onChanged: (value) =>
                                checkBoxChanged2(value, index),
                            deleteFunction: (context) => deleteTask2(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Today...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {
                              createNewTask3();
                            },
                            icon: Icon(
                              Icons.add_circle_sharp,
                              size: 40,
                              color: Colors.yellow,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 0),
                          )
                        ],
                      ),
                      height: 40,
                      // padding: EdgeInsets.all(10),
                      // width: double.infinity,
                      color: Colors.blueGrey,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: db3.toDoList3.length,
                        itemBuilder: (context, index) {
                          return ToDoTile(
                            taskName: db3.toDoList3[index][0],
                            taskCompleted: db3.toDoList3[index][1],
                            onChanged: (value) =>
                                checkBoxChanged3(value, index),
                            deleteFunction: (context) => deleteTask3(index),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Tomorrow...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {
                              createNewTask4();
                            },
                            icon: Icon(
                              Icons.add_circle_sharp,
                              size: 40,
                              color: Colors.yellow,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 0),
                          )
                        ],
                      ),
                      height: 40,
                      // padding: EdgeInsets.all(10),
                      // width: double.infinity,
                      color: Colors.blueGrey,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: db4.toDoList4.length,
                        itemBuilder: (context, index) {
                          return ToDoTile(
                            taskName: db4.toDoList4[index][0],
                            taskCompleted: db4.toDoList4[index][1],
                            onChanged: (value) =>
                                checkBoxChanged4(value, index),
                            deleteFunction: (context) => deleteTask4(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Today...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {
                              createNewTask5();
                            },
                            icon: Icon(
                              Icons.add_circle_sharp,
                              size: 40,
                              color: Colors.yellow,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 0),
                          )
                        ],
                      ),
                      height: 40,
                      // padding: EdgeInsets.all(10),
                      // width: double.infinity,
                      color: Colors.blueGrey,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: db5.toDoList5.length,
                        itemBuilder: (context, index) {
                          return ToDoTile(
                            taskName: db5.toDoList5[index][0],
                            taskCompleted: db5.toDoList5[index][1],
                            onChanged: (value) =>
                                checkBoxChanged5(value, index),
                            deleteFunction: (context) => deleteTask5(index),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Tomorrow...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {
                              createNewTask6();
                            },
                            icon: Icon(
                              Icons.add_circle_sharp,
                              size: 40,
                              color: Colors.yellow,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 0),
                          )
                        ],
                      ),
                      height: 40,
                      // padding: EdgeInsets.all(10),
                      // width: double.infinity,
                      color: Colors.blueGrey,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: db6.toDoList6.length,
                        itemBuilder: (context, index) {
                          return ToDoTile(
                            taskName: db6.toDoList6[index][0],
                            taskCompleted: db6.toDoList6[index][1],
                            onChanged: (value) =>
                                checkBoxChanged6(value, index),
                            deleteFunction: (context) => deleteTask6(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Today...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {
                              createNewTask7();
                            },
                            icon: Icon(
                              Icons.add_circle_sharp,
                              size: 40,
                              color: Colors.yellow,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 0),
                          )
                        ],
                      ),
                      height: 40,
                      // padding: EdgeInsets.all(10),
                      // width: double.infinity,
                      color: Colors.blueGrey,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: db7.toDoList7.length,
                        itemBuilder: (context, index) {
                          return ToDoTile(
                            taskName: db7.toDoList7[index][0],
                            taskCompleted: db7.toDoList7[index][1],
                            onChanged: (value) =>
                                checkBoxChanged7(value, index),
                            deleteFunction: (context) => deleteTask7(index),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Tomorrow...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {
                              createNewTask8();
                            },
                            icon: Icon(
                              Icons.add_circle_sharp,
                              size: 40,
                              color: Colors.yellow,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 0),
                          )
                        ],
                      ),
                      height: 40,
                      // padding: EdgeInsets.all(10),
                      // width: double.infinity,
                      color: Colors.blueGrey,
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: db8.toDoList8.length,
                        itemBuilder: (context, index) {
                          return ToDoTile(
                            taskName: db8.toDoList8[index][0],
                            taskCompleted: db8.toDoList8[index][1],
                            onChanged: (value) =>
                                checkBoxChanged8(value, index),
                            deleteFunction: (context) => deleteTask8(index),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 3,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Today All",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              size: 30,
                              color: Colors.yellow,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 0),
                          )
                        ],
                      ),
                      height: 40,
                      // padding: EdgeInsets.all(10),
                      // width: double.infinity,
                      color: Colors.blueGrey,
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Flexible(
                            child: ListView.builder(
                              itemCount: db.toDoList.length,
                              itemBuilder: (context, index) {
                                return ToDoTile(
                                  taskName: db.toDoList[index][0],
                                  taskCompleted: db.toDoList[index][1],
                                  onChanged: (value) =>
                                      checkBoxChanged(value, index),
                                  deleteFunction: (context) =>
                                      deleteTask(index),
                                );
                              },
                            ),
                          ),
                          Divider(),
                          Flexible(
                            child: ListView.builder(
                              itemCount: db3.toDoList3.length,
                              itemBuilder: (context, index) {
                                return ToDoTile(
                                  taskName: db3.toDoList3[index][0],
                                  taskCompleted: db3.toDoList3[index][1],
                                  onChanged: (value) =>
                                      checkBoxChanged3(value, index),
                                  deleteFunction: (context) =>
                                      deleteTask3(index),
                                );
                              },
                            ),
                          ),
                          Divider(),
                          Flexible(
                            child: ListView.builder(
                              itemCount: db5.toDoList5.length,
                              itemBuilder: (context, index) {
                                return ToDoTile(
                                  taskName: db5.toDoList5[index][0],
                                  taskCompleted: db5.toDoList5[index][1],
                                  onChanged: (value) =>
                                      checkBoxChanged5(value, index),
                                  deleteFunction: (context) =>
                                      deleteTask5(index),
                                );
                              },
                            ),
                          ),
                          Divider(),
                          Flexible(
                            child: ListView.builder(
                              itemCount: db7.toDoList7.length,
                              itemBuilder: (context, index) {
                                return ToDoTile(
                                  taskName: db7.toDoList7[index][0],
                                  taskCompleted: db7.toDoList7[index][1],
                                  onChanged: (value) =>
                                      checkBoxChanged7(value, index),
                                  deleteFunction: (context) =>
                                      deleteTask7(index),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Tomorrow All",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_vert,
                              size: 30,
                              color: Colors.yellow,
                            ),
                            padding: EdgeInsets.symmetric(vertical: 0),
                          )
                        ],
                      ),
                      height: 40,
                      // padding: EdgeInsets.all(10),
                      // width: double.infinity,
                      color: Colors.blueGrey,
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Flexible(
                            child: ListView.builder(
                              itemCount: db2.toDoList2.length,
                              itemBuilder: (context, index) {
                                return ToDoTile(
                                  taskName: db2.toDoList2[index][0],
                                  taskCompleted: db2.toDoList2[index][1],
                                  onChanged: (value) =>
                                      checkBoxChanged2(value, index),
                                  deleteFunction: (context) =>
                                      deleteTask2(index),
                                );
                              },
                            ),
                          ),
                          Divider(),
                          Flexible(
                            child: ListView.builder(
                              itemCount: db4.toDoList4.length,
                              itemBuilder: (context, index) {
                                return ToDoTile(
                                  taskName: db4.toDoList4[index][0],
                                  taskCompleted: db4.toDoList4[index][1],
                                  onChanged: (value) =>
                                      checkBoxChanged4(value, index),
                                  deleteFunction: (context) =>
                                      deleteTask4(index),
                                );
                              },
                            ),
                          ),
                          Divider(),
                          Flexible(
                            child: ListView.builder(
                              itemCount: db6.toDoList6.length,
                              itemBuilder: (context, index) {
                                return ToDoTile(
                                  taskName: db6.toDoList6[index][0],
                                  taskCompleted: db6.toDoList6[index][1],
                                  onChanged: (value) =>
                                      checkBoxChanged6(value, index),
                                  deleteFunction: (context) =>
                                      deleteTask6(index),
                                );
                              },
                            ),
                          ),
                          Divider(),
                          Flexible(
                            child: ListView.builder(
                              itemCount: db8.toDoList8.length,
                              itemBuilder: (context, index) {
                                return ToDoTile(
                                  taskName: db8.toDoList8[index][0],
                                  taskCompleted: db8.toDoList8[index][1],
                                  onChanged: (value) =>
                                      checkBoxChanged8(value, index),
                                  deleteFunction: (context) =>
                                      deleteTask8(index),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Container(
              //   color: Colors.yellowAccent[200],
              //   child: Text('add more'),
              // ),
            ],
          ),
        ]),
      ),
    );
  }
}

List<Tab> tabs = [
  Tab(
    child: Container(
      child: Text('Education'),
      height: 20,
    ),
  ),
  Tab(
    child: Container(
      child: Text('Work'),
      height: 20,
    ),
  ),
  Tab(
    child: Container(
      child: Text('Job'),
      height: 20,
    ),
  ),
  Tab(
    child: Container(
      child: Text('GYM'),
      height: 20,
    ),
  ),
  Tab(
    child: Container(
      child: Text('Default'),
      height: 20,
    ),
  ),
  // Tab(
  //   child: IconButton(
  //     onPressed: () {
  //
  //     },
  //     icon: Icon(Icons.more_vert),
  //   ),
  // ),
];
