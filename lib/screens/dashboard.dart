import 'package:excercise2/components/employee_item.dart';
import 'package:excercise2/components/employee_sheet.dart';
import 'package:excercise2/models/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final employees = Provider.of<EmployeeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
        actions: [
          GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return EmployeeSheet();
                    });
              },
              child: Icon(Icons.add))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Employee List',
              textScaleFactor: 1.5,
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: employees.employeeList.length,
                    itemBuilder: (c, i) =>
                        EmployeeItem(employee: employees.employeeList[i])))
          ],
        ),
      ),
    );
  }
}
