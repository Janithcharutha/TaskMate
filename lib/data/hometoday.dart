import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase2 {
  List toDoList2 = [];

  // reference our box
  final _myBox2 = Hive.box('mybox2');

  // run this method if this is the 1st time ever opening this app
  void createInitialData2() {
    toDoList2 = [
      ["Add a New Task", false],
    ];
  }

  // load the data from database
  void loadData2() {
    toDoList2 = _myBox2.get("TODOLIST2");
  }

  // update the database
  void updateDataBase2() {
    _myBox2.put("TODOLIST2", toDoList2);
  }
}
//////////////////////////////////////////////////////////
class ToDoDataBase3 {
  List toDoList3 = [];

  // reference our box
  final _myBox3 = Hive.box('mybox3');

  // run this method if this is the 1st time ever opening this app
  void createInitialData3() {
    toDoList3 = [
      ["Add a New Task", false],
    ];
  }

  // load the data from database
  void loadData3() {
    toDoList3 = _myBox3.get("TODOLIST3");
  }

  // update the database
  void updateDataBase3() {
    _myBox3.put("TODOLIST3", toDoList3);
  }
}
/////////////////////////////////////////////////////////////
class ToDoDataBase4 {
  List toDoList4 = [];

  // reference our box
  final _myBox4 = Hive.box('mybox4');

  // run this method if this is the 1st time ever opening this app
  void createInitialData4() {
    toDoList4 = [
      ["Add a New Task", false],
    ];
  }

  // load the data from database
  void loadData4() {
    toDoList4 = _myBox4.get("TODOLIST4");
  }

  // update the database
  void updateDataBase4() {
    _myBox4.put("TODOLIST4", toDoList4);
  }
}
////////////////////////////////////////////////////////////
class ToDoDataBase5 {
  List toDoList5 = [];

  // reference our box
  final _myBox5 = Hive.box('mybox5');

  // run this method if this is the 1st time ever opening this app
  void createInitialData5() {
    toDoList5 = [

    ];
  }

  // load the data from database
  void loadData5() {
    toDoList5 = _myBox5.get("TODOLIST5");
  }

  // update the database
  void updateDataBase5() {
    _myBox5.put("TODOLIST5", toDoList5);
  }
}
/////////////////////////////////////////////////////////////
class ToDoDataBase6 {
  List toDoList6 = [];

  // reference our box
  final _myBox6 = Hive.box('mybox6');

  // run this method if this is the 1st time ever opening this app
  void createInitialData6() {
    toDoList6 = [


    ];
  }

  // load the data from database
  void loadData6() {
    toDoList6 = _myBox6.get("TODOLIST6");
  }

  // update the database
  void updateDataBase6() {
    _myBox6.put("TODOLIST6", toDoList6);
  }
}
/////////////////////////////////////////////
class ToDoDataBase7 {
  List toDoList7 = [];

  // reference our box
  final _myBox7 = Hive.box('mybox7');

  // run this method if this is the 1st time ever opening this app
  void createInitialData7() {
    toDoList7 = [


    ];
  }

  // load the data from database
  void loadData7() {
    toDoList7 = _myBox7.get("TODOLIST7");
  }

  // update the database
  void updateDataBase7() {
    _myBox7.put("TODOLIST7", toDoList7);
  }
}
class ToDoDataBase8 {
  List toDoList8 = [];

  // reference our box
  final _myBox8 = Hive.box('mybox8');

  // run this method if this is the 1st time ever opening this app
  void createInitialData8() {
    toDoList8 = [


    ];
  }

  // load the data from database
  void loadData8() {
    toDoList8 = _myBox8.get("TODOLIST8");
  }

  // update the database
  void updateDataBase8() {
    _myBox8.put("TODOLIST8", toDoList8);
  }
}