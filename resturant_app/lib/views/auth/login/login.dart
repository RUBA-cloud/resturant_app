import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/views/auth/login/cubit/login_cubit.dart';
import 'package:resturant_app/views/auth/login/cubit/login_state.dart';

import '../../../constants/exported_package.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            // Optional: Show loading dialog
            Get.dialog(
              const Center(child: CircularProgressIndicator()),
              barrierDismissible: false,
            );
          } else {
            Get.back(); // Close loading dialog
          }

          if (state is LoginSuccess) {
            Get.snackbar(
              'login_success_title'.tr,
              'login_success_message'.tr,
              backgroundColor: Colors.green.shade100,
            );
            Get.offAllNamed(AppRoutes.home);
          } else if (state is LoginError) {
            Get.snackbar(
              'login_failed_title'.tr,
              state.message,
              backgroundColor: Colors.red.shade100,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: BasicAuthPage(
              formWidget: _formLogin(context),
              title: "sign_in".tr,
            ),
          );
        },
      ),
    );
  }

  Widget _formLogin(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextfiled(
            controller: emailController,
            labelText: 'email_label'.tr,
            hintText: 'email_hint'.tr,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) return 'email_required'.tr;
              if (!GetUtils.isEmail(value)) return 'email_invalid'.tr;
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextfiled(
            controller: passwordController,
            labelText: 'password_label'.tr,
            hintText: 'password_hint'.tr,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) return 'password_required'.tr;
              if (value.length < 6) return 'password_short'.tr;
              return null;
            },
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.forgetPassword),
                child: Text(
                  'forgot_password'.tr,
                  style: const TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                      emailController.text,
                      passwordController.text,
                    );
                  }
                },
                child: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'no_account'.tr,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.register),
                child: Text(
                  'sign_up'.tr,
                  style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
