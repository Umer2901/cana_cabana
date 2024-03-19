import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/components/dialogs/dialog.dart';
import 'package:cana_cabana/components/shimmer.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/components/ui_components/product_card.dart';
import 'package:cana_cabana/components/ui_components/text_field.dart';
import 'package:cana_cabana/core/controllers/home_controller.dart';
import 'package:cana_cabana/core/controllers/select_store_controller.dart';
import 'package:cana_cabana/models/store.dart';
import 'package:cana_cabana/routes/routes.dart';
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

class SelectStore extends StatelessWidget {
  SelectStore({super.key});
  final SelectStoreController controller = Get.find<SelectStoreController>();

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
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Select a store",
                    style: TextStyle(fontFamily: AppFont.poppinsBold),
                  ),
                ],
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
          child: const StoreView()),
    );
  }
}

class StoreWidget extends StatelessWidget {
  const StoreWidget({required this.onTap, this.store, super.key});
  final VoidCallback onTap;
  final Store? store;
  String extractDate(String date) {
    int colonIndex = date.indexOf(':');
    if (colonIndex != -1) {
      String resultString = date.substring(colonIndex + 1).trim();
      return resultString;
    }
    return "Failed to extract hours";
    // Extract the substring starting from the character after the colon
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Get.height * 0.02, horizontal: Get.width * 0.05),
      child: Material(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        shadowColor: Colors.black,
        elevation: 10,
        color: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
              child: Stack(
                children: [
                  const Material(
                    color: Colors.grey,
                    elevation: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          AppImages.storeImage,
                          fit: BoxFit.fitWidth,
                          scale: 0.9,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${store?.title} ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: AppFont.montserratBold,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const TextSpan(
                          text: '(13 km away)',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontFamily: AppFont.montserrat,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Location: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: AppFont.poppinsBold,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: store?.address,
                          style: const TextStyle(
                            overflow: TextOverflow.fade,
                            color: AppColors.grey,
                            fontSize: 15,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Contact No. : ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: AppFont.poppinsBold,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: store?.phone,
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 15,
                            fontFamily: AppFont.poppins,
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
                            fontSize: 15,
                            fontFamily: AppFont.poppinsBold,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: extractDate(store?.storeHours ?? ""),
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 15,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Delivery: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: AppFont.poppinsBold,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: store?.delivery != null && store?.delivery != ""
                              ? store?.delivery as String
                              : "Not available",
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 15,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'License No. : ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: AppFont.poppinsBold,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: store?.licenseNumber,
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 15,
                            fontFamily: AppFont.poppins,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.008,
            ),
            CustomButton(
              text: "Shop this store",
              onTap: onTap,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(
                  20,
                ),
              ),
            ),
          ],
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

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SelectStoreController>();
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Shimmer(
        linearGradient: _shimmerGradient,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(left: Get.height * .025),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nearby Stores",
                  style:
                      TextStyle(fontFamily: AppFont.poppinsBold, fontSize: 20),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Obx(() => ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.loadingStores.value
                        ? 2
                        : controller.stores.length,
                    itemBuilder: (context, index) {
                      return Obx(() => ShimmerLoading(
                            isLoading: controller.loadingStores.value,
                            child: StoreWidget(
                              store: controller.loadingStores.value
                                  ? null
                                  : controller.stores[index],
                              onTap: () {
                                if (!controller.loadingStores.value) {
                                  controller.selectedStore =
                                      controller.stores[index].obs;
                                  controller.update();
                                  Get.offAllNamed(AppRoute.homeWrapper,
                                      arguments:
                                          controller.selectedStore!.value);
                                }

                                // controller.getProductsByStore(
                                //     controller.selectedStore!.value.id);
                              },
                            ),
                          ));
                    },
                  )),
            ),
            if (!controller.loadingStores.value && controller.stores.isEmpty)
              SizedBox(
                height: Get.height * 0.7,
                child: const Center(
                  child: Text(
                    "No Stores found",
                    style: TextStyle(
                      fontFamily: AppFont.montserratBold,
                      fontSize: 25,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
