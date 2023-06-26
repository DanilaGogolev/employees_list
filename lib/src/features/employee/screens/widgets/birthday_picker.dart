import 'package:flutter/material.dart';
import 'package:user_list/src/features/employee/screens/widgets/row_layout.dart';

class BirthdayPicker extends StatefulWidget {
  final DateTime birthday;
  final ValueChanged<DateTime> onBirthdayChanged;

  const BirthdayPicker({
    super.key,
    required this.onBirthdayChanged,
    required this.birthday,
  });

  @override
  State<BirthdayPicker> createState() => _BirthdayPickerState();
}

class _BirthdayPickerState extends State<BirthdayPicker> {
  late DateTime selectedDate = widget.birthday;

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: widget.birthday,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.onBirthdayChanged(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) => RowLayout(
        title: 'Birthday',
        child: ElevatedButton(
          onPressed: () => _selectDate(context),
          child: Text(
            '${selectedDate.toLocal()}'.split(' ').first,
          ),
        ),
      );
}
