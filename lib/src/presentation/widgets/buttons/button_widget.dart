import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/extentions.dart';
import 'package:aureus_group/src/common/constants/text_style.dart';
import 'package:flutter/material.dart';

class ButtonWidget {
  static Widget basicText(
    String text, {
    double? width,
    double? height = 42,
    action,
    double? borderRadius,
    Color? backgroundColor,
    Color? textColor,
    EdgeInsets? contentPadding = const EdgeInsets.all(10),
  }) {
    return TextButton(
      onPressed: action,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        backgroundColor:
            MaterialStateProperty.all(backgroundColor ?? ConstColors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
        ),
      ),
      child: Container(
        padding: contentPadding,
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyleConstants.textStyleHeadingH7XxSmall
                .copyWith(color: textColor ?? Colors.black),
          ).themeHeadingH7XxSmall(),
        ),
      ),
    );
  }

  static Widget basicWidget(
    Widget content, {
    double? width,
    double? height = 42,
    action,
    double? borderRadius,
    Color? backgroundColor,
    EdgeInsets? contentPadding = const EdgeInsets.all(10),
  }) {
    return TextButton(
      onPressed: action,
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        backgroundColor:
            MaterialStateProperty.all(backgroundColor ?? ConstColors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
          ),
        ),
      ),
      child: Container(
        padding: contentPadding,
        width: width,
        height: height,
        child: content,
      ),
    );
  }

  static customLinearColorButtonWidget(BuildContext context,
      {required Function() onTap, required Widget content, Color? color}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: content,
        ),
      ),
    );
  }
}
