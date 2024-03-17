import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test16032024/common/custom_size.dart';

// *-*-*--

/// Logging config
const kLOG_TAG = "[JIGSS APP]";
const kLOG_ENABLE = true;
const kLOG_IMPORTANT_LOG = true;

enum LOG_LEVEL { DEBUG, RUN, ERROR }

void printLog(dynamic data, {LOG_LEVEL priority = LOG_LEVEL.DEBUG}) {
  if (kLOG_ENABLE) {
    _print(data);
  } else if (kLOG_IMPORTANT_LOG == true) {
    if (priority == LOG_LEVEL.RUN || priority == LOG_LEVEL.ERROR) {
      _print(data);
    }
  }
}

void _print(dynamic data) {
  final String now = DateTime.now().toUtc().toString().split(' ').last;
  debugPrint("[$now]$kLOG_TAG${data.toString()}");
}

class CustomAlert {
  static ErrorSnackbar(String message,
      {String title = "Error", int duration = 3}) {
    return Get.snackbar('', '',
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Container(),
        padding: const EdgeInsets.only(bottom: 18, top: 10, left: 5, right: 5),
        messageText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customHorizontalGap(15),
            const Icon(Icons.error_outline, color: Colors.white),
            customHorizontalGap(15),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10));
  }

  static warningSnackbar(String message,
      {String title = "Error", int duration = 3}) {
    return Get.snackbar('', '',
        duration: const Duration(milliseconds: 2000),
        backgroundColor: Colors.orange.shade300,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Container(),
        padding: const EdgeInsets.only(bottom: 18, top: 10, left: 5, right: 5),
        messageText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customHorizontalGap(15),
            const Icon(Icons.warning, color: Colors.black),
            customHorizontalGap(15),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10));
  }

  static defaultSnackbar(String message,
      {String title = "", int duration = 3}) {
    return Get.snackbar('', '',
        duration: const Duration(milliseconds: 1500),
        backgroundColor: Colors.green.shade200,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Container(),
        padding: const EdgeInsets.only(bottom: 18, top: 10, left: 5, right: 5),
        messageText: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customHorizontalGap(15),
            const Icon(Icons.done_outline_outlined, color: Colors.black),
            customHorizontalGap(15),
            Expanded(
              child: Text(
                message,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10));
  }
}

class NetworkImageViewer extends StatelessWidget {
  const NetworkImageViewer(this.imageUrl,
      {this.enablewidget = false,
      this.loadingwidget,
      this.fit = BoxFit.contain,
      this.errorImg =
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/1665px-No-Image-Placeholder.svg.png'});
  final String imageUrl;
  final bool enablewidget;
  final Widget? loadingwidget;
  final BoxFit fit;
  final String errorImg;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        fit: fit,
        imageUrl: imageUrl,
        placeholder: (context, url) =>
            Center(child: const CircularProgressIndicator()),
        errorWidget: (context, url, error) => Image.asset(errorImg));
  }
}

class FormValidation {
  bool? status;
  String? message;
  FormValidation(status, message);
}
