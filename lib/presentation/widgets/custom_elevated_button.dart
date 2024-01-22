import 'package:flutter/material.dart';
import 'base_button.dart';

class CustomElevatedButton extends BaseButton {
  const CustomElevatedButton(
      {super.key,
      this.decoration,
      this.leftIcon,
      this.rightIcon,
      EdgeInsets? margin,
      EdgeInsets? padding,
      VoidCallback? onTap,
      ButtonStyle? buttonStyle,
      Alignment? alignment,
      TextStyle? buttonTextStyle,
      bool? isDisabled,
      double? height,
      double? width,
      required String text,
      this.loading = false})
      : super(
          text: text,
          onTap: onTap,
          buttonStyle: buttonStyle,
          isDisabled: isDisabled,
          buttonTextStyle: buttonTextStyle,
          height: height,
          width: width,
          alignment: alignment,
          margin: margin,
          padding: padding,
        );

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => InkWell(
        onTap: (isDisabled ?? false || loading) ? null : onTap ?? () {},
        child: Container(
          height: height,
          width: width,
          margin: margin,
          padding: padding,
          decoration: decoration,
          child: loading
              ? const CircularProgressIndicator()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    leftIcon ?? const SizedBox.shrink(),
                    Text(
                      text,
                      style: buttonTextStyle,
                    ),
                    rightIcon ?? const SizedBox.shrink(),
                  ],
                ),
        ),
      );
}
