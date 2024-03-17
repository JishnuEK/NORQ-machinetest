import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test16032024/common/custom_size.dart';
import 'package:test16032024/common/general.dart';
import 'package:test16032024/local_storage/local_storage_cache.dart';
import 'package:test16032024/modules/home/controller/home_controller.dart';
import 'package:test16032024/modules/home/screen/screen_product_details.dart';
import 'package:test16032024/modules/home/widgets/product_widgets.dart';
import 'package:test16032024/modules/login/controller/auth_controller.dart';
import 'package:test16032024/routes/app_routes.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8.0),
          child: Column(
            children: [
              Container(
                // decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.r),bottomRight: Radius.circular(15.r)),
                color: Theme.of(context).colorScheme.background,
                // ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        width: 55,
                        height: 55,
                        child: ClipOval(
                            child: NetworkImageViewer(
                          'https://i.pinimg.com/564x/8f/8e/a7/8f8ea700deb03b8d297663c3f9c94386.jpg',
                          fit: BoxFit.cover,
                        )),
                      ),
                      customHorizontalGap(10),
                      Expanded(
                        child: Text(
                          LocalStorageCache.getUserCache() == null
                              ? ''
                              : LocalStorageCache.getUserCache().userEmail!,
                          style: Get.textTheme.bodyLarge!.copyWith(
                            fontSize: 18,
                            height: 1.2,
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 2,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.CART);
                          },
                          icon: const Icon(Icons.shopping_cart)),
                      IconButton(
                          onPressed: () {
                            Get.find<AuthController>().signOut();
                          },
                          icon: const Icon(Icons.logout_outlined)),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GetBuilder<HomeController>(
                    id: Get.find<HomeController>().ProductWidget,
                    builder: (controller) {
                      if (controller.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (controller.productList.isEmpty) {
                        return const Center(
                          child: Text('No Products Found!'),
                        );
                      } else {
                        return GridView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemCount: controller.productList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 0.8,
                                  mainAxisSpacing: 5.0),
                          itemBuilder: (BuildContext context, int index) {
                            return ProductCardBuild(
                                productImage:
                                    controller.productList[index].image,
                                productName:
                                    controller.productList[index].title,
                                oldPrice: controller.productList[index].price
                                    .toString(),
                                productPrice: controller
                                    .productList[index].price
                                    .toString(),
                                onClick: () {
                                  controller
                                      .addTocart(controller.productList[index]);
                                },
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ScreenProductDetails(
                                              product:
                                                  controller.productList[index],
                                            )),
                                  );
                                });
                          },
                        );
                      }
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
