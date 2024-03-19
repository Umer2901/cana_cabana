import 'dart:developer';
import 'dart:io';

import 'package:cana_cabana/services/image_processing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCachedImageWidget extends StatefulWidget {
  final String imageUrl;
  final String prefix;
  final bool isSvg;
  final bool fill;
  final BoxShape shape;
  const MyCachedImageWidget({
    super.key,
    required this.imageUrl,
    required this.prefix,
    this.isSvg = false,
    this.fill = false,
    this.shape = BoxShape.rectangle,
  });

  @override
  State<MyCachedImageWidget> createState() => _MyCachedImageWidgetState();
}

class _MyCachedImageWidgetState extends State<MyCachedImageWidget> {
  bool downloadImage = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ImageProcessor.cacheImage(
        widget.imageUrl,
        widget.prefix,
      ),
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        } else if (snapshot.error != null) {
          return const SizedBox();
        } else {
          downloadImage = false;

          if (widget.isSvg) {
            return SvgPicture.file(
              snapshot.data!,
            );
          }
          return Container(
            height: 680.h,
            width: 280.w,
            decoration: BoxDecoration(
              shape: widget.shape,
              image: DecorationImage(
                image: FileImage(
                  snapshot.data!,
                ),
                fit: widget.fill ? BoxFit.fill : BoxFit.contain,
                onError: (error, stackTrace) {
                  log("onError Images has been Called....");
                  downloadImage = true;
                },
              ),
            ),
          );
        }
      },
    );
  }
}
