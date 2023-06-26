import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_list/src/features/app/user_list_app.dart';
import 'package:user_list/src/features/app/user_list_provider.dart';
import 'package:user_list/src/features/auth/repositories/auth_repository.dart';
import 'package:user_list/src/repositories/employees_repository.dart';

Future<void> runApplication() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  const flutterSecureStorage = FlutterSecureStorage();
  final authRepository = AuthRepository(flutterSecureStorage);
  await authRepository.init();

  final employeesRepository =
      EmployeesRepository(sharedPreferences, flutterSecureStorage);

  await employeesRepository.init();

  runApp(
    UserListProvider(
      sharedPreferences: sharedPreferences,
      flutterSecureStorage: flutterSecureStorage,
      authRepository: authRepository,
      employeesRepository: employeesRepository,
      child: UserListApp(authRepository: authRepository),
    ),
  );
}
