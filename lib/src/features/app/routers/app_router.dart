import 'package:auto_route/auto_route.dart';
import 'package:user_list/src/features/app/routers/app_router.gr.dart';
import 'package:user_list/src/features/app/routers/auth_guard.dart';
import 'package:user_list/src/features/auth/repositories/auth_repository.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  final AuthRepository _authRepository;

  AppRouter(this._authRepository);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthRoute.page,
          path: '/auth',
          keepHistory: false,
        ),
        AutoRoute(
          initial: true,
          page: EmployeesListRoute.page,
          path: '/employees_list',
          guards: [AuthGuard(_authRepository)],
        ),
        AutoRoute(
          page: EmployeeRoute.page,
          path: '/employees_list/employee',
          guards: [AuthGuard(_authRepository)],
        ),
      ];
}
