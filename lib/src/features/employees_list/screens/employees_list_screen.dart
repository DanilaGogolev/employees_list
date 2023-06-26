import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/src/features/employees_list/cubits/employees_cubit.dart';
import 'package:user_list/src/features/employees_list/screens/employees_list_view.dart';
import 'package:user_list/src/repositories/employees_repository.dart';

@RoutePage()
class EmployeesListScreen extends StatelessWidget {
  const EmployeesListScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => EmployeesCubit(context.read<EmployeesRepository>()),
        child: const EmployeesListView(),
      );
}
