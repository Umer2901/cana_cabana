import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/components/shimmer.dart';
import 'package:cana_cabana/components/ui_components/button.dart';
import 'package:cana_cabana/components/ui_components/text_field.dart';
import 'package:cana_cabana/core/controllers/home_controller.dart';
import 'package:cana_cabana/core/controllers/search_controller.dart';
import 'package:cana_cabana/core/views/home_wrapper/fragments/search/screens/search_results.dart';
import 'package:cana_cabana/models/collection.dart';
import 'package:cana_cabana/routes/routes.dart';
import 'package:cana_cabana/services/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  final controller = Get.find<SearchScreenController>();
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
            GetBuilder<SearchScreenController>(
              builder: (_) => const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search",
                    style: TextStyle(fontFamily: AppFont.poppinsBold),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hours: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: AppFont.poppinsBold,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
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
                  Text.rich(
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: const CircleAvatar(
              backgroundColor: AppColors.lightDotColor,
              child: Icon(
                Icons.person_rounded,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
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
        child: GetBuilder<SearchScreenController>(
          builder: (_) {
            return SingleChildScrollView(
                child: Stack(
              children: [
                AnimatedBuilder(
                  animation: controller.collectionAnimationController,
                  builder: (context, child) {
                    final animationPercent = Curves.easeOut.transform(
                        controller.collectionAnimationController.value);
                    final opacity = (1 - animationPercent.clamp(0.0, 1.0));
                    final slideDistance = (-animationPercent) * Get.width * 1.1;
                    return Opacity(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: Offset(slideDistance, 0),
                        child: child,
                      ),
                    );
                  },
                  child: const CollectionsView(),
                ),
                AnimatedBuilder(
                  animation: controller.collectionAnimationController,
                  builder: (context, child) {
                    final animationPercent = Curves.easeOut.transform(
                        controller.collectionAnimationController.value);
                    final opacity = animationPercent.clamp(0.0, 1.0);
                    final slideDistance =
                        (1 - animationPercent) * Get.width * 1.1;

                    return Opacity(
                      opacity: opacity,
                      child: Transform.translate(
                        offset: Offset(slideDistance, 0),
                        child: child,
                      ),
                    );
                  },
                  child: const SubCollectionsView(),
                ),
              ],
            ));
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({this.collection, super.key});
  final Collection? collection;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.43,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x14181818),
            blurRadius: 12,
            offset: Offset(-2, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      collection != null
                          ? Image.network(
                              collection!.image.formatUrl(),
                              height: Get.height * 0.2,
                              fit: BoxFit.fitWidth,
                            )
                          : SizedBox(
                              height: Get.height * 0.2,
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: Text(
                        collection == null ? 'Dried Flower' : collection!.title,
                        maxLines: 1,
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: Color(0xFF181818),
                          fontSize: 22,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CollectionsView extends StatelessWidget {
  const CollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchScreenController>();
    return Shimmer(
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
          ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Obx(() => ShimmerLoading(
                  isLoading: controller.isLoading.value,
                  child: Container(
                    width: 361,
                    height: 84,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFF4E5A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        "Clickable Marketing Banner controlled through admin interface by cloud",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.white,
                            fontFamily: AppFont.montserratBold),
                      ),
                    ),
                  ),
                )),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Obx(() => Wrap(
                children: List.generate(
                    controller.isLoading.value
                        ? 6
                        : controller.collections.length,
                    (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: ShimmerLoading(
                            isLoading: controller.isLoading.value,
                            child: InkWell(
                              onTap: () {
                                if (!controller.isLoading.value) {
                                  controller.selectedCollection =
                                      controller.collections[index];
                                  controller.subCollections.value = controller
                                      .selectedCollection!.subCollections;
                                  controller.collectionAnimationController
                                      .forward();
                                  controller.update();
                                }
                              },
                              child: CategoryCard(
                                collection: controller.isLoading.value
                                    ? null
                                    : controller.collections[index],
                              ),
                            )))),
              ))
        ],
      ),
    );
  }
}

class SubCollectionsView extends StatelessWidget {
  const SubCollectionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchScreenController>();
    return Shimmer(
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
          ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Container(
              width: 361,
              height: 84,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: ShapeDecoration(
                color: const Color(0xFFFF4E5A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: const Center(
                child: Text(
                  "Clickable Marketing Banner controlled through admin interface by cloud",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFont.montserratBold),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
            child: CustomButton(
              text: "Back",
              onTap: () {
                controller.collectionAnimationController.reverse();
              },
            ),
          ),
          SizedBox(
            height: Get.height * 0.02,
          ),
          Obx(() => Wrap(
                children: List.generate(
                    controller.subCollections.length,
                    (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: ShimmerLoading(
                            isLoading: controller.isLoading.value,
                            child: InkWell(
                              onTap: () {
                                Collection collection =
                                    controller.subCollections[index];
                                showGeneralDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  transitionDuration:
                                      Duration(milliseconds: 400),
                                  pageBuilder: (context, anim1, anim2) =>
                                      SearchResultsScreen(
                                    collectionId: collection.id,
                                    title: collection.title,
                                  ),
                                  transitionBuilder:
                                      (context, anim1, anim2, child) =>
                                          SlideTransition(
                                    position: Tween(
                                      begin: Offset(0, 1),
                                      end: Offset(0, 0),
                                    ).animate(anim1),
                                    child: child,
                                  ),
                                );
                              },
                              child: CategoryCard(
                                collection: controller.subCollections[index],
                              ),
                            )))),
              ))
        ],
      ),
    );
  }
}
