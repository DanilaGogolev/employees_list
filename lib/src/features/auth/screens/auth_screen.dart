import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/src/features/auth/cubits/auth_cubit.dart';
import 'package:user_list/src/features/auth/repositories/auth_repository.dart';
import 'package:user_list/src/features/auth/screens/auth_view.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  final VoidCallback isDone;

  const AuthScreen({
    super.key,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => AuthCubit(
          context.read<AuthRepository>(),
        ),
        child: AuthView(isDone: isDone),
      );
}
