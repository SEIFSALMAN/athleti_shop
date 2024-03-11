
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';


class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height ,
    this.radius = TSizes.cardRadiusLg,
    this.border,
    this.backgroundColor = TColors.light,
    this.borderColor = TColors.borderPrimary,
    this.padding,
    this.margin,
    this.showBorder = false, this.child,
  });

  final double? width, height;
  final double radius;
  final BoxBorder? border;
  final Color backgroundColor;
  final Color borderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          border: showBorder ? Border.all(color: borderColor) : null,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius)),
     child: child,
    );
  }
}