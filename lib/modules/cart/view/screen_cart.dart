import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test16032024/widgets/custom_button.dart';
import 'package:test16032024/common/custom_size.dart';
import 'package:test16032024/common/general.dart';
import 'package:test16032024/modules/cart/controller/cart_controller.dart';
import 'package:test16032024/modules/cart/model/cart.dart';
import 'package:test16032024/modules/cart/widget/cart_widget.dart';

class ScreenCart extends StatefulWidget {
  const ScreenCart({Key? key}) : super(key: key);

  @override
  State<ScreenCart> createState() => _ScreenCartState();
}

class _ScreenCartState extends State<ScreenCart> {
  @override
  void initState() {
    Get.find<CartController>().getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Your Cart')),
        body: SafeArea(
          child: Padding(
            padding: CustomSize.padding,
            child: GetBuilder<CartController>(
                id: Get.find<CartController>().WidgetID,
                builder: (controller) {
                  if (controller.cartList.isEmpty) {
                    return const Center(
                      child: Text('Your Cart is Empty'),
                    );
                  } else {
                    return Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return Divider(
                                thickness: 1,
                                color: Colors.grey,
                              );
                            },
                            itemCount: controller.cartList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return cartView(
                                  context, controller.cartList[index]);
                            },
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    customVerticalGap(15),
                                    CartWidget.priceDetailsCard(context,
                                        title: 'Subtotal',
                                        content:
                                            '\$ ${controller.total.toStringAsFixed(1)}',
                                        contentColor: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                    CartWidget.priceDetailsCard(context,
                                        title: 'Discount',
                                        content: '\$ 0',
                                        contentColor: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                    Divider(
                                      thickness: 2,
                                      color: Colors.grey.shade100,
                                    ),
                                    CartWidget.priceDetailsCard(context,
                                        title: 'Total',
                                        fontsize: 15,
                                        content:
                                            '\$ ${controller.total.toStringAsFixed(1)}',
                                        isBold: true,
                                        contentColor: Theme.of(context)
                                            .colorScheme
                                            .onSurface),
                                  ],
                                ),
                              ),
                              customVerticalGap(25),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 4.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomButton.textButton(context,
                                          onPressed: () {}, title: 'Check Out'),
                                    ),
                                  ],
                                ),
                              ),
                              customVerticalGap(10)
                            ],
                          ),
                        )
                      ],
                    );
                  }
                }),
          ),
        ));
  }

  Widget cartView(BuildContext context, Cart data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
              height: 50,
              width: 50,
              child: NetworkImageViewer(
                data.image,
                fit: BoxFit.contain,
              )),
          customHorizontalGap(2),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        data.name,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                Text(
                  '\$${data.price}',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Theme.of(context).primaryColor),
                  child: Row(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Get.find<CartController>()
                              .decrementCartQuantity(data);
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                      customHorizontalGap(10),
                      Text(
                        '${data.quantity}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.white),
                      ),
                      customHorizontalGap(10),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Get.find<CartController>()
                              .incrementCartQuantity(data);
                        },
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                customHorizontalGap(10),
                GestureDetector(
                  onTap: () {
                    Get.find<CartController>().delete(data.id);
                  },
                  child: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
