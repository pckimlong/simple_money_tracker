import 'package:flutter/services.dart';

import '../../../exports.dart';
import '../core/core.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    Key? key,
    this.autofocus = false,
    this.hintText,
    this.height = AS.buttonHeight,
    this.controller,
    this.onChanged,
    this.onTap,
    this.focusNode,
    this.suffix,
    this.suffixIcon,
    this.suffixText,
    this.prefix,
    this.prefixIcon,
    this.prefixText,
    this.readonly = false,
    this.backgroundColor,
    this.enableInteractiveSelection,
    this.obscureText = false,
    this.textInputType,
    this.validator,
    this.borderColor,
    this.maxLength,
    this.errorText,
    this.textCapitalization = TextCapitalization.none,
    this.maxLines = 1,
    this.textStyle,
    this.minLines,
    this.contentPadding,
    this.textInputAction,
    this.onEditingComplete,
    this.label,
    this.inputFormatters,
    this.counterWidget,
  }) : super(key: key);

  final bool autofocus;
  final String? hintText;
  final double height;
  final TextEditingController? controller;
  final Function(String?)? onChanged;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final Widget? suffix;
  final Widget? suffixIcon;
  final String? suffixText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final String? prefixText;
  final bool readonly;
  final Color? backgroundColor;
  final bool? enableInteractiveSelection;
  final bool obscureText;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final int? maxLength;
  final String? errorText;
  final TextCapitalization textCapitalization;
  final int? maxLines;
  final TextStyle? textStyle;
  final int? minLines;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;
  final Widget? label;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? counterWidget;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: textCapitalization,
      enableInteractiveSelection: true,
      readOnly: readonly,
      autofocus: autofocus,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      focusNode: focusNode,
      maxLines: maxLines,
      minLines: minLines,
      style: textStyle,
      onTap: onTap,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      maxLength: maxLength,
      onEditingComplete: onEditingComplete,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        label: label,
        suffix: suffix,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 13,
        ),
        counter: counterWidget,
        errorText: errorText,
        // constraints: maxLines == null
        //     ? const BoxConstraints(minHeight: AS.buttonHeight)
        //     : const BoxConstraints(
        //         minHeight: AS.buttonHeight,
        //         maxHeight: AS.buttonHeight,
        //       ),
        suffixIcon: suffixIcon,
        suffixText: suffixText,
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixText: prefixText,
        isDense: true,
        hintText: hintText,
        filled: true,
        fillColor: backgroundColor,
      ),
    );
  }
}
