import 'package:flutter/material.dart';

class EmployeesRowLayout extends StatelessWidget {
  final Widget rowNumber;
  final Widget lastName;
  final Widget firstName;
  final Widget patronymic;
  final Widget phoneNumber;

  const EmployeesRowLayout({
    super.key,
    required this.rowNumber,
    required this.lastName,
    required this.firstName,
    required this.patronymic,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 30, child: rowNumber),
          SizedBox(width: 150, child: lastName),
          SizedBox(width: 150, child: firstName),
          SizedBox(width: 150, child: patronymic),
          SizedBox(width: 150, child: phoneNumber),
        ],
      );
}
