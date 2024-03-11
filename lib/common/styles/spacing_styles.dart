
import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeightAndNoBottom = EdgeInsets.only(
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
    top: TSizes.appBarHeight,
  );
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    bottom: TSizes.defaultSpace,
    left: TSizes.defaultSpace,
    right: TSizes.defaultSpace,
    top: TSizes.appBarHeight,
  );
}