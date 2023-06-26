import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:user_list/src/features/employee/screens/widgets/employee_data_row_form.dart';

class PhoneNumberDataRow extends StatelessWidget {
  final TextEditingController textEditingController;

  const PhoneNumberDataRow({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) => EmployeeDataRowForm(
        title: 'Phone number',
        inputFormatters: [
          MaskTextInputFormatter(
            mask: '+# (###) ###-##-##',
            filter: {
              '#': RegExp('[0-9]'),
            },
          )
        ],
        textEditingController: textEditingController,
      );
}
