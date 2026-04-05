import 'package:flutter/material.dart';

extension TextThemeExtension on BuildContext {
  TextTheme get textTheme => TextTheme.of(this);

  TextStyle? get bodyMedium => textTheme.bodyLarge;
  TextStyle? get titleLarge => textTheme.titleLarge;
  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get titleMedium => textTheme.titleMedium;
}
