import '../../constants/exported_package.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController get emailController => TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BasicAuthPage(
        formWidget: forgetPasswordForm(),
        title: "forget_password".tr,
        description: "forget_password_descripation".tr,
      ),
    );
  }

  Widget forgetPasswordForm() => // Form Fields
  Form(
    key: _formKey,
    child: Column(
      children: [
        CustomTextfiled(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
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
        // Buttons Row
        Row(
          children: [
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.login),
              child: Text(
                'sign_in'.tr,
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
      ],
    ),
  );
}
