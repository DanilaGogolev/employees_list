import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universal_html/html.dart';
import 'package:user_list/src/features/app/routers/app_router.gr.dart';
import 'package:user_list/src/features/employee/cubits/employee_cubit.dart';
import 'package:user_list/src/features/employee/screens/widgets/birthday_picker.dart';
import 'package:user_list/src/features/employee/screens/widgets/employee_data_row.dart';
import 'package:user_list/src/features/employee/screens/widgets/employee_data_row_form.dart';
import 'package:user_list/src/features/employee/screens/widgets/phone_number_data_row.dart';
import 'package:user_list/src/features/employee/state/employee_state.dart';
import 'package:user_list/src/models/employee.dart';
import 'package:user_list/src/utils/email_validator.dart';

class EmployeeView extends StatefulWidget {
  final String? id;
  const EmployeeView({
    super.key,
    this.id,
  });

  @override
  State<EmployeeView> createState() => _EmployeeViewState();
}

class _EmployeeViewState extends State<EmployeeView> {
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _patronymicController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _commentsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    window.onBeforeUnload.listen((_) {
      BlocProvider.of<EmployeeCubit>(context).updateTmpEmployee(
        firstName: _firstNameController.value.text,
        lastName: _lastNameController.value.text,
        patronymic: _patronymicController.value.text,
        phoneNumber: _phoneNumberController.value.text,
        email: _emailController.value.text,
        comments: _commentsController.value.text,
        birthday: selectedDate,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _lastNameController.dispose();
    _firstNameController.dispose();
    _patronymicController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _commentsController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocConsumer<EmployeeCubit, EmployeeState>(
        listener: (context, state) {
          if (state.employee == null || state.isSaved) {
            context.router.replace(const EmployeesListRoute());
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<EmployeeCubit>(context);
          _setDefaultValue(state);

          return Scaffold(
            body: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    EmployeeDataRowForm(
                      title: 'Last name',
                      textEditingController: _lastNameController,
                    ),
                    EmployeeDataRowForm(
                      title: 'First name',
                      textEditingController: _firstNameController,
                    ),
                    EmployeeDataRow(
                      title: 'Patronymic',
                      textEditingController: _patronymicController,
                    ),
                    PhoneNumberDataRow(
                      textEditingController: _phoneNumberController,
                    ),
                    EmployeeDataRowForm(
                      title: 'Email',
                      textEditingController: _emailController,
                      validator: (value) => !isEmailValid(value)
                          ? 'Please enter a valid email'
                          : null,
                    ),
                    BirthdayPicker(
                      birthday: selectedDate,
                      onBirthdayChanged: (value) {
                        selectedDate = value;
                      },
                    ),
                    EmployeeDataRow(
                      title: 'Comments',
                      textEditingController: _commentsController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: widget.id != null
                              ? () {
                                  _onRemoveEmployee(cubit);
                                }
                              : null,
                          child: const Text('Remove'),
                        ),
                        TextButton(
                          onPressed: () {
                            _onAddOrUpdateEmployee(cubit);
                          },
                          child: Text(widget.id == null ? 'Add' : 'Save'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );

  void _setDefaultValue(EmployeeState state) {
    final employee = state.employee;
    final employeeTmp = state.employeeTmp;

    _lastNameController.text =
        employee?.lastName ?? employeeTmp?.lastName ?? '';
    _firstNameController.text =
        employee?.firstName ?? employeeTmp?.firstName ?? '';
    _patronymicController.text =
        employee?.patronymic ?? employeeTmp?.patronymic ?? '';
    _phoneNumberController.text =
        employee?.phoneNumber ?? employeeTmp?.phoneNumber ?? '';
    _emailController.text = employee?.email ?? employeeTmp?.email ?? '';
    _commentsController.text = employee?.comments ?? employeeTmp?.email ?? '';
    selectedDate =
        employee?.birthday ?? employeeTmp?.birthday ?? DateTime.now();
  }

  void _onRemoveEmployee(EmployeeCubit cubit) {
    cubit.removeEmployee(widget.id ?? '');
  }

  void _onAddOrUpdateEmployee(EmployeeCubit cubit) {
    if (_formKey.currentState?.validate() ?? false) {
      final employee = Employee(
        id: _phoneNumberController.value.text,
        firstName: _firstNameController.value.text,
        lastName: _lastNameController.value.text,
        patronymic: _patronymicController.value.text,
        phoneNumber: _phoneNumberController.value.text,
        email: _emailController.value.text,
        comments: _commentsController.value.text,
        birthday: selectedDate,
      );

      if (widget.id == null) {
        cubit
          ..addEmployee(employee)
          ..cleanTmpEmployee();
      } else {
        cubit.editEmployee(employee);
      }
    }
  }
}
