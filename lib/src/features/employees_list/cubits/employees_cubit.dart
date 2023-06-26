import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/src/features/employees_list/state/employees_state.dart';
import 'package:user_list/src/repositories/employees_repository.dart';

class EmployeesCubit extends Cubit<EmployeesState> {
  final EmployeesRepository _employeesRepository;

  EmployeesCubit(this._employeesRepository) : super(const EmployeesState()) {
    if (_employeesRepository.employees != state.employees) {
      emit(state.copyWith(employees: _employeesRepository.employees));
    }
  }
}
