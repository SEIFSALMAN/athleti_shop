import 'package:athleti_shop/common/widgets/texts/brand_title_text.dart';
import 'package:athleti_shop/utils/constants/enums.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class TBrandTitleWithVerifiedIcon extends StatelessWidget {
  const TBrandTitleWithVerifiedIcon({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(child: TBrandTitleText(title: title,color: textColor,maxLines: maxLines,textAlign: textAlign,brandTextSize: brandTextSize,)),
        SizedBox(width: TSizes.xs,),
        Icon(Icons.verified,color: iconColor,size: TSizes.iconXs,)
      ],
    );
  }
}
