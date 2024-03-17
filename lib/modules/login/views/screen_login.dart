import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test16032024/widgets/custom_button.dart';
import 'package:test16032024/common/custom_size.dart';
import 'package:test16032024/common/general.dart';
import 'package:test16032024/modules/login/controller/auth_controller.dart';
import 'package:test16032024/routes/app_routes.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
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
                        'Login',
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
                      context, 'Password', passwordController,
                      obscureText: true),
                  customVerticalGap(15),
                  CustomButton.textButton(context, onPressed: () {
                    FormValidation validation =
                        authController.loginsaveValidation(
                            emailController.text, passwordController.text);
                    if (validation.status == false) {
                      CustomAlert.warningSnackbar(validation.message ?? "");
                    } else {
                      authController.login(
                          emailController.text, passwordController.text);
                    }
                  }, title: 'Sign In'),
                  customVerticalGap(15),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.REGISTER);
                    },
                    child: Text.rich(
                      TextSpan(text: 'Don\'t have an account?', children: [
                        const TextSpan(
                          text: ' ',
                        ),
                        TextSpan(
                          text: 'Signup',
                          style: Get.textTheme.bodyLarge!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ]),
                    ),
                  ),
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
