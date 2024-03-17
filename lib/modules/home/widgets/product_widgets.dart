import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test16032024/common/custom_size.dart';
import 'package:test16032024/common/general.dart';

class ProductCardBuild extends StatelessWidget {
  const ProductCardBuild(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.oldPrice,
      required this.productPrice,
      required this.onTap,
      required this.onClick});

  final String productName;
  final String productImage;
  final String oldPrice;
  final String productPrice;
  final Function onTap, onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.secondary,
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: SizedBox(
          width: Get.size.width / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customVerticalGap(15),
              Expanded(
                flex: 3,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                        height: 85,
                        width: 85,
                        child: NetworkImageViewer(
                          productImage,
                          fit: BoxFit.contain,
                        ))),
              ),
              customVerticalGap(5),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: const Color(0xff595959),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          productName,
                          style: Get.textTheme.bodySmall!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          maxLines: 2,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      customVerticalGap(5),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$$productPrice',
                              style: Get.textTheme.bodySmall!.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                            ),
                            GestureDetector(
                              onTap: () {
                                onClick();
                              },
                              child: Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      customVerticalGap(5),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
