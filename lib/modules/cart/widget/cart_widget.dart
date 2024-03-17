import 'package:flutter/material.dart';
import 'package:test16032024/common/custom_size.dart';

class CartWidget {
  static Widget priceDetailsCard(BuildContext context,
      {required String title,
      required String content,
      required Color contentColor,
      bool isBold = false,
      int fontsize = 13}) {
    return Column(
      children: [
        customVerticalGap(10),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 15,
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                    color: Colors.black),
                textAlign: TextAlign.start,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                content,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 15,
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                    color: Colors.black),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
        customVerticalGap(10),
      ],
    );
  }
}
