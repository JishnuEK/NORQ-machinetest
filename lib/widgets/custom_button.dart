import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:test16032024/common/custom_size.dart';

class CustomButton {
  static Widget defaultLoadingBox() {
    return Container(
      color: Color.fromARGB(9, 0, 0, 0),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Get.theme.colorScheme.secondary,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            color: Get.theme.colorScheme.primary,
          ),
        ),
      ),
    );
  }

  static Widget FormTextFieldPrimary(
      BuildContext context, String hintText, TextEditingController ctrl,
      {int? maxlength,
      bool isMandatory = true,
      bool numberOnly = false,
      bool enableDecimal = false,
      bool enablePhoneNo = false,
      bool obscureText = false,
      TextInputType type = TextInputType.name,
      Function(String)? onchanged,
      bool showTitle = false,
      String title = ''}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showTitle
            ? Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                ),
              )
            : const SizedBox(),
        Container(
          height: CustomSize.containerHeight,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CustomSize.cardradius),
              border: Border.all(color: Colors.grey.shade300)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              obscureText: obscureText,
              onChanged: (v) {
                if (onchanged != null) {
                  onchanged(v);
                }
              },
              maxLength: maxlength,
              keyboardType: enablePhoneNo
                  ? const TextInputType.numberWithOptions()
                  : type,
              enabled: true,
              inputFormatters: enablePhoneNo
                  ? [FilteringTextInputFormatter.allow(RegExp('[0-9+]'))]
                  : numberOnly
                      ? [FilteringTextInputFormatter.digitsOnly]
                      : [],
              controller: ctrl,
              decoration: InputDecoration(
                counter: Offstage(),
                focusColor: Colors.grey,
                border: InputBorder.none,
                hintText: hintText,

                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                //labelText: 'Comment',
              ),
              onSaved: (String? value) {},
            ),
          ),
        ),
      ],
    );
  }

  static textButton(context,
      {required Function() onPressed,
      required String title,
      IconData? icon,
      Color color1 = const Color(0xffcb4a4a),
      Color color2 = const Color(0xffb74444)}) {
    return SizedBox(
        height: CustomSize.containerHeight,
        child: SizedBox.expand(
            child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(CustomSize.cardradius),
              gradient: LinearGradient(
                colors: [color1, color2],
              )),
          child: TextButton(
              onPressed: () {
                onPressed();
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(CustomSize.cardradius))),
                  // backgroundColor: MaterialStateProperty.all(
                  //     Theme.of(context).colorScheme.primary),
                  foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.onPrimary),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  ),
                  textStyle: MaterialStateProperty.all(
                    Get.textTheme.bodyLarge!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title),
                  if (icon != null) SizedBox(width: 10),
                  if (icon != null) Icon(icon),
                ],
              )),
        )));
  }

  static textButtonOutlined(context,
      {required Function() onPressed, required String title, IconData? icon}) {
    return SizedBox(
        height: CustomSize.containerHeight,
        child: SizedBox.expand(
            child: TextButton(
                onPressed: () {
                  onPressed();
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(CustomSize.cardradius))),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.onSecondary),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.secondary),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                    ),
                    side: MaterialStateProperty.all(
                        BorderSide(color: Colors.grey.shade300)),
                    textStyle: MaterialStateProperty.all(
                        Theme.of(context).textTheme.bodySmall)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) Icon(icon),
                    if (icon != null) SizedBox(width: 10),
                    Text(title),
                  ],
                ))));
  }
}
