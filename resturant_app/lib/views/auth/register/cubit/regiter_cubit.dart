import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resturant_app/views/auth/register/cubit/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Register
  Future<void> register(
    String email,
    String password,
    BuildContext context,
  ) async {
    emit(RegisterInitial());

    try {
      final FirebaseAuth auth = FirebaseAuth.instance;

      final result = await auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      emit(RegisterLoaded(result.user!.uid));
      // Show success snackbar
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration successful for ${result.user!.email}'),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Show error snackbar
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Registration failed')),
      );

      if (!isClosed) emit(RegisterError(e.message ?? 'Registration failed'));
    }
  }
}
