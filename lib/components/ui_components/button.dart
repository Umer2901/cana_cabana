import 'package:cana_cabana/app/colors.dart';
import 'package:cana_cabana/app/fonts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    this.borderColor,
    this.onTap,
    this.color = AppColors.primaryColor,
    this.width,
    this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.elevation = 0,
    super.key,
  });
  final VoidCallback? onTap;
  final String text;
  final Color? borderColor;
  final Color color;
  final double? height;
  final double? width;
  final BorderRadius borderRadius;
  final double elevation;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: borderRadius,
      child: InkWell(
        splashColor: Colors.black12,
        borderRadius: borderRadius,
        onTap: onTap,
        child: Ink(
          height: height,
          width: width,
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
                Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontFamily: AppFont.montserratBold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
