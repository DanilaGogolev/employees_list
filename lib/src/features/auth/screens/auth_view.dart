import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_list/src/features/auth/cubits/auth_cubit.dart';
import 'package:user_list/src/features/auth/models/user_credentials.dart';
import 'package:user_list/src/features/auth/screens/widgets/email_text_form.dart';
import 'package:user_list/src/features/auth/screens/widgets/password_text_form.dart';
import 'package:user_list/src/features/auth/states/auth_state.dart';

class AuthView extends StatefulWidget {
  final VoidCallback isDone;

  const AuthView({
    super.key,
    required this.isDone,
  });

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isAuthorized) {
            widget.isDone();
          }
        },
        child: Scaffold(
          body: Center(
            child: Card(
              child: SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        EmailTextForm(
                          textEditingController: emailController,
                        ),
                        BlocSelector<AuthCubit, AuthState, String?>(
                          selector: (state) => state.error,
                          builder: (context, state) => PasswordTextForm(
                            textEditingController: passwordController,
                            errorText: state,
                          ),
                        ),
                        const SizedBox(height: 24),
                        OutlinedButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context).logIn(
                              UserCredentials(
                                email: emailController.value.text,
                                password: passwordController.value.text,
                              ),
                            );
                          },
                          child: const Text('Go'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
