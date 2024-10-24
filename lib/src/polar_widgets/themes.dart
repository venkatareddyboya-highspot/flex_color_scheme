import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final List<AppColors> themes = [
  AppColors(
    primary: const Color(0xFF006DC7),
    primaryVariant: const Color(0xFF0075D4),
    secondary: const Color(0xFFE10000),
    secondaryVariant: const Color(0xFFEE0000),
  ),
  AppColors(
    primary: Colors.teal,
    primaryVariant: Colors.tealAccent,
    secondary: Colors.amber,
    secondaryVariant: Colors.amberAccent,
  ),
];

ThemeData addThemeExtenstions(ThemeData themeData, AppColors? colors) {
  final appColors = colors ?? themes.first;

  return themeData.copyWith(extensions: [
    AppColorsExtension(
      primary: appColors.primary,
      primaryVariant: appColors.primaryVariant,
      secondary: appColors.secondary,
      secondaryVariant: appColors.secondaryVariant,
    )
  ]);
}

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.primary,
    required this.primaryVariant,
    required this.secondary,
    required this.secondaryVariant,
  });

  final Color primary;
  final Color primaryVariant;
  final Color secondary;
  final Color secondaryVariant;

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? primary,
    Color? primaryVariant,
    Color? secondary,
    Color? secondaryVariant,
  }) {
    return AppColorsExtension(
      primary: primary ?? this.primary,
      primaryVariant: primaryVariant ?? this.primaryVariant,
      secondary: primary ?? this.secondary,
      secondaryVariant: primary ?? this.secondaryVariant,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryVariant: Color.lerp(primaryVariant, other.primaryVariant, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryVariant:
          Color.lerp(secondaryVariant, other.secondaryVariant, t)!,
    );
  }
}

extension ThemeDataX on ThemeData {
  AppColorsExtension get appColors => extension<AppColorsExtension>()!;
}

extension BuildContextX on BuildContext {
  ThemeData get themeX => Theme.of(this);
}

class AppColors extends Equatable {
  final Color primary;
  final Color primaryVariant;
  final Color secondary;
  final Color secondaryVariant;

  AppColors({
    required this.primary,
    required this.primaryVariant,
    required this.secondary,
    required this.secondaryVariant,
  });

  @override
  List<Object?> get props => [
        primary,
        primaryVariant,
        secondary,
        secondaryVariant,
      ];
}
