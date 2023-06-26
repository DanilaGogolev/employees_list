import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:user_list/src/features/app/routers/app_router.dart';
import 'package:user_list/src/features/auth/repositories/auth_repository.dart';

class UserListApp extends StatelessWidget {
  final AuthRepository authRepository;

  const UserListApp({
    super.key,
    required this.authRepository,
  });

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter(authRepository).config(
          reevaluateListenable:
              ReevaluateListenable.stream(authRepository.isAuthorizedStream),
        ),
      );
}
