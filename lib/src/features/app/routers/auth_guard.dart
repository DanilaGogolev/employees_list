import 'package:auto_route/auto_route.dart';
import 'package:user_list/src/features/app/routers/app_router.gr.dart';
import 'package:user_list/src/features/auth/repositories/auth_repository.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthRepository _authRepository;

  AuthGuard(this._authRepository);

  @override
  void onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) {
    if (_authRepository.isAuthorized || resolver.route.name == AuthRoute.name) {
      resolver.next();
    } else {
      router.push(
        AuthRoute(
          isDone: () {
            resolver.next();
          },
        ),
      );
    }
  }
}
