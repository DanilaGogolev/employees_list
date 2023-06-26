import 'package:flutter/material.dart';
import 'package:user_list/src/features/employees_list/screens/widgets/employees_row_layout.dart';
import 'package:user_list/src/models/employee.dart';

class EmployeesListItem extends StatelessWidget {
  final String rowNumber;
  final Employee employee;
  final VoidCallback? onTap;

  const EmployeesListItem({
    super.key,
    required this.rowNumber,
    required this.employee,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: EmployeesRowLayout(
          rowNumber: Text(rowNumber),
          lastName: Text(employee.lastName),
          firstName: Text(employee.firstName),
          patronymic: Text(employee.patronymic),
          phoneNumber: Text(employee.phoneNumber),
        ),
      );
}
