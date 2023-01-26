import 'package:hive_flutter/hive_flutter.dart';

class TemplateDataBase {
  List toDoTemplate = [];

  final _myBox = Hive.box("mybox");

  void createIntitialData() {
    toDoTemplate = ["ali", "hazar"];
  }

  void loadData() {
    toDoTemplate = _myBox.get("TODOTEMPLATE");
  }

  void updateDataBase() {
    _myBox.put("TODOTEMPLATE", toDoTemplate);
  }
}
