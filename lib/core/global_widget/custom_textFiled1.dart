import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField1 extends StatelessWidget {
  const CustomTextField1({
    super.key,
    this.textEditingController,
    this.textInputAction = TextInputAction.next,
    this.inputTextStyle = const TextStyle(),
    this.textAlignVertical = TextAlignVertical.center,
    this.textAlign = TextAlign.start,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.hintText,
    this.labelText = '',
    this.hintStyle = const TextStyle(),
    this.fillColor = const Color(0xFFF9F9FB),
    this.suffixIconColor,
    this.suffixIcon,
    this.borderRadius = 8,
    this.onChanged,
    this.onFieldSubmitted,
    this.isPassword = false,
    this.isPrefixIcon = false,
    this.onTapClick,
    this.readOnly = false,
    this.width,
    this.height,
    this.isEnabled,
    this.containerClick,
    this.contentPadding,
  });

  final TextEditingController? textEditingController;
  final TextInputAction textInputAction;
  final TextStyle? inputTextStyle;
  final TextAlignVertical? textAlignVertical;
  final TextAlign textAlign;
  final int? maxLines;
  final int? maxLength;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String labelText;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? suffixIconColor;
  final Widget? suffixIcon;
  final double borderRadius;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final bool isPassword;
  final bool isPrefixIcon;
  final VoidCallback? onTapClick;
  final bool readOnly;
  final double? height;
  final double? width;
  final bool? isEnabled;
  final void Function()? containerClick;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: containerClick,
      child: Container(
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFE2E8F0)),
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          onTap: onTapClick,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          readOnly: readOnly,
          controller: textEditingController,
          textInputAction: textInputAction,
          style: inputTextStyle,
          maxLines: maxLines,
          maxLength: maxLength,
          validator: validator,
          textAlign: TextAlign.start,
          enabled: isEnabled ?? true,
          decoration: InputDecoration(
            errorMaxLines: 2,
            hintText: hintText,
            contentPadding: contentPadding ?? EdgeInsets.all(16.r),
            hintStyle: hintStyle,
            fillColor: fillColor,
            filled: true,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(width: 1.w, color: Color(0xFFE2E8F0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(width: 1.w, color: Color(0xFFE2E8F0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(width: 1.w, color: Color(0xFFE2E8F0)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(width: 1.w, color: Color(0xFFE2E8F0)),
            ),
          ),
        ),
      ),
    );
  }
}
