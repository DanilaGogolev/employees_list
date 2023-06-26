import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/src/features/app/routers/app_router.gr.dart';
import 'package:user_list/src/features/auth/repositories/auth_repository.dart';
import 'package:user_list/src/features/employees_list/cubits/employees_cubit.dart';
import 'package:user_list/src/features/employees_list/screens/widgets/employees_list_item.dart';
import 'package:user_list/src/features/employees_list/screens/widgets/employees_row_layout.dart';
import 'package:user_list/src/features/employees_list/state/employees_state.dart';

class EmployeesListView extends StatefulWidget {
  const EmployeesListView({super.key});

  @override
  State<EmployeesListView> createState() => _EmployeesListViewState();
}

class _EmployeesListViewState extends State<EmployeesListView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {
                context.router.navigate(EmployeeRoute());
              },
              child: const Text('Add Employee'),
            ),
            TextButton(
              onPressed: () {
                context.read<AuthRepository>().setIsAuthorized(false);
              },
              child: const Text('Logout'),
            ),
          ],
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        body: Center(
          child: Column(
            children: [
              const EmployeesRowLayout(
                rowNumber: Text('№'),
                lastName: Text('Last Name'),
                firstName: Text('First Name'),
                patronymic: Text('Patronymic'),
                phoneNumber: Text('Phone Number'),
              ),
              Expanded(
                child: BlocBuilder<EmployeesCubit, EmployeesState>(
                  builder: (context, state) => SizedBox(
                    width: 700,
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.employees.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) => Center(
                        child: SizedBox(
                          height: 50,
                          child: EmployeesListItem(
                            rowNumber: (index + 1).toString(),
                            onTap: () {
                              context.router.navigate(
                                EmployeeRoute(
                                  id: state.employees[index].id,
                                ),
                              );
                            },
                            employee: state.employees[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
