// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:user_list/src/features/auth/screens/auth_screen.dart' as _i3;
import 'package:user_list/src/features/employee/screens/employee_screen.dart'
    as _i1;
import 'package:user_list/src/features/employees_list/screens/employees_list_screen.dart'
    as _i2;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    EmployeeRoute.name: (routeData) {
      final args = routeData.argsAs<EmployeeRouteArgs>(
          orElse: () => const EmployeeRouteArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.EmployeeScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    EmployeesListRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.EmployeesListScreen(),
      );
    },
    AuthRoute.name: (routeData) {
      final args = routeData.argsAs<AuthRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AuthScreen(
          key: args.key,
          isDone: args.isDone,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.EmployeeScreen]
class EmployeeRoute extends _i4.PageRouteInfo<EmployeeRouteArgs> {
  EmployeeRoute({
    _i5.Key? key,
    String? id,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          EmployeeRoute.name,
          args: EmployeeRouteArgs(
            key: key,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'EmployeeRoute';

  static const _i4.PageInfo<EmployeeRouteArgs> page =
      _i4.PageInfo<EmployeeRouteArgs>(name);
}

class EmployeeRouteArgs {
  const EmployeeRouteArgs({
    this.key,
    this.id,
  });

  final _i5.Key? key;

  final String? id;

  @override
  String toString() {
    return 'EmployeeRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i2.EmployeesListScreen]
class EmployeesListRoute extends _i4.PageRouteInfo<void> {
  const EmployeesListRoute({List<_i4.PageRouteInfo>? children})
      : super(
          EmployeesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'EmployeesListRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AuthScreen]
class AuthRoute extends _i4.PageRouteInfo<AuthRouteArgs> {
  AuthRoute({
    _i5.Key? key,
    required void Function() isDone,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          AuthRoute.name,
          args: AuthRouteArgs(
            key: key,
            isDone: isDone,
          ),
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const _i4.PageInfo<AuthRouteArgs> page =
      _i4.PageInfo<AuthRouteArgs>(name);
}

class AuthRouteArgs {
  const AuthRouteArgs({
    this.key,
    required this.isDone,
  });

  final _i5.Key? key;

  final void Function() isDone;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key, isDone: $isDone}';
  }
}
