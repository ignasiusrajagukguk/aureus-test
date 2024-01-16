import 'package:aureus_group/src/common/constants/collors.dart';
import 'package:aureus_group/src/common/constants/text_style.dart';
import 'package:flutter/material.dart';

enum SizeType {
  xSmall,
  xSmallBold,
  small,
  smallBold,
  smallUnderline,
  dflt,
  large,
  largeBold,
  xLarge,
  size15,
  dfltBold,
  dfltLight,
  size13Bold,
  size13Regular
}

enum TextWidgetSizeType {
  size80,
}

enum HeadingType {
  h1XXLarge,
  h2XLarge,
  h3Large,
  h3Regular,
  h4Default,
  h4Bold,
  hSize20Bold,
  h5Small,
  h5XW500,
  h6XSmall,
  h6XSmallW500,
  h7XXSmall,
  h8SuperSmall,
  capXSmall,
  headingSize20,
  capSmall,
  capDefault,
}

abstract class _Typography {
  @protected
  TextStyle getTextStyle();
}

class Heading extends StatelessWidget implements _Typography {
  final Color? color;
  final TextOverflow? overflow;
  final HeadingType sizeType;
  final TextAlign? textAlign;
  final String text;
  const Heading(
    this.text, {
    Key? key,
    this.color = ConstColors.gray40,
    this.overflow,
    this.sizeType = HeadingType.h4Default,
    this.textAlign,
  }) : super(key: key);

  const Heading.h1XXLarge(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h1XXLarge,
        super(key: key);

  const Heading.h2XLarge(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h2XLarge,
        super(key: key);

  const Heading.h3Large(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h3Large,
        super(key: key);

  const Heading.h3Regular(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h3Regular,
        super(key: key);

  const Heading.h4Default(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h4Default,
        super(key: key);

  const Heading.h4Bold(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h4Bold,
        super(key: key);

  const Heading.h5Small(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h5Small,
        super(key: key);

  const Heading.h6XSmall(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h6XSmall,
        super(key: key);
  const Heading.h6XSmallW500(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h6XSmallW500,
        super(key: key);

  const Heading.h7XXSmall(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h7XXSmall,
        super(key: key);

  const Heading.h8SuperSmall(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h8SuperSmall,
        super(key: key);

  const Heading.capDefault(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.capDefault,
        super(key: key);

  const Heading.h5XW500(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.h5XW500,
        super(key: key);

  const Heading.capSmall(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.capSmall,
        super(key: key);

  const Heading.headingSize20(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.headingSize20,
        super(key: key);

  const Heading.capXSmall(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = HeadingType.capXSmall,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getTextStyle().copyWith(color: color),
      overflow: overflow,
      textAlign: textAlign,
    );
  }

  @override
  TextStyle getTextStyle() {
    switch (sizeType) {
      case HeadingType.h1XXLarge:
        return TextStyleConstants.textStyleHeadingH1XxLarge;
      case HeadingType.h2XLarge:
        return TextStyleConstants.textStyleHeadingH2XLarge;
      case HeadingType.h3Large:
        return TextStyleConstants.textStyleHeadingH3Large;
      case HeadingType.h3Regular:
        return TextStyleConstants.textStyleHeadingH3Regular;
      case HeadingType.h5Small:
        return TextStyleConstants.textStyleHeadingH5Small;
      case HeadingType.h6XSmall:
        return TextStyleConstants.textStyleHeadingH6XSmall;
      case HeadingType.h5XW500:
        return TextStyleConstants.textStyleHeadingH5W500;
      case HeadingType.h6XSmallW500:
        return TextStyleConstants.textStyleHeadingW500;
      case HeadingType.h7XXSmall:
        return TextStyleConstants.textStyleHeadingH7XxSmall;
      case HeadingType.h8SuperSmall:
        return TextStyleConstants.textStyleHeadingH8SuperSmall;
      case HeadingType.capSmall:
        return TextStyleConstants.textStyleHeadingCapsSmall;
      case HeadingType.capXSmall:
        return TextStyleConstants.textStyleHeadingCapsXSmall;
      case HeadingType.headingSize20:
        return TextStyleConstants.textStyleHeadingSize20;
      case HeadingType.capDefault:
        return TextStyleConstants.textStyleHeadingCapsDefault;
      case HeadingType.h4Bold:
        return TextStyleConstants.textStyleHeadingH4Bold;
      case HeadingType.h4Default:
      default:
        return TextStyleConstants.textStyleHeadingH4Default;
    }
  }
}

class Paragraph extends StatelessWidget implements _Typography {
  final Color? color;
  final String text;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final SizeType sizeType;
  const Paragraph(
    this.text, {
    Key? key,
    this.color = ConstColors.gray40,
    this.overflow,
    this.sizeType = SizeType.dflt,
    this.textAlign,
  }) : super(key: key);

  const Paragraph.dflt(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.dflt,
        super(key: key);

  const Paragraph.large(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.large,
        super(key: key);

  const Paragraph.xLarge(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.xLarge,
        super(key: key);

  const Paragraph.small(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.small,
        super(key: key);

  const Paragraph.xSmall(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.xSmall,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getTextStyle().copyWith(color: color),
      textAlign: textAlign,
      overflow: overflow,
    );
  }

  @override
  TextStyle getTextStyle() {
    switch (sizeType) {
      case SizeType.xLarge:
        return TextStyleConstants.textStyleParagraphXlarge;
      case SizeType.xSmall:
      case SizeType.small:
        return TextStyleConstants.textStyleParagraphSmall;
      case SizeType.large:
        return TextStyleConstants.textStyleParagraphLarge;
      case SizeType.dflt:
      default:
        return TextStyleConstants.textStyleParagraphDefault;
    }
  }
}

class BodyText extends StatelessWidget implements _Typography {
  final Color? color;
  final String text;
  final TextOverflow? overflow;
  final SizeType sizeType;
  final TextAlign? textAlign;
  const BodyText(
    this.text, {
    Key? key,
    this.color = ConstColors.gray40,
    this.overflow,
    this.sizeType = SizeType.dflt,
    this.textAlign,
  }) : super(key: key);

  const BodyText.dflt(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.dflt,
        super(key: key);

  const BodyText.dfltBold(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.dfltBold,
        super(key: key);

  const BodyText.dfltLight(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.dfltLight,
        super(key: key);

  const BodyText.large(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.large,
        super(key: key);

  const BodyText.largeBold(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.largeBold,
        super(key: key);

  const BodyText.xLarge(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.xLarge,
        super(key: key);

  const BodyText.small(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.small,
        super(key: key);

  const BodyText.smallBold(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.smallBold,
        super(key: key);

  const BodyText.smallUnderline(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.smallUnderline,
        super(key: key);

  const BodyText.size13Regular(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.size13Regular,
        super(key: key);

  const BodyText.size13Bold(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.size13Bold,
        super(key: key);

  const BodyText.xSmall(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.xSmall,
        super(key: key);

  const BodyText.xSmallBold(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = SizeType.xSmallBold,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getTextStyle().copyWith(color: color),
      overflow: overflow,
      textAlign: textAlign,
    );
  }

  @override
  TextStyle getTextStyle() {
    switch (sizeType) {
      case SizeType.xSmallBold:
        return TextStyleConstants.textStyleTextXSmallBold;
      case SizeType.xSmall:
        return TextStyleConstants.textStyleTextXSmall;
      case SizeType.xLarge:
        return TextStyleConstants.textStyleTextXlarge;
      case SizeType.small:
        return TextStyleConstants.textStyleTextSmall;
      case SizeType.smallBold:
        return TextStyleConstants.textStyleTextSmallBold;
      case SizeType.smallUnderline:
        return TextStyleConstants.textStyleTextSmallUnderline;
      case SizeType.large:
        return TextStyleConstants.textStyleTextLarge;
      case SizeType.largeBold:
        return TextStyleConstants.textStyleTextLargeBold;
      case SizeType.dfltBold:
        return TextStyleConstants.textStyleTextDefaultBold;
      case SizeType.dfltLight:
        return TextStyleConstants.textStyleTextDefaultLight;
      case SizeType.size13Regular:
        return TextStyleConstants.textStyleTextSize13Regular;
      case SizeType.size13Bold:
        return TextStyleConstants.textStyleTextSize13Bold;
      default:
        return TextStyleConstants.textStyleTextDefault;
    }
  }
}

class TextWidget extends StatelessWidget implements _Typography {
  final Color? color;
  final String text;
  final TextOverflow? overflow;
  final TextWidgetSizeType sizeType;
  final TextAlign? textAlign;
  const TextWidget(
    this.text, {
    Key? key,
    this.color = ConstColors.gray40,
    this.overflow,
    this.sizeType = TextWidgetSizeType.size80,
    this.textAlign,
  }) : super(key: key);

  const TextWidget.size80(
    String textString, {
    Key? key,
    this.color,
    this.overflow,
    this.textAlign,
  })  : text = textString,
        sizeType = TextWidgetSizeType.size80,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getTextStyle().copyWith(color: color),
      overflow: overflow,
      textAlign: textAlign,
    );
  }

  @override
  TextStyle getTextStyle() {
    switch (sizeType) {
      case TextWidgetSizeType.size80:
        return TextStyleConstants.textStyleTextWidgetSize80;
      default:
        return TextStyleConstants.textStyleTextWidgetSize80;
    }
  }
}
