import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resturant_app/constants/exported_package.dart';
import 'package:resturant_app/views/auth/login/cubit/login_cubit.dart';
import 'package:resturant_app/views/auth/login/cubit/login_state.dart';
import 'package:resturant_app/views/auth/register/cubit/register_state.dart';
import 'package:resturant_app/views/auth/register/cubit/regiter_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (_) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterInitial || state is AuthLoading) {
            Get.dialog(
              const Center(child: CircularProgressIndicator()),
              barrierDismissible: false,
            );
          } else {
            Get.back(); // close dialog if open
          }

          if (state is RegisterLoaded) {
            Get.snackbar(
              'register_success_title'.tr,
              'register_success_message'.tr,
              backgroundColor: Colors.green.shade100,
            );
            Get.offAllNamed(AppRoutes.home);
          } else if (state is RegisterError) {
            Get.snackbar(
              'register_failed_title'.tr,
              state.message,
              backgroundColor: Colors.red.shade100,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: BasicAuthPage(
              formWidget: _formRegister(context, context.read<RegisterCubit>()),
              title: "register".tr,
            ),
          );
        },
      ),
    );
  }

  Widget _formRegister(BuildContext context, RegisterCubit cubit) {
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextfiled(
            controller: cubit.nameController,
            labelText: 'name_label'.tr,
            hintText: 'name_hint'.tr,
            keyboardType: TextInputType.name,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'name_required'.tr;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextfiled(
            controller: cubit.emailController,
            labelText: 'email_label'.tr,
            hintText: 'email_hint'.tr,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'email_required'.tr;
              }
              if (!GetUtils.isEmail(value)) {
                return 'email_invalid'.tr;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextfiled(
            controller: cubit.passwordController,
            labelText: 'password_label'.tr,
            hintText: 'password_hint'.tr,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'password_required'.tr;
              }
              if (value.length < 6) {
                return 'password_short'.tr;
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          CustomTextfiled(
            controller: cubit.confirmPasswordController,
            labelText: 'renter_password_label'.tr,
            hintText: 'password_hint'.tr,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'confirm_password_required'.tr;
              }
              if (value != cubit.passwordController.text) {
                return 'password_mismatch'.tr;
              }
              return null;
            },
          ),
          const SizedBox(height: 24),

          // Buttons Row
          Row(
            children: [
              const Spacer(),
              ElevatedButton(
                style: buttonStyle,
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.register(
                      cubit.emailController.text.trim(),
                      cubit.passwordController.text.trim(),
                      context,
                    );
                  }
                },
                child: const Icon(Icons.arrow_forward, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Sign In Option
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'have_account'.tr,
                style: const TextStyle(color: Colors.black54, fontSize: 14),
              ),
              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.login),
                child: Text(
                  'sign_in'.tr,
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
