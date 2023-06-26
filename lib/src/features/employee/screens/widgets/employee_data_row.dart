import 'package:flutter/material.dart';
import 'package:user_list/src/features/employee/screens/widgets/row_layout.dart';

class EmployeeDataRow extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;

  const EmployeeDataRow({
    super.key,
    required this.title,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) => RowLayout(
        title: title,
        child: TextField(
          controller: textEditingController,
        ),
      );
}
