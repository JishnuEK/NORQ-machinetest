import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: const CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
