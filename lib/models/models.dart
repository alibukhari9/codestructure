import 'package:flutter/services.dart';

class Employee {
  String id, name, designation;
  double salary;
  int age;

  Employee(
      {required this.id,
      required this.age,
      required this.designation,
      required this.name,
      required this.salary});
}
