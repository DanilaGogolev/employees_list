import 'dart:async';
import 'dart:convert';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_list/src/models/employee.dart';

class EmployeesRepository {
  static const _employeesIdsKey = 'EMPLOYEES_IDS_KEYS';
  static const _employeeTmpKey = 'EMPLOYEE_TMP_KEYS';
  static const _employeesIdsSpliter = '&';

  final SharedPreferences _sharedPreferences;
  final FlutterSecureStorage _flutterSecureStorage;

  final _employeesKeys = <String>[];
  final _isUpdatedEmployees = StreamController<void>.broadcast();

  IList<Employee> _employees = IList<Employee>(const []);

  Stream<void> get isUpdatedEmployees => _isUpdatedEmployees.stream;

  IList<Employee> get employees => _employees;

  EmployeesRepository(this._sharedPreferences, this._flutterSecureStorage);

  Future<void> init() async {
    final result = await _flutterSecureStorage.readAll();

    final employeesIdsKey = result[_employeesIdsKey];
    if (employeesIdsKey != null) {
      _employeesKeys.addAll(employeesIdsKey.split(_employeesIdsSpliter));

      _employees = _employeesKeys
          .map<Employee>(
            (e) => Employee.fromJson(
              json.decode(result[e] ?? '') as Map<String, Object?>,
            ),
          )
          .toIList();
    }
  }

  Employee getEmployee(String id) => _employees.firstWhere((e) => e.id == id);

  Employee? getTmpEmployee() {
    final tmpEmployee = _sharedPreferences.getString(_employeeTmpKey);

    return tmpEmployee != null
        ? Employee.fromJson(
            json.decode(tmpEmployee) as Map<String, Object?>,
          )
        : null;
  }

  Future<void> editEmployee(Employee employee) async {
    _employees = _employees
        .map<Employee>((e) => e.id == employee.id ? employee : e)
        .toIList();

    await _flutterSecureStorage.write(
      key: employee.id,
      value: json.encode(employee.toJson()),
    );
  }

  Future<void> addEmployee(Employee employee) async {
    _employeesKeys.add(employee.id);
    _employees = _employees.add(employee);

    await _flutterSecureStorage.write(
      key: employee.id,
      value: json.encode(employee.toJson()),
    );

    await _saveEmployeesIdsKey();

    _isUpdatedEmployees.add(null);
  }

  Future<void> removeEmployee(String emplyoeeId) async {
    _employeesKeys.removeWhere((e) => e == emplyoeeId);
    _employees = _employees.removeWhere((e) => e.id == emplyoeeId);

    await _saveEmployeesIdsKey();

    await _flutterSecureStorage.delete(key: emplyoeeId);

    _isUpdatedEmployees.add(null);
  }

  Future<void> updateTmpEmployee(Employee? employee) async {
    final tmpEmployee = employee;

    if (tmpEmployee != null) {
      await _sharedPreferences.setString(
        _employeeTmpKey,
        json.encode(tmpEmployee.toJson()),
      );
    } else {
      await _sharedPreferences.remove(_employeeTmpKey);
    }
  }

  Future<void> _saveEmployeesIdsKey() async {
    await _flutterSecureStorage.write(
      key: _employeesIdsKey,
      value: _employeesKeys.join(_employeesIdsSpliter),
    );
  }
}
