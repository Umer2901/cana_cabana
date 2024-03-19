import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/components/ui_components/cache_image.dart';
import 'package:cana_cabana/models/carousel_images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class Carousel extends StatelessWidget {
  Carousel(
      {required this.height,
      required this.width,
      required this.carouselController,
      required this.carouselImages,
      required this.showIndicators,
      this.showArrows = false,
      super.key});
  // VenueInformationController controller;

  final double height;
  final double width;
  bool showArrows;
  final CarouselController carouselController;
  final List<CarouselImage> carouselImages;

  final bool showIndicators;
  RxInt currentPageIndex = 0.obs;
  RxBool isFirst = true.obs;
  RxBool isLast = true.obs;
  @override
  Widget build(BuildContext context) {
    // var animationController = Get.put(MyAnimationController());
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: CarouselSlider(
                      carouselController: carouselController,
                      items: List.generate(
                        carouselImages.length,
                        (index) => GestureDetector(
                          onTap: () {
                            // Get.to(() => WebViewScreen(
                            //       url: carouselImages[index].link,
                            //       categoryName: "AD",
                            //     ));
                          },
                          child: Container(
                            // color: AppColors.whitePure,

                            width: width,
                            decoration: const BoxDecoration(
                                // color: AppColors.whitePure,
                                // borderRadius: BorderRadius.all(
                                //   Radius.circular(5),
                                // ),
                                ),
                            child: carouselImages[index].isLocal
                                ? Image.asset(
                                    carouselImages[index].image,
                                    fit: BoxFit.fill,
                                  )
                                : MyCachedImageWidget(
                                    imageUrl: carouselImages[index].image,
                                    prefix: "ads"),
                          ),
                        ),
                      ),
                      options: CarouselOptions(
                        height: height,
                        enableInfiniteScroll: true,
                        viewportFraction: 1,
                        initialPage: 0,
                        autoPlayAnimationDuration: const Duration(
                          milliseconds: 400,
                        ),
                        scrollPhysics: const NeverScrollableScrollPhysics(),
                        autoPlay: true,
                        autoPlayInterval: const Duration(
                          seconds: 7,
                        ),
                        autoPlayCurve: Curves.linear,
                        enlargeCenterPage: false,
                        onPageChanged: (index, reason) {
                          currentPageIndex.value = index;
                          if (index == 0) {
                            isFirst.value = true;
                          } else {
                            isFirst.value = false;
                          }
                          if (index == (carouselImages.length - 1)) {
                            isLast.value = true;
                          } else {
                            isLast.value = false;
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            carouselImages.length != 1 && showIndicators
                ? Positioned.fill(
                    child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Obx(() => AnimatedSmoothIndicator(
                            activeIndex: currentPageIndex.value,
                            count: carouselImages.length,
                            effect: JumpingDotEffect(
                              dotColor: AppColors.white,
                              activeDotColor: AppColors.primaryColor,
                              dotHeight: height * 0.04,
                              dotWidth: width * 0.01,
                            ),
                          )),
                    ),
                  ))
                : const SizedBox(),
            carouselImages.length != 1 && showArrows
                ? Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: width * 0.07),
                        child: InkWell(
                          onTap: () {
                            if (!isLast.value) {
                              carouselController.nextPage();
                            }
                          },
                          child: Obx(() => CircleAvatar(
                                radius: 15,
                                backgroundColor: isLast.value
                                    ? AppColors.white
                                    : AppColors.primaryColor,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: isLast.value
                                      ? AppColors.primaryColor
                                      : AppColors.white,
                                ),
                              )),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
            carouselImages.length != 1 && showArrows
                ? Positioned.fill(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.07),
                        child: InkWell(
                          onTap: () {
                            if (!isFirst.value) {
                              carouselController.previousPage();
                            }
                          },
                          child: Obx(() => CircleAvatar(
                                radius: 15,
                                backgroundColor: isFirst.value
                                    ? AppColors.white
                                    : AppColors.primaryColor,
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  color: isFirst.value
                                      ? AppColors.primaryColor
                                      : AppColors.white,
                                ),
                              )),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
