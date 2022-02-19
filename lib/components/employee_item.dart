import 'package:excercise2/models/models.dart';
import 'package:excercise2/models/providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'employee_sheet.dart';

class EmployeeItem extends StatelessWidget {
  Employee employee;
  EmployeeItem({required this.employee});
  @override
  Widget build(BuildContext context) {
    final employees = Provider.of<EmployeeProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ' + employee.name),
                Text('Designation: ' + employee.designation),
                Text('Salary: ' + employee.salary.toString()),
                Text('Age: ' + employee.age.toString()),
              ],
            ),
            Row(
              children: [
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
                            return EmployeeSheet(
                              isEdit: true,
                              emp: employee,
                            );
                          });
                    },
                    child: Icon(Icons.edit)),
                GestureDetector(
                    onTap: () {
                      employees.removeEmployee(employee.id);
                    },
                    child: Icon(Icons.delete))
              ],
            )
          ],
        ),
      ),
    );
  }
}
