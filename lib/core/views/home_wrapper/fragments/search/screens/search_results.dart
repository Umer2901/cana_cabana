import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/components/shimmer.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/components/ui_components/product_card.dart';
import 'package:cana_cabana/components/ui_components/text_field.dart';
import 'package:cana_cabana/core/controllers/home_controller.dart';
import 'package:cana_cabana/core/controllers/search_controller.dart';
import 'package:cana_cabana/core/controllers/search_results_controller.dart';
import 'package:cana_cabana/core/views/select_store/select_store.dart';
import 'package:cana_cabana/models/collection.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:cana_cabana/services/extensions.dart';
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

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen(
      {required this.collectionId, required this.title, super.key});
  final int collectionId;
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchResultsController(collectionId));
    return Dismissible(
      direction: DismissDirection.down,
      onDismissed: (_) {
        Get.back();
        Get.delete<SearchResultsController>();
      },
      key: const ValueKey(AppRoute.searchResults),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: Get.height * 0.13,
          leading: InkWell(
              onTap: () {
                Get.delete<SearchResultsController>();
                Get.back();
              },
              child: const Icon(
                Icons.arrow_downward,
                color: Colors.black,
              )),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(AppImages.justLogo),
              GetBuilder<SearchScreenController>(
                builder: (_) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Results for",
                      style: TextStyle(fontFamily: AppFont.poppinsBold),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$title',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: AppFont.poppinsBold,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const TextSpan(
                            text: '11am till 9pm',
                            style: TextStyle(
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
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
          child: GetBuilder<SearchScreenController>(
            builder: (_) {
              return const ProductView();
            },
          ),
        ),
      ),
    );
  }
}

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchResultsController>();
    return SingleChildScrollView(
      controller: controller.scrollController,
      child: Shimmer(
        linearGradient: _shimmerGradient,
        child: Obx(() => Column(
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
                        itemCount: controller.isLoading.value
                            ? controller.dummyProducts.length
                            : controller.products.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Obx(() => ShimmerLoading(
                                isLoading: controller.isLoading.value,
                                child: ProductCard(
                                  isLoading: controller.isLoading.value,
                                  onTap: () {
                                    Get.toNamed(AppRoute.productDetails,
                                        arguments: controller.products[index]);
                                  },
                                  product: controller.isLoading.value
                                      ? controller.dummyProducts[index]
                                      : controller.products[index],
                                ),
                              )),
                        ),
                      )),
                ),
                if (!controller.allProductsLoaded.value)
                  ...List.generate(
                    2,
                    (index) => Shimmer(
                      linearGradient: _shimmerGradient,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
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
            )),
      ),
    );
  }
}
