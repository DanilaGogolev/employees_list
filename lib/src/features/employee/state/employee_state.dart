import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_list/src/models/employee.dart';

part 'employee_state.freezed.dart';

@freezed
class EmployeeState with _$EmployeeState {
  const factory EmployeeState({
    Employee? employee,
    Employee? employeeTmp,
    @Default(false) bool isSaved,
  }) = _EmployeeState;
}
