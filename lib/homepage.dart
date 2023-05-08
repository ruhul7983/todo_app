import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/database.dart';
import 'package:to_do_app/tile_view.dart';
import 'package:to_do_app/uitil/alert_dialog.dart';
import 'package:hive_flutter/hive_flutter.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    //if the app first time open
    if(_myBox.get("TODOLIST") == null){
      db.createDatabase();
    }else{
      //there already exits
      db.loadData();
    }
    super.initState();
  }
  final _myBox = Hive.box('myBox');

  toDoDatabase db = toDoDatabase();

  //for text controller
  final _controller = TextEditingController();

  ChekBoxChanged(bool? value,int index){
    setState(() {
      db.todolist[index][1]=!db.todolist[index][1];
    });
    db.updateData();
  }
  //for on save
  onSaved(){
    setState(() {
      db.todolist.add([_controller.text,false]);
        _controller.clear();
    });
    Navigator.pop(context);
    db.updateData();

  }
  //for adding new task
  addingTask(){
    showDialog(context: context, builder: (context){
      return MyAlertDialog(onSave: onSaved, onCancel: Navigator.of(context).pop, controller: _controller,);
    });
  }
  //delete task
  deleteTask(int index){
    setState(() {
      db. todolist.removeAt(index);
    });
    db.updateData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(onPressed: addingTask,
      child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context,index){
          return TileView(taskName: db.todolist[index][0], tashComplete:db.todolist[index][1] , onChanged: (value)=>ChekBoxChanged(value,index), deleteFunction: (context)=>deleteTask(index),);
        },
      ),
    );
  }
}
