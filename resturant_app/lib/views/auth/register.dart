import 'package:resturant_app/constants/exported_package.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BasicAuthPage(formWidget: _fornRegister(), title: "register".tr),
    );
  }

  Widget _fornRegister() => // Form Fields
  Form(
    key: _formKey,
    child: Column(
      children: [
        CustomTextfiled(
          controller: nameController,
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
          controller: emailController,
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
          controller: passwordController,
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
        SizedBox(height: 16),
        CustomTextfiled(
          controller: confirmPasswordController,
          labelText: 'renter_password_label'.tr,
          hintText: 'password_hint'.tr,
          obscureText: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'confirm_password_required'.tr;
            }
            if (value != passwordController.text) {
              return 'password_mismatch'.tr;
            }
            return null;
          },
        ),
        const SizedBox(height: 24),

        // Buttons Row
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
                  Get.snackbar(
                    'login_success_title'.tr,
                    'login_success_message'.tr,
                    backgroundColor: Colors.green.shade100,
                  );
                }
              },
              child: const Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Sign Up
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
