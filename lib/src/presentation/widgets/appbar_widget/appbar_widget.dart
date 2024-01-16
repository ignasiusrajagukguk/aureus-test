import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/extentions.dart';
import 'package:aureus_group/src/common/constants/icon_path.dart';
import 'package:aureus_group/src/presentation/widgets/separator_widget.dart';
import 'package:aureus_group/src/presentation/widgets/text_fields/text_form_field.dart';
import 'package:aureus_group/src/presentation/widgets/typography/typography.dart';
import 'package:flutter/material.dart';

class AppBarWidgets {
  static AppBar customColorAppBarWithBackButton(
    BuildContext context,
    String title,
    Color backgroundColor,
    Color titleAndIconColor, {
    void Function()? onBackTap,
    Widget? leading,
    List<Widget>? actions,
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: 64,
      titleSpacing: 0,
      title: Text(
        title,
        style: TextStyle(color: titleAndIconColor),
      ).themeHeadingH5Small(),
      elevation: 0,
      leading: leading?? IconButton(
        padding: const EdgeInsets.all(0),
        icon: Icon(Icons.arrow_back_ios, size: 20, color: titleAndIconColor),
        onPressed: () {
          if (onBackTap != null) {
            onBackTap();
          } else {
            Navigator.of(context).maybePop();
          }
        },
      ),
      actions: actions,
    );
  }

  static AppBar homeAppBar(
    BuildContext context,
    Color backgroundColor, {
    required String personName,
    void Function()? onBackTap,
    List<Widget>? actions,PreferredSizeWidget? bottom
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: 0,
      titleSpacing: 0,
      leading: const SizedBox(),
      automaticallyImplyLeading: false,
      elevation: 0,
      bottom: bottom,
      toolbarHeight: 180,
      flexibleSpace: FlexibleSpaceBar(
        title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              BodyText.dflt(
                'Hi $personName',
                color: ConstColors.dark80,
              ),
              SeparatorWidget.width6(),
              Image.asset(
                IconPaths.halloIcon,
                height: 16,
              )
            ],
          ),
          SeparatorWidget.height15(),
          const Heading.h3Large(
            'Find The Best Job Here!',
            color: ConstColors.dark80,
          ),
          SeparatorWidget.height15(),
          TextFormFieldWidget.searchCustom(
            'Start Searching for jobs',
            backgroundColor: ConstColors.white.withOpacity(0.1),
          )
        ]),
        titlePadding: const EdgeInsets.only(top: 50, left: 15, right: 15),
      ),
      actions: actions,
    );
  }

  static AppBar customColorAppBarWithIcon(
    BuildContext context,
    String title,{
    Color? backgroundColor,
    Color? titleAndIconColor,IconData? icon
  }) {
    return AppBar(
      backgroundColor: backgroundColor,
      leadingWidth: 15,
      titleSpacing: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: titleAndIconColor),
          ).themeHeadingH4Bold(),
          SeparatorWidget.width10(),
          Icon(icon, color: titleAndIconColor,size: 28,)
        ],
      ),
      elevation: 0,
      leading: const SizedBox(),
    );
  }
}
