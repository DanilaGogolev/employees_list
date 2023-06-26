import 'package:flutter/material.dart';
import 'package:user_list/src/utils/email_validator.dart';

class EmailTextForm extends StatelessWidget {
  final TextEditingController textEditingController;

  const EmailTextForm({
    super.key,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 80,
        child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            icon: Icon(Icons.email),
            labelText: 'Email',
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (isEmailEmpty(value)) {
              return 'Please enter an email';
            }

            if (!isEmailValid(value)) {
              return 'Please enter a valid email';
            }

            return null;
          },
          scrollPadding: const EdgeInsets.only(bottom: 20),
        ),
      );
}
