
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:openex_mobile/core/resources/app_colors.dart';
import 'package:openex_mobile/core/resources/app_text_style.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.controller,
    this.title,
    this.validator,
    this.hintText,
    this.errorText,
    this.focusNode,
    this.onEditingComplete,
    this.isPassword = false,
    this.textInputAction,
    this.inputType,
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.readOnly = false,
    this.onTap,
    this.enabled = true,
    this.autofocus = false,
    this.contentPadding,
    super.key,
  });

  final String? title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? errorText;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final bool isPassword;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  final Widget? prefixIcon;
  final Widget? prefix;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool readOnly;
  final void Function()? onTap;
  final bool enabled;
  final bool autofocus;
  final EdgeInsets? contentPadding;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final FocusNode _focusNode;
  bool _obscureText = false;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _obscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      enabled: widget.enabled,
      controller: widget.controller,
      focusNode: _focusNode,
      decoration: InputDecoration(
        labelText: widget.title,
        hintText: widget.hintText,
        errorText: widget.errorText,
        errorStyle:
            AppTextStyle.small().withColor(AppColors.red).copyWith(height: 0.7),
        contentPadding: widget.contentPadding ?? EdgeInsets.all(12.w),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4.r))),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.r)),
          borderSide: const BorderSide(color: AppColors.grey_light),
        ),
        filled: widget.enabled ? null : true,
        fillColor: widget.enabled ? null : AppColors.gray95,
        prefix: widget.prefix,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon ??
            (widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        size: 20.w),
                    onPressed: () =>
                        setState(() => _obscureText = !_obscureText),
                  )
                : null),
      ),
      keyboardType: widget.inputType,
      textInputAction: widget.textInputAction,
      onTap: widget.onTap,
      onTapOutside: (_) => _focusNode.unfocus(),
      obscureText: _obscureText,
      onEditingComplete: widget.onEditingComplete,
      style: AppTextStyle.base(),
      validator: widget.validator,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
    );
  }
}

class PhoneTextField extends StatelessWidget {
  const PhoneTextField({
    this.enabled = true,
    this.title,
    required this.controller,
    this.validator,
    this.hintText,
    this.errorText,
    this.focusNode,
    this.textInputAction,
    this.onEditingComplete,
    super.key,
  });

  final bool enabled;
  final String? title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? errorText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: Text(
              title!,
              style: AppTextStyle.base().wSemiBold(),
            ),
          ),
      ],
    );
  }
}
