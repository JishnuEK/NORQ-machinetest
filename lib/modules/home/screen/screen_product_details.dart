// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test16032024/widgets/custom_button.dart';
import 'package:test16032024/common/custom_size.dart';
import 'package:test16032024/common/general.dart';

import 'package:test16032024/modules/home/controller/home_controller.dart';
import 'package:test16032024/modules/home/model/product_model.dart';
import 'package:test16032024/routes/app_routes.dart';

class ScreenProductDetails extends StatelessWidget {
  const ScreenProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.CART);
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: NetworkImageViewer(
                product.image,
                fit: BoxFit.contain,
              )),
          customVerticalGap(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.title,
                            style: Get.textTheme.titleSmall!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                        ),
                      ],
                    ),
                    customVerticalGap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Text(
                            '\$ ${product.price}',
                            style: Get.textTheme.bodySmall!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    customVerticalGap(5),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.green),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${product.rating!.rate}',
                            style: Get.textTheme.titleSmall!.copyWith(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color:
                                    Theme.of(context).colorScheme.background),
                          ),
                          Icon(Icons.star, size: 15, color: Colors.amber),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Divider(
            thickness: 4,
            color: Colors.grey.shade100,
          ),
          customVerticalGap(15),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Description',
                      style: Get.textTheme.titleSmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
              customVerticalGap(10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${product.description}',
                      style: Get.textTheme.titleSmall!.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ),
                ],
              ),
            ],
          ),
          customVerticalGap(25),
          Row(
            children: [
              Expanded(
                child: CustomButton.textButton(context, onPressed: () {
                  controller.addTocart(product);
                }, title: 'Add to Cart'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
