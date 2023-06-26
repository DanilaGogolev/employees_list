import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/src/features/employee/cubits/employee_cubit.dart';
import 'package:user_list/src/features/employee/screens/employee_view.dart';
import 'package:user_list/src/repositories/employees_repository.dart';

@RoutePage()
class EmployeeScreen extends StatelessWidget {
  final String? id;

  const EmployeeScreen({
    super.key,
    this.id,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => EmployeeCubit(
          context.read<EmployeesRepository>(),
          id,
        ),
        child: EmployeeView(id: id),
      );
}
