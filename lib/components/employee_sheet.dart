import 'package:another_flushbar/flushbar.dart';
import 'package:excercise2/components/custom_button.dart';
import 'package:excercise2/components/custom_textfield.dart';
import 'package:excercise2/models/models.dart';
import 'package:excercise2/models/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeeSheet extends StatefulWidget {
  bool isEdit;
  Employee? emp;

  EmployeeSheet({this.emp, this.isEdit = false});

  @override
  _EmployeeSheetState createState() => _EmployeeSheetState();
}

class _EmployeeSheetState extends State<EmployeeSheet> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController designationController = new TextEditingController();
  TextEditingController salaryController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.isEdit) {
      nameController.text = widget.emp!.name;
      designationController.text = widget.emp!.designation;
      ageController.text = widget.emp!.age.toString();
      salaryController.text = widget.emp!.salary.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final employee = Provider.of<EmployeeProvider>(context, listen: false);
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Employee Details'),
            SizedBox(
              height: 5,
            ),
            CustomTextField(label: 'Name', controller: nameController),
            SizedBox(
              height: 5,
            ),
            CustomTextField(
              label: 'Age',
              controller: ageController,
              inputType: TextInputType.number,
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextField(
                label: 'Designation', controller: designationController),
            SizedBox(
              height: 5,
            ),
            CustomTextField(
                label: 'Salary',
                controller: salaryController,
                inputType: TextInputType.number),
            SizedBox(
              height: 10,
            ),
            CustomButton(
                label: widget.isEdit ? 'Update Employee' : 'Add Employee',
                onTap: () {
                  if (widget.isEdit) {
                    if (ageController.text.isNotEmpty &&
                        nameController.text.isNotEmpty &&
                        designationController.text.isNotEmpty &&
                        salaryController.text.isNotEmpty) {
                      Employee e = new Employee(
                          id: widget.emp!.id,
                          age: int.parse(ageController.text),
                          designation: designationController.text,
                          name: nameController.text,
                          salary: double.parse(salaryController.text));
                      employee.editEmployee(e);
                      Navigator.pop(context);
                    } else {
                      print('error');
                      Flushbar(
                        duration: Duration(seconds: 4),
                        flushbarPosition: FlushbarPosition.TOP,
                        title: "Error",
                        message: "One of the field value is missing",
                        backgroundColor: Colors.red,
                        boxShadows: [
                          BoxShadow(
                            color: Colors.red,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 3.0,
                          )
                        ],
                      )..show(context);
                    }
                  } else {
                    if (ageController.text.isNotEmpty &&
                        nameController.text.isNotEmpty &&
                        designationController.text.isNotEmpty &&
                        salaryController.text.isNotEmpty) {
                      Employee e = new Employee(
                          id: (employee.employeeList.isEmpty)
                              ? (employee.employeeList.length + 1).toString()
                              : (double.parse(employee.employeeList.last.id) +
                                      1)
                                  .toString(),
                          age: int.parse(ageController.text),
                          designation: designationController.text,
                          name: nameController.text,
                          salary: double.parse(salaryController.text));
                      employee.addEmployee(e);
                      Navigator.pop(context);
                    } else {
                      print('error');
                      Flushbar(
                        duration: Duration(seconds: 4),
                        flushbarPosition: FlushbarPosition.TOP,
                        title: "Error",
                        message: "One of the field value is missing",
                        backgroundColor: Colors.red,
                        boxShadows: [
                          BoxShadow(
                            color: Colors.red,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 3.0,
                          )
                        ],
                      )..show(context);
                    }
                  }
                })
          ],
        ),
      ),
    );
  }
}
