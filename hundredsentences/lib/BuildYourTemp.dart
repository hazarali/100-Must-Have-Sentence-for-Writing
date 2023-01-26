import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hundredsentences/data/database.dart';
import 'package:hundredsentences/utility/creatingnewtemplate.dart';
import 'package:hundredsentences/utility/todo_tile.dart';

class BuildYourTemplate extends StatefulWidget {
  const BuildYourTemplate({Key? key}) : super(key: key);

  @override
  State<BuildYourTemplate> createState() => _BuildYourTemplateState();
}

class _BuildYourTemplateState extends State<BuildYourTemplate> {
  final _controller = TextEditingController();

  final _myBox = Hive.box("mybox");
  TemplateDataBase db = TemplateDataBase();

  void initState() {
    if (_myBox.get("TODOTEMPLATE") == null) {
      db.createIntitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  void saveNewTemplate() {
    setState(() {
      db.toDoTemplate.add(_controller.text);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTemplatess() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTemplate,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
    //db.updateDataBase();
  }

  void deleteTemplate(int index) {
    setState(() {
      db.toDoTemplate.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Text("Build Your Template"),
        backgroundColor: Colors.black12,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: db.toDoTemplate.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoTemplate[index],
              deleteFunction: (context) => deleteTemplate(index),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTemplatess,
        child: Icon(
          Icons.add,
        ),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
