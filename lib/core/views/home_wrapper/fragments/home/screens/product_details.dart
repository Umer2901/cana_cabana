import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/components/dialogs/add_to_cart_dialogs.dart';
import 'package:cana_cabana/core/controllers/cart_controller.dart';
import 'package:cana_cabana/core/controllers/product_details_controller.dart';
import 'package:cana_cabana/models/cart_item.dart';
import 'package:cana_cabana/models/offer.dart';
import 'package:cana_cabana/models/product.dart';
import 'package:cana_cabana/models/variants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key});
  final ProductDetailsController controller =
      Get.find<ProductDetailsController>();
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.product.name,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * 0.2,
                  child: Ink(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Material(
                            elevation: 2,
                            child: Image.network(
                              controller.product.images[0],
                              scale: 0.9,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: constraints.maxWidth * 0.5,
                                  child: Text(
                                    controller.product.name,
                                    softWrap: true,
                                    maxLines: 2,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.darkDotColor,
                                      fontFamily: AppFont.poppinsBold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'THC:  ',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 18,
                                          fontFamily: AppFont.montserratBold,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "${controller.product.variants[0].metafields[0].thcPercentage}%",
                                        style: const TextStyle(
                                          color: AppColors.grey,
                                          fontSize: 16,
                                          fontFamily: AppFont.montserratBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: 'CBD:  ',
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: 18,
                                          fontFamily: AppFont.montserratBold,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "${controller.product.variants[0].metafields[0].cbdPercentage}%",
                                        style: const TextStyle(
                                          color: AppColors.grey,
                                          fontSize: 16,
                                          fontFamily: AppFont.montserratBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.01,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Description",
                    style: TextStyle(
                        fontFamily: AppFont.montserratBold, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.005,
                ),
                ReadMoreText(
                  controller.product.description,
                  moreStyle: TextStyle(color: AppColors.primaryColor),
                  lessStyle: TextStyle(color: AppColors.primaryColor),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.04,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: SizedBox(),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.03,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.darkDotColor,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(2),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Member Price",
                                style: TextStyle(
                                  fontFamily: AppFont.montserratBold,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.03,
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.darkDotColor,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(2),
                              ),
                            ),
                            child: const Center(
                                child: Text(
                              "Price",
                              style: TextStyle(
                                  fontFamily: AppFont.montserratBold,
                                  fontSize: 17),
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.01,
                    ),
                    if (controller.product.variants.isNotEmpty)
                      ...List.generate(
                          controller.product.variants.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  controller.selectedOfferIndex.value = index;
                                },
                                child: Obx(
                                  () => PriceRow(
                                    isSelected:
                                        controller.selectedOfferIndex.value ==
                                            index,
                                    variant: controller.product.variants[index],
                                  ),
                                ),
                              )),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.3,
                      child: const Center(
                        child: Text(
                          "Quantity: ",
                          style: TextStyle(
                              fontFamily: AppFont.montserratBold, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: const BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (controller.quantity.value > 1) {
                                controller.quantity.value--;
                              }
                            },
                            icon: const Icon(
                              Icons.remove_rounded,
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxHeight * 0.01,
                          ),
                          Obx(
                            () => Text(
                              controller.quantity.value.toString(),
                              style: const TextStyle(
                                  fontFamily: AppFont.montserratBold,
                                  color: AppColors.primaryColor),
                            ),
                          ),
                          SizedBox(
                            width: constraints.maxHeight * 0.01,
                          ),
                          IconButton(
                            onPressed: () {
                              controller.quantity.value++;
                            },
                            icon: const Icon(
                              Icons.add_rounded,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.03,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.3,
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Total price",
                              style: TextStyle(
                                  color: Colors.grey[500],
                                  fontFamily: AppFont.montserratBold),
                            ),
                            Obx(() => Text(
                                  "\$${controller.totalPrice().value}",
                                  style: const TextStyle(
                                    color: AppColors.darkDotColor,
                                    fontFamily: AppFont.montserratBold,
                                    fontSize: 24,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: AddToCartButton(
                            onTap: () {
                              if (controller.selectedOfferIndex.value != -1) {
                                Product product = controller.product;

                                showAddToCartDialog(failure: false);

                                cartController.cartItems.add(CartItem(
                                  product: product,
                                  name: product.name,
                                  id: product.id.toString(),
                                  description: product.description,
                                  variant: product.variants[
                                      controller.selectedOfferIndex.value],
                                  quantity: controller.quantity.value,
                                ));
                                cartController.update();
                                print(cartController.cartItems.length);
                              } else {
                                showAddToCartDialog(failure: true);
                              }
                            },
                            text:
                                // controller.selectedOfferIndex >
                                //         controller.product.offers!.length
                                "Add to Cart"
                            // : "Add ${controller.product.offers![controller.selectedOfferIndex.value].quantity} g",
                            ))
                  ],
                ),
                SizedBox(
                  height: constraints.maxWidth * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Strain Analysis",
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: AppFont.montserrat),
                        ),
                        Text(
                          "Terpene Profile",
                          style: TextStyle(
                              color: AppColors.darkDotColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                              fontFamily: AppFont.montserrat),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.caryophyllenePeppery),
                            const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Caryophyllene -  ',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12,
                                      fontFamily: AppFont.montserratBold,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Peppery",
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 12,
                                      fontFamily: AppFont.montserratBold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(AppImages.caryophyllenePeppery),
                            const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Caryophyllene -  ',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12,
                                      fontFamily: AppFont.montserratBold,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Peppery",
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 12,
                                      fontFamily: AppFont.montserratBold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset(AppImages.caryophyllenePeppery),
                            const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Caryophyllene -  ',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 12,
                                      fontFamily: AppFont.montserratBold,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Peppery",
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 12,
                                      fontFamily: AppFont.montserratBold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PriceRow extends StatelessWidget {
  const PriceRow({required this.variant, this.isSelected = false, super.key});
  final Variant variant;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    String convertOuncesToGrams(String input) {
      double grams;
      if (input == "each") {
        return "Each";
      }
      switch (input.toLowerCase()) {
        case "half_gram":
          grams = 1.5;
        case 'eighth_ounce':
          grams = 3.5; // 1 eighth ounce is equivalent to 3.5 grams
          break;
        case 'quarter_ounce':
          grams = 7.0; // 1 quarter ounce is equivalent to 7.0 grams
          break;
        case 'ounce':
          grams = 28.35; // 1 ounce is equivalent to 28.35 grams
          break;
        default:
          return 'Invalid input';
      }

      return '$grams g';
    }

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        color: isSelected ? Colors.grey : null,
        // padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(6),
                  ),
                ),
                child: Center(
                  child: Text(
                    convertOuncesToGrams(variant.metafields[0].quantity),
                    style: const TextStyle(
                        fontFamily: AppFont.montserratBold, fontSize: 17),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.03,
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "\$${variant.metafields[0].memberPrice}",
                  style: const TextStyle(
                      fontFamily: AppFont.montserratBold,
                      color: AppColors.primaryColor,
                      fontSize: 20),
                ),
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * 0.03,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Text(
                    "\$${variant.metafields[0].price}",
                    style: const TextStyle(
                        fontFamily: AppFont.montserratBold, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    required this.text,
    this.borderColor,
    this.onTap,
    this.color = AppColors.primaryColor,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    super.key,
  });
  final VoidCallback? onTap;
  final String text;
  final Color? borderColor;
  final Color color;
  final double? height;
  final double? width;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        splashColor: Colors.black12,
        borderRadius: borderRadius,
        onTap: onTap,
        child: Material(
          elevation: 3,
          borderRadius: borderRadius,
          child: Ink(
            decoration: BoxDecoration(
              border: borderColor != null
                  ? Border.all(color: borderColor!, width: 1)
                  : null,
              color: color,
              borderRadius: borderRadius,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_bag_rounded,
                    color: AppColors.white,
                  ),
                  SizedBox(width: Get.width * 0.03),
                  Text(
                    text,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFont.montserrat,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
