import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_list/src/features/employee/screens/widgets/row_layout.dart';
import 'package:user_list/src/utils/email_validator.dart';

class EmployeeDataRowForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String title;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;

  const EmployeeDataRowForm({
    super.key,
    required this.title,
    required this.textEditingController,
    this.inputFormatters,
    this.validator,
  });

  @override
  Widget build(BuildContext context) => RowLayout(
        title: title,
        child: SizedBox(
          height: 80,
          child: TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            inputFormatters: inputFormatters,
            controller: textEditingController,
            validator: (value) {
              if (isEmailEmpty(value)) {
                return 'Please enter a $title';
              }

              final validate = validator;

              if (validate != null) {
                return validate(value);
              }

              return null;
            },
          ),
        ),
      );
}
