import 'package:excercise2/models/models.dart';
import 'package:flutter/material.dart';

class EmployeeProvider extends ChangeNotifier {
  List<Employee> employeeList = [];

  void addEmployee(Employee e) {
    employeeList.add(e);
    notifyListeners();
  }

  void editEmployee(Employee e) {
    int index = employeeList.indexWhere((element) => e.id == element.id);
    employeeList[index] = e;
    notifyListeners();
  }

  void removeEmployee(String id) {
    employeeList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
