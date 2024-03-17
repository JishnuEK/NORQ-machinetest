import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test16032024/widgets/custom_button.dart';
import 'package:test16032024/common/custom_size.dart';
import 'package:test16032024/common/general.dart';
import 'package:test16032024/modules/login/controller/auth_controller.dart';

class ScreenRegister extends StatelessWidget {
  ScreenRegister({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Register',
                        style: Get.textTheme.bodyLarge!.copyWith(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  customVerticalGap(15),
                  CustomButton.FormTextFieldPrimary(
                      context, 'Email', emailController),
                  customVerticalGap(10),
                  CustomButton.FormTextFieldPrimary(
                      context, 'Password', passwordController),
                  customVerticalGap(15),
                  CustomButton.textButton(context, onPressed: () {
                    FormValidation validation =
                        authController.RegisterSaveValidation(
                            emailController.text, passwordController.text);
                    if (validation.status == false) {
                      CustomAlert.warningSnackbar(validation.message ?? "");
                    } else {
                      authController.register(
                          emailController.text, passwordController.text);
                    }
                  }, title: 'Sign Up'),
                  customVerticalGap(15),
                ],
              ),
            ),
          ),
          GetBuilder<AuthController>(
              id: Get.find<AuthController>().WidgetID,
              builder: (controller) {
                return controller.isLoading
                    ? CustomButton.defaultLoadingBox()
                    : const SizedBox();
              }),
        ],
      ),
    );
  }
}
