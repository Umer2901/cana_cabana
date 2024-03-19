import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.controller,
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.elevation = 0,
    this.color,
    this.maxLines = 1,
    this.keyboardType,
    this.autofillHints,
    this.onChanged,
    super.key,
  });
  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? elevation;
  final Color? color;
  final int? maxLines;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
   final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Material(
            elevation: elevation ?? 0,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: TextFormField(
              controller: controller,
              keyboardType: keyboardType,
              autofillHints: autofillHints,
              onChanged: onChanged,
              maxLines: maxLines,
              decoration: InputDecoration(
                hintText: hintText,
                prefixIcon: prefixIcon,
                filled: true,
                fillColor: color ?? Colors.grey[200],
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  borderSide: BorderSide(color: Colors.grey[200]!),
                ),
              ),
            ),
          ),
        ),
        if (suffixIcon != null)
          Positioned.fill(
              child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: suffixIcon,
            ),
          ))
      ],
    );
  }
}
