import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String? hintText;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final TextEditingController? controller;
  final bool autofocus;
  final Widget? label;
  final Function(String)? onSubmitted;
  final Widget? suffixIconOnFocus;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Color? borderColor;
  final Widget? prefixIcon;

  const AppTextField({
    super.key,
    this.hintText,
    this.controller,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.autofocus = false,
    this.label,
    this.onSubmitted,
    this.suffixIconOnFocus,
    this.keyboardType,
    this.focusNode,
    this.borderColor,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      autofocus: autofocus,
      minLines: minLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      maxLines: maxLines ?? minLines,
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,
      onSubmitted: (value) {
        FocusScope.of(context).unfocus();
        onSubmitted?.call(value);
      },
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        isDense: true,
        hintText: hintText,
        label: label,
        suffixIconConstraints: const BoxConstraints(maxHeight: 50, maxWidth: 100),
        suffixIcon: suffixIconOnFocus,
        hintStyle: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
