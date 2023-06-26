import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/src/features/employee/state/employee_state.dart';
import 'package:user_list/src/models/employee.dart';
import 'package:user_list/src/repositories/employees_repository.dart';

class EmployeeCubit extends Cubit<EmployeeState> {
  final EmployeesRepository _employeesRepository;
  final String? _id;

  EmployeeCubit(
    this._employeesRepository,
    this._id,
  ) : super(const EmployeeState()) {
    final id = _id;

    if (id != null) {
      emit(state.copyWith(employee: _employeesRepository.getEmployee(id)));
    } else {
      emit(state.copyWith(employeeTmp: _employeesRepository.getTmpEmployee()));
    }
  }

  Future<void> editEmployee(Employee emplyoee) async {
    await _employeesRepository.editEmployee(emplyoee);
    emit(state.copyWith(isSaved: true));
  }

  Future<void> addEmployee(Employee emplyoee) async {
    await _employeesRepository.addEmployee(emplyoee);
    emit(state.copyWith(isSaved: true));
  }

  Future<void> removeEmployee(String emplyoeeId) async {
    await _employeesRepository.removeEmployee(emplyoeeId);
    emit(state.copyWith(employee: null));
  }

  Future<void> updateTmpEmployee({
    String? firstName,
    String? lastName,
    String? patronymic,
    String? phoneNumber,
    String? email,
    DateTime? birthday,
    String? comments,
  }) async {
    final currentTmp = _employeesRepository.getTmpEmployee();

    final updatedTmp = currentTmp != null
        ? currentTmp.copyWith(
            birthday: birthday ?? currentTmp.birthday,
            email: email ?? currentTmp.email,
            firstName: firstName ?? currentTmp.firstName,
            id: phoneNumber ?? currentTmp.phoneNumber,
            lastName: lastName ?? currentTmp.lastName,
            patronymic: patronymic ?? currentTmp.patronymic,
            phoneNumber: phoneNumber ?? currentTmp.phoneNumber,
            comments: comments ?? currentTmp.comments,
          )
        : Employee(
            birthday: birthday ?? DateTime.now(),
            email: email ?? '',
            firstName: firstName ?? '',
            id: phoneNumber ?? '',
            lastName: lastName ?? '',
            patronymic: patronymic ?? '',
            phoneNumber: phoneNumber ?? '',
            comments: comments ?? '',
          );

    await _employeesRepository.updateTmpEmployee(updatedTmp);
  }

  Future<void> cleanTmpEmployee() =>
      _employeesRepository.updateTmpEmployee(null);
}
