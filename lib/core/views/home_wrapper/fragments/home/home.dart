import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/components/dialogs/dialog.dart';
import 'package:cana_cabana/components/shimmer.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/components/ui_components/product_card.dart';
import 'package:cana_cabana/components/ui_components/text_field.dart';
import 'package:cana_cabana/core/controllers/home_controller.dart';
import 'package:cana_cabana/models/store.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:cana_cabana/util/globals.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class Home extends StatelessWidget {
  Home({super.key});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: Get.height * 0.13,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(AppImages.justLogo),
            Expanded(
              child: GetBuilder<HomeController>(
                builder: (controller) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Column(
                          key: const ValueKey("1"),
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              textAlign: TextAlign.center,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "${controller.selectedStore.value.name} ",
                                    style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      color: AppColors.primaryColor,
                                      fontSize: 18,
                                      fontFamily: AppFont.montserratBold,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "(Change)",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        controller.highestOffsetCalled = 0;
                                        Get.offAllNamed(AppRoute.selectStore);

                                        controller.update();
                                      },
                                    style: const TextStyle(
                                      decoration: TextDecoration.none,
                                      color: AppColors.grey,
                                      fontSize: 13,
                                      fontFamily: AppFont.montserratBold,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Hours: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: AppFont.poppinsBold,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: controller.extractDate(controller
                                        .selectedStore.value.storeHours),
                                    style: const TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 16,
                                      fontFamily: AppFont.poppins,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Est. Delivery: ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontFamily: AppFont.poppinsBold,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '30 mins',
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 16,
                                      fontFamily: AppFont.poppins,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              showLogoutDialog();
            },
            icon: const CircleAvatar(
              backgroundColor: AppColors.lightDotColor,
              child: Icon(
                Icons.person_rounded,
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              // await controller.appBarFadeAnimationController.reverse();
            },
            icon: const CircleAvatar(
              backgroundColor: AppColors.lightDotColor,
              child: Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
        child: GetBuilder<HomeController>(
          builder: (_) {
            return Stack(
              children: [
                const ProductView(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class StrainTile extends StatelessWidget {
  const StrainTile({this.isSelected = false, required this.title, super.key});
  final bool isSelected;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: Get.width * 0.2,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.white,
            border: Border.all(
              color:
                  isSelected ? AppColors.primaryColor : AppColors.darkDotColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Get.width * 0.06, vertical: Get.height * 0.01),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                fontFamily: AppFont.montserratBold,
                color: isSelected ? AppColors.white : AppColors.darkDotColor),
          )),
        ),
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return SingleChildScrollView(
      controller: controller.productViewScrollController,
      child: Shimmer(
        linearGradient: _shimmerGradient,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomTextField(
              hintText: "Search",
              suffixIcon: Icon(
                Icons.tune_rounded,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            SizedBox(
                height: Get.height * 0.045,
                child: Row(
                  children: List.generate(
                    controller.strains.length,
                    (index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.04),
                      child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        onTap: () {
                          controller.selectedStrain.value =
                              controller.strains[index];
                        },
                        child: Obx(
                          () => StrainTile(
                            title: controller.strains[index],
                            isSelected: controller.selectedStrain.value ==
                                controller.strains[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Low: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: AppFont.poppinsBold,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: controller.sliderValues.value.start
                                  .toStringAsFixed(0),
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 16,
                                fontFamily: AppFont.poppins,
                              ),
                            ),
                          ],
                        ),
                      )),
                  Obx(() => Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'High: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: AppFont.poppinsBold,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: controller.sliderValues.value.end
                                  .toStringAsFixed(0),
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 16,
                                fontFamily: AppFont.poppins,
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              // width: Get.width * 0.1,
              child: Obx(() => SfRangeSlider(
                    inactiveColor: AppColors.lightDotColor,
                    activeColor: AppColors.primaryColor,
                    min: 0.0,
                    max: 100.0,
                    values: controller.sliderValues.value,
                    overlayShape: const SfOverlayShape(),
                    interval: 20,
                    minorTicksPerInterval: 1,
                    onChanged: (SfRangeValues values) {
                      controller.sliderValues.value = values;
                      controller.update();
                    },
                  )),
            ),
            Flexible(
              child: Obx(() => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.loadingProduct.value
                        ? controller.dummyProducts.length
                        : controller.products.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      child: Obx(() => ShimmerLoading(
                            isLoading: controller.loadingProduct.value,
                            child: ProductCard(
                              isLoading: controller.loadingProduct.value,
                              onTap: () {
                                Get.toNamed(AppRoute.productDetails,
                                    arguments: controller.products[index]);
                              },
                              product: controller.loadingProduct.value
                                  ? controller.dummyProducts[index]
                                  : controller.products[index],
                            ),
                          )),
                    ),
                  )),
            ),
            ...List.generate(
              2,
              (index) => Shimmer(
                linearGradient: _shimmerGradient,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Obx(() => ShimmerLoading(
                        isLoading: true,
                        child: ProductCard(
                          isLoading: true,
                          onTap: () {},
                          product: controller.dummyProducts[index],
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
