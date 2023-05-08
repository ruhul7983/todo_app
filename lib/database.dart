import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class toDoDatabase{

  List todolist = [];

  final _myBox = Hive.box('myBox');

  createDatabase(){
    todolist = [
      ["Do homework",false],
      ["Go out for exercise",false],
    ];
  }

  loadData (){
    todolist = _myBox.get("TODOLIST");
  }

  updateData(){
    //update data for
    _myBox.put("TODOLIST", todolist);
  }

}