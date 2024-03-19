import 'package:cana_cabana/app/fonts.dart';
import 'package:cana_cabana/app/images.dart';
import 'package:cana_cabana/models/cart_item.dart';
import 'package:cana_cabana/models/product.dart';
import 'package:cana_cabana/services/extensions.dart';
import 'package:flutter/material.dart';

import '../../app/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    this.onTap,
    this.showPrice = false,
    this.onDeleteTapped,
    this.isLoading = false,
    super.key,
  });
  final Product product;
  final VoidCallback? onTap;
  final bool showPrice;
  final VoidCallback? onDeleteTapped;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    String? startingFrom;
    double smallest = double.infinity;
    for (var element in product.variants) {
      for (var element in element.metafields) {
        final value = double.tryParse(element.memberPrice);
        if (value != null && value < smallest) {
          smallest = value;
        }
      }
    }
    startingFrom = smallest.toStringAsFixed(2);

    String? thc() {
      if (product.variants.isNotEmpty) {
        if (product.variants[0].metafields.isNotEmpty) {
          return "THC${product.variants[0].metafields[0].thcPercentage}%";
        }
      }
      return null;
    }

    String? cbd() {
      if (product.variants.isNotEmpty) {
        if (product.variants[0].metafields.isNotEmpty) {
          return "THC${product.variants[0].metafields[0].cbdPercentage}%";
        }
      }
      return null;
    }

    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        // height: Get.height * 0.2,
        child: InkWell(
          onTap: onTap,
          child: Ink(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Material(
                    elevation: isLoading ? 0 : 2,
                    child: isLoading
                        ? Image.asset(AppImages.productImage)
                        : Image.network(
                            product.images[0],
                            scale: 0.9,
                          ),
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.07,
                ),
                Expanded(
                  flex: 5,
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        isLoading
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    width: 250,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: constraints.maxWidth * 0.5,
                                    child: Text(
                                      product.name,
                                      softWrap: true,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        height: 1.1,
                                        overflow: TextOverflow.ellipsis,
                                        color: AppColors.darkDotColor,
                                        fontFamily: AppFont.poppinsBold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  if (thc() != null)
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'THC:  ',
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 18,
                                              fontFamily:
                                                  AppFont.montserratBold,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          TextSpan(
                                            text: thc()?.removeAlphabets(),
                                            style: const TextStyle(
                                              color: AppColors.grey,
                                              fontSize: 16,
                                              fontFamily:
                                                  AppFont.montserratBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  if (cbd() != null)
                                    Text.rich(
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                            text: 'CBD:  ',
                                            style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 18,
                                              fontFamily:
                                                  AppFont.montserratBold,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          TextSpan(
                                            text: cbd()?.removeAlphabets(),
                                            style: const TextStyle(
                                              color: AppColors.grey,
                                              fontSize: 16,
                                              fontFamily:
                                                  AppFont.montserratBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: "Starting from ",
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 12,
                                            fontFamily: AppFont.montserratBold,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "\$$startingFrom",
                                          style: const TextStyle(
                                            color: AppColors.grey,
                                            fontSize: 12,
                                            fontFamily: AppFont.montserratBold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: constraints.maxWidth * 0.5,
                                    child: Text(
                                      product.description,
                                      maxLines: 3,
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: AppFont.inter,
                                          color: AppColors.grey),
                                    ),
                                  ),
                                  if (product.offers != null &&
                                      product.offers!.isNotEmpty &&
                                      showPrice)
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    "\$${product.offers![0].price.toStringAsFixed(0)} ",
                                                style: const TextStyle(
                                                  color: AppColors.primaryColor,
                                                  fontSize: 18,
                                                  fontFamily:
                                                      AppFont.montserratBold,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              const TextSpan(
                                                text: "for ",
                                                style: TextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      AppFont.montserratBold,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    "${product.offers![0].quantity.toStringAsFixed(1)}g",
                                                style: const TextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      AppFont.montserratBold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: onDeleteTapped ?? () {},
                                            icon: const Icon(
                                                Icons.delete_rounded))
                                      ],
                                    )
                                ],
                              ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    required this.product,
    this.onTap,
    this.showPrice = false,
    this.onDeleteTapped,
    super.key,
  });
  final CartItem product;
  final VoidCallback? onTap;
  final bool showPrice;
  final VoidCallback? onDeleteTapped;
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
      builder: (context, constraints) => SizedBox(
        // height: Get.height * 0.2,
        child: InkWell(
          onTap: onTap,
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
                      product.product.images[0],
                      scale: 0.9,
                    ),
                  ),
                ),
                SizedBox(
                  width: constraints.maxWidth * 0.07,
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
                            product.name,
                            softWrap: true,
                            maxLines: 2,
                            style: const TextStyle(
                              height: 1.1,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.darkDotColor,
                              fontFamily: AppFont.poppinsBold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        product.thcPercentage != null
                            ? Text.rich(
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
                                          "${product.thcPercentage!.toStringAsFixed(0)}%",
                                      style: const TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 16,
                                        fontFamily: AppFont.montserratBold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        product.cbdPercentage != null
                            ? Text.rich(
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
                                          "${product.cbdPercentage!.toStringAsFixed(0)}%",
                                      style: const TextStyle(
                                        color: AppColors.grey,
                                        fontSize: 16,
                                        fontFamily: AppFont.montserratBold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        SizedBox(
                          width: constraints.maxWidth * 0.5,
                          child: Text(
                            product.description,
                            maxLines: 3,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontFamily: AppFont.inter,
                                color: AppColors.grey),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        "\$${product.variant.metafields[0].price} ",
                                    style: const TextStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 18,
                                      fontFamily: AppFont.montserratBold,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: "for ",
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 16,
                                      fontFamily: AppFont.montserratBold,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "${convertOuncesToGrams(product.variant.metafields[0].quantity)}",
                                    style: const TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 16,
                                      fontFamily: AppFont.montserratBold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: onDeleteTapped ?? () {},
                                icon: const Icon(Icons.delete_rounded))
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
