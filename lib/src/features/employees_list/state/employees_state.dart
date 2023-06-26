import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_list/src/models/employee.dart';

part 'employees_state.freezed.dart';

@freezed
class EmployeesState with _$EmployeesState {
  const factory EmployeesState({
    @Default(IListConst<Employee>([])) IList<Employee> employees,
  }) = _EmployeesState;
}
