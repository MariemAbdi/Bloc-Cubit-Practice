import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_cubit/views/auth_home.dart';
import 'package:state_management_cubit/widgets/email_field.dart';
import 'package:state_management_cubit/widgets/password_field.dart';

import '../../widgets/gradient_button.dart';
import 'auth_bloc.dart';

class AuthPageBloc extends StatefulWidget {
  const AuthPageBloc({super.key});

  @override
  State<AuthPageBloc> createState() => _AuthPageBlocState();
}

class _AuthPageBlocState extends State<AuthPageBloc> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }

        if (state is AuthSuccess) {
          emailController.clear();
          passwordController.clear();
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthHome()));
          // Navigator.pushAndRemoveUntil(
          //     context,
          //     MaterialPageRoute(builder: (context) => const AuthHome()),
          //     (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 50),
                EmailField(
                  controller: emailController,
                ),
                const SizedBox(height: 15),
                PasswordField(
                  controller: passwordController,
                ),
                const SizedBox(height: 20),
                GradientButton(
                    text: "Login",
                    onPressed: () {
                      bloc.add(AuthLoginEvent(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      ));
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
