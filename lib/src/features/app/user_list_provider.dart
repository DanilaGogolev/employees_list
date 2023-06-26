import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_list/src/features/auth/repositories/auth_repository.dart';
import 'package:user_list/src/repositories/employees_repository.dart';

class UserListProvider extends StatelessWidget {
  final SharedPreferences sharedPreferences;
  final AuthRepository authRepository;
  final FlutterSecureStorage flutterSecureStorage;
  final EmployeesRepository employeesRepository;
  final Widget child;

  const UserListProvider({
    super.key,
    required this.child,
    required this.sharedPreferences,
    required this.authRepository,
    required this.flutterSecureStorage,
    required this.employeesRepository,
  });

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          Provider<SharedPreferences>.value(value: sharedPreferences),
          Provider<FlutterSecureStorage>.value(value: flutterSecureStorage),
          Provider<AuthRepository>.value(value: authRepository),
          Provider<EmployeesRepository>.value(value: employeesRepository),
        ],
        child: child,
      );
}
