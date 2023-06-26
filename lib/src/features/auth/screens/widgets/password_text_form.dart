import 'package:flutter/material.dart';

class PasswordTextForm extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? errorText;

  const PasswordTextForm({
    super.key,
    required this.textEditingController,
    required this.errorText,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 80,
        child: TextFormField(
          controller: textEditingController,
          decoration: const InputDecoration(
            icon: Icon(Icons.password),
            labelText: 'Password',
          ),
          obscureText: true,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) =>
              value?.isEmpty ?? true ? 'Please enter a passcode' : errorText,
        ),
      );
}
