import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme/src/flex_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //****************************************************************************
  // FlexSubTheme unit tests.
  //
  // Tests that the static sub theme methods create intended defined sub
  // ThemeData when matching ons, matching with FlexSubTheme defaults.
  //****************************************************************************
  group('WITH: FlexSubTheme.bottomSheetTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes BottomSheet tests
    // -------------------------------------------------------------------------
    test(
        'BottomSheet FST1.01:  GIVEN a default FlexSubTheme.bottomSheetTheme() '
        'EXPECT equal to BottomSheetThemeData() version with same values', () {
      expect(
        FlexSubThemes.bottomSheetTheme(),
        equals(
          const BottomSheetThemeData(
            clipBehavior: Clip.antiAlias,
            elevation: 1,
            modalElevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(28),
                topRight: Radius.circular(28),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'BottomSheet FST1.01custom: GIVEN a custom '
        'FlexSubTheme.bottomSheetTheme() '
        'EXPECT equal to BottomSheetThemeData() version with same values', () {
      expect(
        FlexSubThemes.bottomSheetTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 2,
          modalElevation: 4,
          radius: 5,
        ),
        equals(
          const BottomSheetThemeData(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            modalElevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.bottomNavigationBar ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes BottomNavigationBar tests
    // -------------------------------------------------------------------------
    test(
        'BottomNavigationBar FST1.02 flutter-default-light: GIVEN a LIGHT '
        'default '
        'FlexSubTheme.bottomNavigationBar() with FlutterDefault '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.bottomNavigationBar(
          colorScheme: colorScheme,
          useFlutterDefaults: true,
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 0,
          ),
        ),
      );
    });
    test(
        'BottomNavigationBar FST1.02-flutter-default-dark: GIVEN a DARK '
        'default '
        'FlexSubTheme.bottomNavigationBar() with FlutterDefault '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.bottomNavigationBar(
          colorScheme: colorScheme,
          useFlutterDefaults: true,
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 0,
          ),
        ),
      );
    });
    test(
        'BottomNavigationBar FST1.02-fcs-default-light: GIVEN a default LIGHT '
        'FlexSubTheme.bottomNavigationBar() with FCS default '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.bottomNavigationBar(
          colorScheme: colorScheme,
          // useFlutterDefaults: false, <<- Expect this to be default too
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 0,
            backgroundColor: Colors.white,
            selectedIconTheme: IconThemeData(
                color: Color(0xff6200ee), opacity: 1.0, size: 24.0),
            unselectedIconTheme: IconThemeData(
                color: Color(0xa5000000), opacity: 1.0, size: 24.0),
            selectedItemColor: Color(0xff6200ee),
            unselectedItemColor: Color(0xa5000000),
            selectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xff6200ee), fontSize: 14.0),
            unselectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xa5000000), fontSize: 12.0),
          ),
        ),
      );
    });
    test(
        'BottomNavigationBar FST1.02-fcs-default-dark: GIVEN a default DARK '
        'FlexSubTheme.bottomNavigationBar() with FCS default '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.bottomNavigationBar(
          colorScheme: colorScheme,
          elevation: 3,
          // useFlutterDefaults: false, <<- Expect this to be default too
        ),
        equals(
          const BottomNavigationBarThemeData(
            elevation: 3,
            backgroundColor: Color(0xff121212),
            selectedIconTheme: IconThemeData(
                color: Color(0xffbb86fc), opacity: 1.0, size: 24.0),
            unselectedIconTheme: IconThemeData(
                color: Color(0xa5ffffff), opacity: 1.0, size: 24.0),
            selectedItemColor: Color(0xffbb86fc),
            unselectedItemColor: Color(0xa5ffffff),
            selectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xffbb86fc), fontSize: 14.0),
            unselectedLabelStyle: TextStyle(
                inherit: true, color: Color(0xa5ffffff), fontSize: 12.0),
          ),
        ),
      );
    });
    test(
        'BottomNavigationBar FST1.02custom: GIVEN a custom '
        'FlexSubTheme.bottomNavigationBar() '
        'EXPECT equal to BottomNavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.bottomNavigationBar(
          colorScheme: colorScheme,
          selectedLabelSchemeColor: SchemeColor.secondary,
          selectedIconSchemeColor: SchemeColor.secondaryContainer,
          unselectedLabelSchemeColor: SchemeColor.onSurface,
          unselectedIconSchemeColor: SchemeColor.tertiary,
          backgroundSchemeColor: SchemeColor.surface,
          mutedUnselectedIcon: true,
          mutedUnselectedLabel: true,
          elevation: 1,
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          opacity: 0.5,
          unselectedAlphaBlend: 0xFA,
          unselectedAlpha: 0x45,
          selectedIconSize: 31,
          unselectedIconSize: 27,
        ),
        equals(
          BottomNavigationBarThemeData(
            elevation: 1,
            backgroundColor: colorScheme.surface.withOpacity(0.5),
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            selectedItemColor: colorScheme.secondary,
            selectedIconTheme: IconThemeData(
              color: colorScheme.secondaryContainer,
              size: 31,
              opacity: 1,
            ),
            selectedLabelStyle: TextStyle(
              color: colorScheme.secondary,
              fontSize: 14,
            ),
            unselectedLabelStyle: TextStyle(
              color: colorScheme.onSurface
                  .blendAlpha(colorScheme.onSurface, 0xFA)
                  .withAlpha(0x45),
              fontSize: 12,
            ),
            unselectedItemColor: colorScheme.onSurface
                .blendAlpha(colorScheme.onSurface, 0xFA)
                .withAlpha(0x45),
            unselectedIconTheme: IconThemeData(
              color: colorScheme.tertiary
                  .blendAlpha(colorScheme.tertiary, 0xFA)
                  .withAlpha(0x45),
              size: 27,
              opacity: 1,
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.filledButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes FilledButton tests
    // -------------------------------------------------------------------------
    test(
        'FilledButton FST1.11-M2: GIVEN a default M2 '
        'FlexSubTheme.filledButtonTheme() '
        'EXPECT equal to FilledButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.filledButtonTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          FilledButtonThemeData(
            style: ButtonStyle(
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(40, 40)),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ), // buttonShape,
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FilledButton FST1.11-M2-base: GIVEN a custom '
        'FlexSubTheme.filledButtonTheme() '
        'EXPECT equal to FilledButtonThemeData() version with same color', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.filledButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.secondary,
        ).toString(),
        equalsIgnoringHashCodes(
          FilledButtonThemeData(
            style: ButtonStyle(
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(40, 40)),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ), // buttonShape,
              backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.onSurface.withOpacity(0.38);
                  }
                  return colorScheme.secondary;
                },
              ),
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.onSurface.withOpacity(0.38);
                  }
                  return colorScheme.onSecondary;
                },
              ),
              // No custom Overlay unless tinted version is used!
              // Temp design due to:
              // https://github.com/flutter/flutter/issues/118063
              // overlayColor: MaterialStateProperty.resolveWith<Color?>(
              //   (Set<MaterialState> states) {
              //     if (states.contains(MaterialState.hovered)) {
              //       return colorScheme.onSecondary.withOpacity(0.08);
              //     }
              //     if (states.contains(MaterialState.focused)) {
              //       return colorScheme.onSecondary.withOpacity(0.12);
              //     }
              //     if (states.contains(MaterialState.pressed)) {
              //       return colorScheme.onSecondary.withOpacity(0.12);
              //     }
              //     return null;
              //   },
              // ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'FilledButton FST1.11-M3: GIVEN a default M3 '
        'FlexSubTheme.filledButtonTheme() '
        'EXPECT equal to FilledButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.filledButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const FilledButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'FilledButton FST1.11-M2-states: Does FilledButton '
        'have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.primary,
        useTintedInteraction: true,
      );
      // Disabled colors
      expect(
        button.style!.backgroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      // Default state
      expect(
        button.style!.backgroundColor!.resolve(<MaterialState>{}),
        equals(colorScheme.primary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<MaterialState>{}),
        equals(colorScheme.onPrimary),
      );
      // No custom Overlay unless tinted version is used!
      // Temp design due to: https://github.com/flutter/flutter/issues/118063
      // // Overlay color states
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<MaterialState>{MaterialState.hovered}),
      //   equals(colorScheme.onPrimary.withOpacity(0.08)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<MaterialState>{MaterialState.focused}),
      //   equals(colorScheme.onPrimary.withOpacity(0.12)),
      // );
      // expect(
      //   button.style?.overlayColor!
      //       .resolve(<MaterialState>{MaterialState.pressed}),
      //   equals(colorScheme.onPrimary.withOpacity(0.12)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<MaterialState>{MaterialState.selected}),
      //   equals(null),
      // );
    });
    test(
        'FilledButton FST1.11-M2-tint-states: Does M2 '
        'FilledButton have right tinted material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.tertiary,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.onTertiary;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground/background,
      expect(
        button.style!.backgroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
            .withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      // Default state colors
      expect(
        button.style!.backgroundColor!.resolve(<MaterialState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<MaterialState>{}),
        equals(colorScheme.onTertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
    });
    test(
        'FilledButton FST1.11-M3-states: Does '
        'FilledButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.primary,
        radius: 15,
        useMaterial3: true,
      );
      // Disabled colors
      expect(
        button.style!.backgroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      // Default state
      expect(
        button.style!.backgroundColor!.resolve(<MaterialState>{}),
        equals(colorScheme.primary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<MaterialState>{}),
        equals(colorScheme.onPrimary),
      );
      // No custom Overlay unless tinted version is used!
      // Temp design due to: https://github.com/flutter/flutter/issues/118063
      // // Overlay color states
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<MaterialState>{MaterialState.hovered}),
      //   equals(colorScheme.onPrimary.withOpacity(0.08)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<MaterialState>{MaterialState.focused}),
      //   equals(colorScheme.onPrimary.withOpacity(0.12)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<MaterialState>{MaterialState.pressed}),
      //   equals(colorScheme.onPrimary.withOpacity(0.12)),
      // );
      // expect(
      //   button.style!.overlayColor!
      //       .resolve(<MaterialState>{MaterialState.selected}),
      //   equals(null),
      // );
      // Custom shape test
      expect(
        button.style!.shape!.resolve(<MaterialState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      );
    });
    test(
        'FilledButton FST1.11-M3-custom-tint-states: Does '
        'FilledButton have right material tinted states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.onTertiary;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground/background,
      expect(
        button.style!.backgroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
            .withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      // Default state colors
      expect(
        button.style!.backgroundColor!.resolve(<MaterialState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<MaterialState>{}),
        equals(colorScheme.onTertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 5.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<MaterialState>{}),
          equals(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ));
    });
    test(
        'FilledButton FST1.11-M3-custom-tint-states: Does '
        'FilledButton have right material tinted states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final FilledButtonThemeData button = FlexSubThemes.filledButtonTheme(
        colorScheme: colorScheme,
        backgroundSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.onTertiary;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground/background,
      expect(
        button.style!.backgroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)
            .withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      // Default state colors
      expect(
        button.style!.backgroundColor!.resolve(<MaterialState>{}),
        equals(colorScheme.tertiary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<MaterialState>{}),
        equals(colorScheme.onTertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<MaterialState>{}),
          equals(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ));
    });
  });
  group('WITH: FlexSubTheme.snackBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes SnackBar tests
    // -------------------------------------------------------------------------
    test(
        'SnackBar FST1.03: GIVEN a default FlexSubTheme.snackBarTheme '
        'EXPECT equal to SnackBarThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.snackBarTheme().toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            elevation: 4,
            actionTextColor: Colors.grey[500],
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST1.03-background-based-a: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'colorScheme, but with backgroundSchemeColor and backgroundColor '
        'EXPECT equal to SnackBarThemeData with backgroundColor', () {
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 10,
          colorScheme: null,
          backgroundColor: const Color(0xFF343476),
          backgroundSchemeColor: SchemeColor.tertiary,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: const Color(0xFF343476),
            elevation: 10,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: Colors.white,
                ),
            actionTextColor: Colors.white.withAlpha(0xDD),
            disabledActionTextColor: Colors.white.withAlpha(0x11),
            closeIconColor: Colors.white.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST1.03-background-based-b: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'no colorScheme, no backgroundSchemeColor, but with backgroundColor '
        'EXPECT equal to SnackBarThemeData with backgroundColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 5,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFBBC2D5),
          backgroundSchemeColor: null,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: const Color(0xFFBBC2D5),
            elevation: 5,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                ),
            actionTextColor: colorScheme.inversePrimary,
            disabledActionTextColor: colorScheme.inversePrimary.withAlpha(0x11),
            closeIconColor: Colors.black.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST1.03a-scheme-based: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'colorScheme, backgroundSchemeColor and backgroundColor '
        'EXPECT equal to SnackBarThemeData with scheme color.', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 0,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFF763370),
          backgroundSchemeColor: SchemeColor.error,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: colorScheme.error,
            elevation: 0,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: colorScheme.onError,
                ),
            actionTextColor: colorScheme.inversePrimary,
            disabledActionTextColor: colorScheme.inversePrimary.withAlpha(0x11),
            closeIconColor: colorScheme.onError.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'SnackBar FST1.03b-scheme-based: GIVEN a '
        'FlexSubTheme.snackBarTheme with '
        'colorScheme, backgroundSchemeColor and backgroundColor and '
        'actionTextSchemeColor'
        'EXPECT equal to SnackBarThemeData with scheme colors.', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.snackBarTheme(
          elevation: 0,
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFF763370),
          backgroundSchemeColor: SchemeColor.error,
          actionTextSchemeColor: SchemeColor.tertiary,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          SnackBarThemeData(
            backgroundColor: colorScheme.error,
            elevation: 0,
            contentTextStyle: ThemeData().textTheme.titleMedium!.copyWith(
                  color: colorScheme.onError,
                ),
            actionTextColor: colorScheme.tertiary,
            disabledActionTextColor: colorScheme.tertiary.withAlpha(0x11),
            closeIconColor: colorScheme.onError.withAlpha(0xAA),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.cardTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Card tests
    // -------------------------------------------------------------------------
    test(
        'Card FST1.04: GIVEN a default FlexSubTheme.cardTheme() '
        'EXPECT equal to CardTheme() version with same values', () {
      expect(
        FlexSubThemes.cardTheme(),
        equals(
          const CardTheme(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'Card FST1.04custom: GIVEN a custom FlexSubTheme.cardTheme() '
        'EXPECT equal to CardTheme() version with same values', () {
      expect(
        FlexSubThemes.cardTheme(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          elevation: 2,
          radius: 1,
        ),
        equals(
          const CardTheme(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(1),
              ),
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.dialogTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Dialog tests
    // -------------------------------------------------------------------------
    test(
        'Dialog FST1.05: GIVEN a default FlexSubTheme.dialogTheme() '
        'EXPECT equal to DialogTheme() version with same values', () {
      expect(
        FlexSubThemes.dialogTheme(),
        equals(
          const DialogTheme(
            elevation: 6,
            actionsPadding:
                EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'Dialog FST1.05-background-based-a: GIVEN a FlexSubTheme.dialogTheme '
        'with no '
        'colorScheme, but with backgroundSchemeColor and backgroundColor '
        'EXPECT equal to DialogTheme with backgroundColor', () {
      expect(
        FlexSubThemes.dialogTheme(
            colorScheme: null,
            backgroundColor: const Color(0xFF343476),
            backgroundSchemeColor: SchemeColor.tertiary),
        equals(
          const DialogTheme(
            backgroundColor: Color(0xFF343476),
            elevation: 6,
            actionsPadding:
                EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'Dialog FST1.05-background-based-b: GIVEN a FlexSubTheme.dialogTheme '
        'with no backgroundSchemeColor and backgroundColor '
        'EXPECT equal to DialogTheme with backgroundColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.dialogTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          backgroundSchemeColor: null,
        ),
        equals(
          const DialogTheme(
            backgroundColor: Color(0xFFDDDDDD),
            elevation: 6,
            actionsPadding:
                EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'Dialog FST1.05-scheme-based: GIVEN a FlexSubTheme.dialogTheme '
        'with backgroundSchemeColor and no backgroundColor '
        'EXPECT equal to DialogTheme with backgroundSchemeColor', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.dialogTheme(
          colorScheme: colorScheme,
          backgroundColor: null,
          backgroundSchemeColor: SchemeColor.tertiary,
        ),
        equals(
          DialogTheme(
            backgroundColor: colorScheme.tertiary,
            actionsPadding:
                const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
            elevation: 6,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
          ),
        ),
      );
    });
    test(
        'Dialog FST1.05custom: GIVEN a custom FlexSubTheme.dialogTheme() '
        'EXPECT equal to DialogTheme() version with same values', () {
      expect(
        FlexSubThemes.dialogTheme(
          elevation: 10,
          radius: 6,
          actionsPadding:
              const EdgeInsets.only(left: 12.0, right: 6.0, bottom: 20.0),
        ),
        equals(
          const DialogTheme(
            elevation: 10,
            actionsPadding:
                EdgeInsets.only(left: 12.0, right: 6.0, bottom: 20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.popupMenuTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes PopupMenu tests
    // -------------------------------------------------------------------------
    test(
        'PopupMenu FST1.06: GIVEN a default FlexSubTheme.popupMenuTheme() '
        'EXPECT equal to PopupMenuThemeData() version with same values', () {
      expect(
        FlexSubThemes.popupMenuTheme(),
        equals(const PopupMenuThemeData()),
      );
    });
    test(
        'PopupMenu FST1.06custom: GIVEN a custom FlexSubTheme.popupMenuTheme() '
        'EXPECT equal to PopupMenuThemeData() version with same values', () {
      expect(
        FlexSubThemes.popupMenuTheme(
          elevation: 8,
          radius: 8,
        ),
        equals(
          const PopupMenuThemeData(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.timePickerTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes TimePicker tests
    // -------------------------------------------------------------------------
    test(
        'TimePicker FST1.07-default: GIVEN a default '
        'FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF345234),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.timePickerTheme(colorScheme: colorScheme),
        equals(
          TimePickerThemeData(
            // TODO(rydmike): Elevation does not exist in beta 3.7.0-1.4.pre.
            // elevation: 6,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme().copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
          ),
        ),
      );
    });

    test(
        'TimePicker FST1.07.scheme-based: GIVEN a default '
        'FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.timePickerTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          backgroundSchemeColor: SchemeColor.tertiary,
          inputDecorationTheme: const InputDecorationTheme(),
        ),
        equals(
          TimePickerThemeData(
            // TODO(rydmike): Elevation does not exist in beta 3.7.0-1.4.pre.
            // elevation: 6,
            backgroundColor: colorScheme.tertiary,
            // dialBackgroundColor: colorScheme.surfaceVariant,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            inputDecorationTheme: const InputDecorationTheme().copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
          ),
        ),
      );
    });

    test(
        'TimePicker FST1.07.background-a: GIVEN a default '
        'FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.timePickerTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          inputDecorationTheme: const InputDecorationTheme(filled: true),
        ),
        equals(
          TimePickerThemeData(
            // TODO(rydmike): Elevation does not exist in beta 3.7.0-1.4.pre.
            // elevation: 6,
            backgroundColor: const Color(0xFFDDDDDD),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            inputDecorationTheme:
                const InputDecorationTheme(filled: true).copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
          ),
        ),
      );
    });

    test(
        'TimePicker FST1.07.background-b: GIVEN a custom '
        'FlexSubTheme.timePickerTheme() '
        'EXPECT equal to TimePickerThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF345234),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.timePickerTheme(
          colorScheme: colorScheme,
          backgroundColor: const Color(0xFFDDDDDD),
          backgroundSchemeColor: SchemeColor.tertiary,
          inputDecorationTheme: const InputDecorationTheme(filled: true),
          elementRadius: 12,
        ),
        equals(
          TimePickerThemeData(
            // TODO(rydmike): Elevation does not exist in beta 3.7.0-1.4.pre.
            // elevation: 6,
            backgroundColor: colorScheme.tertiary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
            hourMinuteShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            dayPeriodShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            inputDecorationTheme:
                const InputDecorationTheme(filled: true).copyWith(
              contentPadding: EdgeInsets.zero,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.inputDecorationTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes InputDecorator tests
    // -------------------------------------------------------------------------
    test(
        'InputDecoration FST1.08a.light: GIVEN a default '
        'FlexSubTheme.inputDecorationTheme() '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.inputDecorationTheme(colorScheme: colorScheme)
            .toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationTheme(
            labelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                if (states.contains(MaterialState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(MaterialState.hovered)) {
                  return TextStyle(color: colorScheme.onErrorContainer);
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(MaterialState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                if (states.contains(MaterialState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(MaterialState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                  );
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(MaterialState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                    color: colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                        .withAlpha(kDisabledBackgroundAlpha));
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            iconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            prefixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            suffixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                return colorScheme.error;
              }
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            filled: true,
            fillColor: colorScheme.primary.withAlpha(0x0D),
            hoverColor: colorScheme.primary.withAlpha(0x0D),
            focusColor: colorScheme.primary.withAlpha(0x26),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary.withAlpha(0xA7),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0xCC)
                    .withAlpha(0x26),
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error.withAlpha(0xA7),
                width: 1,
              ),
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST1.08b.light: GIVEN a '
        'FlexSubTheme.inputDecorationTheme( '
        'unfocusedBorderIsColored: false) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.inputDecorationTheme(
                colorScheme: colorScheme, unfocusedBorderIsColored: false)
            .toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationTheme(
            labelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                if (states.contains(MaterialState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(MaterialState.hovered)) {
                  return TextStyle(color: colorScheme.onErrorContainer);
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(MaterialState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                if (states.contains(MaterialState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(MaterialState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                  );
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(MaterialState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                    color: colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                        .withAlpha(kDisabledBackgroundAlpha));
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            iconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            prefixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            suffixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                return colorScheme.error;
              }
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary;
              }
              return Colors.black45;
            }),
            filled: true,
            fillColor: colorScheme.primary.withAlpha(0x0D),
            hoverColor: colorScheme.primary.withAlpha(0x0D),
            focusColor: colorScheme.primary.withAlpha(0x26),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.onSurface.withOpacity(0.38),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0xCC)
                    .withAlpha(0x26),
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error.withAlpha(0xA7),
                width: 1,
              ),
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST1.08a.dark: GIVEN a default '
        'FlexSubTheme.inputDecorationTheme() '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.inputDecorationTheme(colorScheme: colorScheme)
            .toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationTheme(
            labelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                if (states.contains(MaterialState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(MaterialState.hovered)) {
                  return TextStyle(color: colorScheme.onErrorContainer);
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(MaterialState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return const TextStyle(color: Colors.white60);
            }),
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                if (states.contains(MaterialState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(MaterialState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                  );
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.primary);
              }
              if (states.contains(MaterialState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return const TextStyle(color: Colors.white60);
            }),
            helperStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return const TextStyle(color: Colors.white60);
            }),
            hintStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                    color: colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                        .withAlpha(kDisabledBackgroundAlpha));
              }
              return const TextStyle(color: Colors.white60);
            }),
            iconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary;
              }
              return Colors.white70;
            }),
            prefixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary;
              }
              return Colors.white70;
            }),
            suffixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                return colorScheme.error;
              }
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.primary;
              }
              return Colors.white70;
            }),
            filled: true,
            fillColor: colorScheme.primary.withAlpha(0x14),
            hoverColor: colorScheme.primary.withAlpha(0x0D),
            focusColor: colorScheme.primary.withAlpha(0x26),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary.withAlpha(0xA7),
                width: 1,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0xCC)
                    .withAlpha(0x26),
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: colorScheme.error.withAlpha(0xA7),
                width: 1,
              ),
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST1.08b.dark: GIVEN a default '
        'FlexSubTheme.inputDecorationTheme( '
        'unfocusedBorderIsColored: false) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.inputDecorationTheme(
                colorScheme: colorScheme, unfocusedBorderIsColored: false)
            .toString(minLevel: DiagnosticLevel.fine),
        InputDecorationTheme(
          labelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.error)) {
              if (states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.hovered)) {
                return TextStyle(color: colorScheme.onErrorContainer);
              }
              return TextStyle(color: colorScheme.error);
            }
            if (states.contains(MaterialState.focused)) {
              return TextStyle(color: colorScheme.primary);
            }
            if (states.contains(MaterialState.hovered)) {
              return TextStyle(color: colorScheme.onSurfaceVariant);
            }
            if (states.contains(MaterialState.disabled)) {
              return TextStyle(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha),
              );
            }
            return const TextStyle(color: Colors.white60);
          }),
          floatingLabelStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.error)) {
              if (states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.hovered)) {
                return TextStyle(
                  color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                );
              }
              return TextStyle(color: colorScheme.error);
            }
            if (states.contains(MaterialState.focused)) {
              return TextStyle(color: colorScheme.primary);
            }
            if (states.contains(MaterialState.hovered)) {
              return TextStyle(color: colorScheme.onSurfaceVariant);
            }
            if (states.contains(MaterialState.disabled)) {
              return TextStyle(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha),
              );
            }
            return const TextStyle(color: Colors.white60);
          }),
          helperStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return TextStyle(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha),
              );
            }
            return const TextStyle(color: Colors.white60);
          }),
          hintStyle:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return TextStyle(
                  color: colorScheme.primary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha));
            }
            return const TextStyle(color: Colors.white60);
          }),
          iconColor:
              MaterialStateColor.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return colorScheme.primary
                  .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                  .withAlpha(kDisabledBackgroundAlpha);
            }
            if (states.contains(MaterialState.focused)) {
              return colorScheme.primary;
            }
            return Colors.white70;
          }),
          prefixIconColor:
              MaterialStateColor.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return colorScheme.primary
                  .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                  .withAlpha(kDisabledBackgroundAlpha);
            }
            if (states.contains(MaterialState.focused)) {
              return colorScheme.primary;
            }
            return Colors.white70;
          }),
          suffixIconColor:
              MaterialStateColor.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.error)) {
              return colorScheme.error;
            }
            if (states.contains(MaterialState.disabled)) {
              return colorScheme.primary
                  .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                  .withAlpha(kDisabledBackgroundAlpha);
            }
            if (states.contains(MaterialState.focused)) {
              return colorScheme.primary;
            }
            return Colors.white70;
          }),
          filled: true,
          fillColor: colorScheme.primary.withAlpha(0x14),
          hoverColor: colorScheme.primary.withAlpha(0x0D),
          focusColor: colorScheme.primary.withAlpha(0x26),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: colorScheme.primary,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: colorScheme.onSurface.withOpacity(0.38),
              width: 1,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: colorScheme.primary
                  .blendAlpha(colorScheme.onSurface, 0xCC)
                  .withAlpha(0x26),
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: colorScheme.error,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: colorScheme.error.withAlpha(0xA7),
              width: 1,
            ),
          ),
        ).toString(minLevel: DiagnosticLevel.fine),
      );
    });
    test(
        'InputDecoration FST1.08a-states: Does Decorator '
        'have right material states', () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Floating label focused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.error,
            MaterialState.focused,
          }),
          equals(
            TextStyle(color: colorScheme.error),
          ));
      // Floating label error hovered style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.error,
            MaterialState.hovered,
          }),
          equals(
            TextStyle(color: colorScheme.error.withAlpha(0xA7)),
          ));
      // Floating label unfocused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.error,
          }),
          equals(
            TextStyle(color: colorScheme.error),
          ));
      // Floating label disabled style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.disabled,
          }),
          equals(
            TextStyle(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0xCC)
                    .withAlpha(0x26)),
          ));
      // Floating label default style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{}),
          equals(
            TextStyle(color: Colors.black.withAlpha(0x99)),
          ));
    });
    test(
        'InputDecoration FST1.08b-light: GIVEN a default '
        'FlexSubTheme.inputDecorationTheme(borderType: '
        'FlexInputBorderType.underline, usedSchemeColor: '
        'FlexUsedColor.secondary) '
        'EXPECT equal to InputDecorationTheme() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.inputDecorationTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          borderType: FlexInputBorderType.underline,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          InputDecorationTheme(
            labelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                if (states.contains(MaterialState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(MaterialState.hovered)) {
                  return TextStyle(color: colorScheme.onErrorContainer);
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.secondary);
              }
              if (states.contains(MaterialState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.secondary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            floatingLabelStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                if (states.contains(MaterialState.focused)) {
                  return TextStyle(color: colorScheme.error);
                }
                if (states.contains(MaterialState.hovered)) {
                  return TextStyle(
                    color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
                  );
                }
                return TextStyle(color: colorScheme.error);
              }
              if (states.contains(MaterialState.focused)) {
                return TextStyle(color: colorScheme.secondary);
              }
              if (states.contains(MaterialState.hovered)) {
                return TextStyle(color: colorScheme.onSurfaceVariant);
              }
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.secondary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            helperStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                  color: colorScheme.secondary
                      .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                      .withAlpha(kDisabledBackgroundAlpha),
                );
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            hintStyle:
                MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return TextStyle(
                    color: colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                        .withAlpha(kDisabledBackgroundAlpha));
              }
              return TextStyle(color: Colors.black.withAlpha(0xCC));
            }),
            iconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.secondary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.secondary;
              }
              return Colors.black45;
            }),
            prefixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.secondary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.secondary;
              }
              return Colors.black45;
            }),
            suffixIconColor:
                MaterialStateColor.resolveWith((Set<MaterialState> states) {
              if (states.contains(MaterialState.error)) {
                return colorScheme.error;
              }
              if (states.contains(MaterialState.disabled)) {
                return colorScheme.secondary
                    .blendAlpha(colorScheme.onSurface, kDisabledAlphaBlend)
                    .withAlpha(kDisabledBackgroundAlpha);
              }
              if (states.contains(MaterialState.focused)) {
                return colorScheme.secondary;
              }
              return Colors.black45;
            }),
            filled: true,
            fillColor: colorScheme.secondary.withAlpha(0x0D),
            hoverColor: colorScheme.secondary.withAlpha(0x0D),
            focusColor: colorScheme.secondary.withAlpha(0x26),
            focusedBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.secondary,
                width: 2,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.secondary.withAlpha(0xA7),
                width: 1,
              ),
            ),
            disabledBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.secondary
                    .blendAlpha(colorScheme.onSurface, 0xCC)
                    .withAlpha(0x26),
                width: 1,
              ),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: 2,
              ),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              borderSide: BorderSide(
                color: colorScheme.error.withAlpha(0xA7),
                width: 1,
              ),
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'InputDecoration FST1.08b-states: Does Decorator '
        'have right material states', () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Floating label focused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.underline,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.error,
            MaterialState.focused,
          }),
          equals(
            TextStyle(color: colorScheme.error),
          ));
      // Floating label error hovered style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.underline,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.error,
            MaterialState.hovered,
          }),
          equals(
            TextStyle(color: colorScheme.error.withAlpha(0xA7)),
          ));
      // Floating label unfocused error style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.underline,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.error,
          }),
          equals(
            TextStyle(color: colorScheme.error),
          ));
      // Floating label disabled style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.underline,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{
            MaterialState.disabled,
          }),
          equals(
            TextStyle(
                color: colorScheme.primary
                    .blendAlpha(colorScheme.onSurface, 0xCC)
                    .withAlpha(0x26)),
          ));
      // Floating label default style
      expect(
          (FlexSubThemes.inputDecorationTheme(
            colorScheme: colorScheme,
            borderType: FlexInputBorderType.underline,
          ).floatingLabelStyle as MaterialStateTextStyle?)!
              .resolve(<MaterialState>{}),
          equals(
            TextStyle(color: Colors.black.withAlpha(0x99)),
          ));
    });
  });
  group('WITH: FlexSubTheme.elevatedButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes ElevatedButton tests
    // -------------------------------------------------------------------------
    test(
        'ElevatedButton FST1.09-M2: GIVEN a default M2 '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ), //buttonShape,
              elevation: 1,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onPrimary;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26);
                  }
                  return colorScheme.primary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.onPrimary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.onPrimary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onPrimary.withAlpha(0x33);
                  }
                  return Colors.transparent;
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton FST1.09-M3: GIVEN a default M3 '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'defaults', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const ElevatedButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'ElevatedButton FST1.09-secondary: GIVEN a default '
        'FlexSubTheme.elevatedButtonTheme() '
        'with secondary color as base color '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ), //buttonShape,
              elevation: 1,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onSecondary;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26);
                  }
                  return colorScheme.secondary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.onPrimary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.onPrimary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onPrimary.withAlpha(0x33);
                  }
                  return Colors.transparent;
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton FST1.09-secondary-onBase: GIVEN a default '
        'FlexSubTheme.elevatedButtonTheme() '
        'with secondary color as onBase color '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          onBaseSchemeColor: SchemeColor.secondary,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ), //buttonShape,
              elevation: 1,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.secondary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onSecondary;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26);
                  }
                  return colorScheme.primary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.onSecondary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.onSecondary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onSecondary.withAlpha(0x33);
                  }
                  return Colors.transparent;
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton FST1.09-M2-states: Does '
        'ElevatedButton have right Material 2 states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF42AEE7),
        brightness: Brightness.light,
      );
      // Disabled foreground, default, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaDisabled)),
      );
      // Disabled foreground, custom, M2, with tint
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useTintedDisable: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.secondary)),
      );
      // Selected foreground, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.onPrimary),
      );
      // Selected foreground, custom color, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
                colorScheme: colorScheme,
                baseSchemeColor: SchemeColor.secondary)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.onSecondary),
      );
      // Selected foreground, custom colors, M2
      expect(
        FlexSubThemes.elevatedButtonTheme(
                colorScheme: colorScheme,
                baseSchemeColor: SchemeColor.secondary,
                onBaseSchemeColor: SchemeColor.tertiary)
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.tertiary),
      );
      // Disabled background, M2, default
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .backgroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useTintedDisable: true,
        )
            .style!
            .backgroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(
                colorScheme.onSurface, colorScheme.secondary)
            .withAlpha(kAlphaVeryLowDisabled)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .backgroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.onPrimary.withAlpha(kHoverBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.onPrimary.withAlpha(kFocusBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.onPrimary.withAlpha(kPressedBackgroundAlpha)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(colorScheme: colorScheme)
            .style!
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(Colors.transparent),
      );
    });
    test(
        'ElevatedButton FST1.09-M3-states: Does '
        'ElevatedButton have right Material 3 states', () {
      const ColorScheme colorScheme = ColorScheme.light();
      // Disabled foreground, default, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      // Disabled foreground, custom, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      // Selected foreground, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Selected foreground, custom color, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.secondary),
      );
      // Selected foreground, custom colors, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          onBaseSchemeColor: SchemeColor.tertiary,
          useMaterial3: true,
        )
            .style!
            .foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.secondary),
      );
      // Disabled background, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        )
            .style!
            .backgroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      // Selected background, M3
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        )
            .style!
            .backgroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.surface),
      );
      // Overlay color states
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Elevation states
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(0.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<MaterialState>{MaterialState.hovered}),
        equals(4.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<MaterialState>{MaterialState.focused}),
        equals(2.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(2.0),
      );
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
          elevation: 2,
          useMaterial3: true,
        ).style!.elevation!.resolve(<MaterialState>{MaterialState.selected}),
        equals(2.0),
      );
      // Custom shape test
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          radius: 10,
          useMaterial3: true,
        ).style!.shape!.resolve(<MaterialState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );
    });
    test(
        'ElevatedButton FST1.09custom-1: GIVEN a '
        'custom FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
                colorScheme: colorScheme,
                elevation: 1,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minButtonSize: const Size(50, 50),
                radius: 10)
            .toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(50, 50),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ), //buttonShape,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              elevation: 1,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.onPrimary;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.primary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26);
                  }
                  return colorScheme.primary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.onPrimary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.onPrimary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onPrimary.withAlpha(0x33);
                  }
                  return Colors.transparent;
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton FST1.09custom-2: GIVEN a custom '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
                colorScheme: colorScheme,
                baseSchemeColor: SchemeColor.tertiary,
                onBaseSchemeColor: SchemeColor.secondary,
                elevation: 1,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                minButtonSize: const Size(55, 55),
                radius: 12)
            .toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(55, 55),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ), //buttonShape,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              elevation: 1,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.tertiary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x5E);
                  }
                  return colorScheme.secondary;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.tertiary
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0x26);
                  }
                  return colorScheme.tertiary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.onTertiary.withAlpha(0x0D);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.onTertiary.withAlpha(0x26);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onTertiary.withAlpha(0x33);
                  }
                  return Colors.transparent;
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton FST1.09custom-1-M3: GIVEN a custom '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          minButtonSize: const Size(50, 50),
          radius: 10,
          useMaterial3: true,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ButtonStyle(
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(50, 50)),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 8)),
              elevation: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return 0.0;
                }
                if (states.contains(MaterialState.hovered)) {
                  return 4.0;
                }
                if (states.contains(MaterialState.focused)) {
                  return 2.0;
                }
                if (states.contains(MaterialState.pressed)) {
                  return 2.0;
                }
                return 2.0;
              }),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ), //buttonShape,
            ),
          ).toString(),
        ),
      );
    });
    test(
        'ElevatedButton FST1.09custom-2-M3: GIVEN a custom '
        'FlexSubTheme.elevatedButtonTheme() '
        'EXPECT equal to ElevatedButtonThemeData() version with '
        'same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.elevatedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          onBaseSchemeColor: SchemeColor.secondary,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 9),
          minButtonSize: const Size(55, 55),
          radius: 12,
          useMaterial3: true,
        ).toString(),
        equalsIgnoringHashCodes(
          ElevatedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorScheme.onSurface.withOpacity(0.38);
                }
                return colorScheme.tertiary;
              }),
              backgroundColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return colorScheme.secondary;
              }),
              overlayColor: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.tertiary.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.tertiary.withOpacity(0.12);
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.tertiary.withOpacity(0.12);
                }
                return null;
              }),
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(55, 55)),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 9)),
              elevation: MaterialStateProperty.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return 0.0;
                }
                if (states.contains(MaterialState.hovered)) {
                  return 4.0;
                }
                if (states.contains(MaterialState.focused)) {
                  return 2.0;
                }
                if (states.contains(MaterialState.pressed)) {
                  return 2.0;
                }
                return 2.0;
              }),
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                ),
              ), //buttonShape,
            ),
          ).toString(),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.outlinedButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes OutlinedButton tests
    // -------------------------------------------------------------------------
    test(
        'OutlinedButton FST1.10-M2: GIVEN a default M2 '
        'FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.outlinedButtonTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ), //buttonShape,
            ).copyWith(
              side: MaterialStateProperty.resolveWith<BorderSide?>(
                (final Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return BorderSide(
                      color: colorScheme.primary
                          .blendAlpha(colorScheme.onSurface, 0x66)
                          .withAlpha(0x26),
                      width: 1.5,
                    );
                  }
                  if (states.contains(MaterialState.error)) {
                    return BorderSide(
                      color: colorScheme.error,
                      width: 2,
                    );
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return BorderSide(
                      color: colorScheme.primary,
                      width: 2,
                    );
                  }
                  return BorderSide(
                    color: colorScheme.primary.withAlpha(0xA7),
                    width: 1.5,
                  );
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'OutlinedButton FST1.10-custom-M2: GIVEN a custom '
        'FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF42AEE7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primaryContainer,
          outlineSchemeColor: SchemeColor.secondaryContainer,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          minButtonSize: const Size(52, 40),
          radius: 13,
        ).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(52, 40),
              padding: const EdgeInsets.symmetric(horizontal: 17),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(13),
                ),
              ), //buttonShape,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.onSurface.withOpacity(0.38);
                  }
                  return colorScheme.primaryContainer;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primaryContainer.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primaryContainer.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.primaryContainer.withOpacity(0.12);
                  }
                  return Colors.transparent;
                },
              ),
              side: MaterialStateProperty.resolveWith<BorderSide?>(
                (final Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return BorderSide(
                      color: colorScheme.secondaryContainer
                          .blendAlpha(colorScheme.onSurface, 0x66)
                          .withAlpha(0x26),
                      width: 1.5,
                    );
                  }
                  if (states.contains(MaterialState.error)) {
                    return BorderSide(
                      color: colorScheme.error,
                      width: 2,
                    );
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return BorderSide(
                      color: colorScheme.secondaryContainer,
                      width: 2,
                    );
                  }
                  return BorderSide(
                    color: colorScheme.secondaryContainer.withAlpha(0xA7),
                    width: 1.5,
                  );
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'OutlinedButton FST1.10-M3: GIVEN a default '
        'FlexSubTheme.outlinedButtonTheme() EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const OutlinedButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'OutlinedButton FST1.10-outline-M2: GIVEN a custom '
        'FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          outlineSchemeColor: SchemeColor.tertiary,
        ).toString(),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ), //buttonShape,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return FlexSubThemes.tintedDisable(
                        colorScheme.onSurface, colorScheme.secondary);
                  }
                  return colorScheme.secondary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.secondary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.secondary.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.secondary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                },
              ),
              side: MaterialStateProperty.resolveWith<BorderSide?>(
                (final Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return BorderSide(
                      color: colorScheme.tertiary
                          .blendAlpha(colorScheme.onSurface, 0x66)
                          .withAlpha(0x26),
                      width: 1.5,
                    );
                  }
                  if (states.contains(MaterialState.error)) {
                    return BorderSide(
                      color: colorScheme.error,
                      width: 2,
                    );
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return BorderSide(
                      color: colorScheme.tertiary,
                      width: 2,
                    );
                  }
                  return BorderSide(
                    color: colorScheme.tertiary.withOpacity(0.12),
                    width: 1.5,
                  );
                },
              ),
            ),
          ).toString(),
        ),
      );
    });

    test(
        'OutlinedButton  FST1.10-outline-M3: GIVEN a custom '
        'FlexSubTheme.outlinedButtonTheme() '
        'EXPECT '
        'equal to OutlinedButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final MaterialStateProperty<Color?> foregroundColor =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorScheme.onSurface.withOpacity(0.38);
        }
        return colorScheme.secondary;
      });

      final MaterialStateProperty<Color?> overlayColor =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered)) {
          return colorScheme.secondary.withOpacity(0.08);
        }
        if (states.contains(MaterialState.focused)) {
          return colorScheme.secondary.withOpacity(0.12);
        }
        if (states.contains(MaterialState.pressed)) {
          return colorScheme.secondary.withOpacity(0.12);
        }
        return null;
      });

      final MaterialStateProperty<BorderSide?> side =
          MaterialStateProperty.resolveWith((Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(
            color: colorScheme.onSurface.withOpacity(0.12),
            width: 1,
          );
        }
        if (states.contains(MaterialState.error)) {
          return BorderSide(
            color: colorScheme.error,
            width: 1,
          );
        }
        if (states.contains(MaterialState.pressed)) {
          return BorderSide(
            color: colorScheme.tertiary,
            width: 1,
          );
        }
        return BorderSide(
          color: colorScheme.tertiary,
          width: 1,
        );
      });
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          outlineSchemeColor: SchemeColor.tertiary,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          minButtonSize: const Size(52, 40),
          radius: 13,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          OutlinedButtonThemeData(
            style: ButtonStyle(
              foregroundColor: foregroundColor,
              overlayColor: overlayColor,
              minimumSize:
                  ButtonStyleButton.allOrNull<Size>(const Size(52, 40)),
              padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 17)),
              side: side,
              shape: ButtonStyleButton.allOrNull<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(13),
                  ),
                ),
              ),
            ),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });

    test(
        'OutlinedButton FST1.10-states-M2: Does '
        'OutlinedButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        button.style!.foregroundColor!.resolve(<MaterialState>{}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.outlinedButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.primary,
        ).style!.overlayColor!.resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(BorderSide(
            color: colorScheme.onSurface.withOpacity(0.12), width: 1)),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 2,
        )),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(BorderSide(
          color: colorScheme.primary,
          width: 2,
        )),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.selected}),
        equals(BorderSide(
          color: colorScheme.primary,
          width: 1,
        )),
      );
    });
    test(
        'OutlinedButton FST1.10-states-custom-M2: Does '
        'OutlinedButton have right states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF42AEE7),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        outlineSchemeColor: SchemeColor.primaryContainer,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(
            colorScheme.onSurface, colorScheme.tertiary)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(BorderSide(
            color: FlexSubThemes.tintedDisable(
                    colorScheme.onSurface, colorScheme.primaryContainer)
                .withAlpha(kAlphaLowDisabled),
            width: 1)),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 2,
        )),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 2,
        )),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.selected}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 1,
        )),
      );
    });
    test(
        'OutlinedButton FST1.10-states-M3: Does '
        'OutlinedButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
        outlineWidth: 1.0,
        useMaterial3: true,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(BorderSide(
            color: colorScheme.onSurface.withOpacity(0.12), width: 1.0)),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 1.0,
        )),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(BorderSide(
          color: colorScheme.outline,
          width: 1.0,
        )),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.selected}),
        equals(BorderSide(
          color: colorScheme.outline,
          width: 1.0,
        )),
      );
    });
    test(
        'OutlinedButton FST1.10-states-M3-custom: Does '
        'OutlinedButton have right material '
        'custom states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final OutlinedButtonThemeData button = FlexSubThemes.outlinedButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        outlineSchemeColor: SchemeColor.primaryContainer,
        outlineWidth: 2,
        pressedOutlineWidth: 3,
        radius: 10,
        useMaterial3: true,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.tertiary.withOpacity(0.08)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.tertiary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.tertiary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Border side states
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(BorderSide(
          color: colorScheme.onSurface.withOpacity(0.12),
          width: 2.0,
        )),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.error}),
        equals(BorderSide(
          color: colorScheme.error,
          width: 3.0,
        )),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 3.0,
        )),
      );
      expect(
        button.style!.side!.resolve(<MaterialState>{MaterialState.selected}),
        equals(BorderSide(
          color: colorScheme.primaryContainer,
          width: 2.0,
        )),
      );
      // Custom shape test
      expect(
        button.style!.shape!.resolve(<MaterialState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.textButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes TextButton tests
    // -------------------------------------------------------------------------
    test(
        'TextButton FST1.11-M2: GIVEN a default M2 '
        'FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.textButtonTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          TextButtonThemeData(
            style: TextButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ), // buttonShape,
            ),
          ).toString(),
        ),
      );
    });
    test(
        'TextButton FST1.11-M2-base: GIVEN a custom '
        'FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same color', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
        ).toString(),
        equalsIgnoringHashCodes(
          TextButtonThemeData(
            style: TextButton.styleFrom(
              minimumSize: const Size(40, 40),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ), // buttonShape,
            ).copyWith(
              foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return colorScheme.onSurface.withOpacity(0.38);
                  }
                  return colorScheme.secondary;
                },
              ),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.secondary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.secondary.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.secondary.withOpacity(0.12);
                  }
                  return null;
                },
              ),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'TextButton FST1.11-M3: GIVEN a default M3 '
        'FlexSubTheme.textButtonTheme() '
        'EXPECT equal to TextButtonThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.textButtonTheme(
          colorScheme: colorScheme,
          useMaterial3: true,
        ).toString(minLevel: DiagnosticLevel.fine),
        equalsIgnoringHashCodes(
          const TextButtonThemeData(
            style: ButtonStyle(),
          ).toString(minLevel: DiagnosticLevel.fine),
        ),
      );
    });
    test(
        'TextButton FST1.11-M2-states: Does TextButton '
        'have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
    });
    test(
        'TextButton FST1.11-M2-tint-states: Does M2 '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF7142E7),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
    });
    test(
        'TextButton FST1.11-M3-states: Does '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primary,
        radius: 15,
        useMaterial3: true,
      );
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
        button.style!.shape!.resolve(<MaterialState>{}),
        equals(
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      );
    });
    test(
        'TextButton FST1.11-M3-custom-states: Does light '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primaryContainer,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.primaryContainer;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primaryContainer),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 4.0)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<MaterialState>{}),
          equals(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ));
    });
    test(
        'TextButton FST1.11-M3-custom-states: Does light '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.light,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 1.5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<MaterialState>{}),
          equals(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ));
    });
    test(
        'TextButton FST1.11-M3-custom-states: Does dark '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.tertiary,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.tertiary;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.tertiary),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 2)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 2)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 2)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<MaterialState>{}),
          equals(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ));
    });
    test(
        'TextButton FST1.11-M3-custom-states: Does dark '
        'TextButton have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF79E742),
        brightness: Brightness.dark,
      );
      final TextButtonThemeData button = FlexSubThemes.textButtonTheme(
        colorScheme: colorScheme,
        baseSchemeColor: SchemeColor.primaryContainer,
        radius: 5,
        useTintedDisable: true,
        useTintedInteraction: true,
      );
      final Color overlay = colorScheme.surface;
      final Color tint = colorScheme.primaryContainer;
      // Disabled foreground
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(FlexSubThemes.tintedDisable(colorScheme.onSurface, tint)),
      );
      expect(
        button.style!.foregroundColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primaryContainer),
      );
      // Overlay color states
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(overlay, tint, 5)),
      );
      expect(
        button.style!.overlayColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(null),
      );
      // Custom shape test
      expect(
          button.style!.shape!.resolve(<MaterialState>{}),
          equals(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ));
    });
  });
  group('WITH: FlexSubTheme.buttonTheme ', () {
    // TODO(rydmike): Monitor Flutter SDK deprecation of ButtonThemeData.
    // -------------------------------------------------------------------------
    // FlexSubThemes old material buttons theme tests
    // -------------------------------------------------------------------------
    test(
        'ButtonTheme FST1.12: GIVEN a default FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.buttonTheme(colorScheme: colorScheme),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 40,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            hoverColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x40)
                .withAlpha(0x19),
            focusColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x4C)
                .withAlpha(0x4C),
            highlightColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x40)
                .withAlpha(0x19),
            splashColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x1F)
                .withAlpha(0x33),
            disabledColor: colorScheme.primary
                .blendAlpha(colorScheme.onSurface, 0xCC)
                .withAlpha(0x26),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      );
    });
    test(
        'ButtonTheme FST1.12d: GIVEN a custom FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.buttonTheme(
          colorScheme: colorScheme,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          minButtonSize: const Size(45, 44),
          radius: 10,
        ),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 45,
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            hoverColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x40)
                .withAlpha(0x19),
            focusColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x4C)
                .withAlpha(0x4C),
            highlightColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x40)
                .withAlpha(0x19),
            splashColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x1F)
                .withAlpha(0x33),
            disabledColor: colorScheme.primary
                .blendAlpha(colorScheme.onSurface, 0xCC)
                .withAlpha(0x26),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      );
    });
    test(
        'ButtonTheme FST1.12-base-color: GIVEN a default '
        'FlexSubTheme.buttonTheme() '
        'EXPECT equal to ButtonThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.buttonTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
        ),
        equals(
          ButtonThemeData(
            colorScheme: colorScheme,
            minWidth: 40,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            layoutBehavior: ButtonBarLayoutBehavior.constrained,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            hoverColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x40)
                .withAlpha(0x19),
            focusColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x4C)
                .withAlpha(0x4C),
            highlightColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x40)
                .withAlpha(0x19),
            splashColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x1F)
                .withAlpha(0x33),
            disabledColor: colorScheme.secondary
                .blendAlpha(colorScheme.onSurface, 0xCC)
                .withAlpha(0x26),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            textTheme: ButtonTextTheme.primary,
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.toggleButtonsTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes ToggleButtons tests
    // -------------------------------------------------------------------------
    test(
        'ToggleButtons FST1.13: GIVEN a default '
        'FlexSubTheme.toggleButtonsTheme() EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      expect(
        FlexSubThemes.toggleButtonsTheme(colorScheme: colorScheme),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1,
            selectedColor: colorScheme.onPrimary.withAlpha(0xE5),
            color: colorScheme.primary,
            fillColor: colorScheme.primary.blendAlpha(Colors.white, 0x19),
            borderColor: colorScheme.primary.withAlpha(0xA7),
            selectedBorderColor:
                colorScheme.primary.blendAlpha(Colors.white, 0x19),
            hoverColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x40 + 0x19)
                .withAlpha(0x19),
            focusColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x4C + 0x19)
                .withAlpha(0x4C),
            highlightColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x40 + 0x19)
                .withAlpha(0x19),
            splashColor: colorScheme.primary
                .blendAlpha(Colors.white, 0x1F + 0x19)
                .withAlpha(0x33),
            disabledColor: colorScheme.primary
                .blendAlpha(colorScheme.onSurface, 0xCC)
                .withAlpha(0x5E),
            disabledBorderColor: colorScheme.primary
                .blendAlpha(colorScheme.onSurface, 0xCC)
                .withAlpha(0x26),
            borderRadius: BorderRadius.circular(20),
            constraints: BoxConstraints(
              minWidth: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
    test(
        'ToggleButtons FST1.13-base-color: GIVEN a default '
        'FlexSubTheme.toggleButtonsTheme() '
        'EXPECT '
        'equal to ToggleButtonsThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final VisualDensity visualDensity = VisualDensity.adaptivePlatformDensity;
      expect(
        FlexSubThemes.toggleButtonsTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
        ),
        equals(
          ToggleButtonsThemeData(
            borderWidth: 1,
            selectedColor: colorScheme.onSecondary.withAlpha(0xE5),
            color: colorScheme.secondary,
            fillColor: colorScheme.secondary.blendAlpha(Colors.white, 0x19),
            borderColor: colorScheme.secondary.withAlpha(0xA7),
            selectedBorderColor:
                colorScheme.secondary.blendAlpha(Colors.white, 0x19),
            hoverColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x40 + 0x19)
                .withAlpha(0x19),
            focusColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x4C + 0x19)
                .withAlpha(0x4C),
            highlightColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x40 + 0x19)
                .withAlpha(0x19),
            splashColor: colorScheme.secondary
                .blendAlpha(Colors.white, 0x1F + 0x19)
                .withAlpha(0x33),
            disabledColor: colorScheme.secondary
                .blendAlpha(colorScheme.onSurface, 0xCC)
                .withAlpha(0x5E),
            disabledBorderColor: colorScheme.secondary
                .blendAlpha(colorScheme.onSurface, 0xCC)
                .withAlpha(0x26),
            borderRadius: BorderRadius.circular(20),
            constraints: BoxConstraints(
              minWidth: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dx,
              minHeight: 40 - 1 * 2 + visualDensity.baseSizeAdjustment.dy,
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.floatingActionButtonTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes FloatingActionButton tests
    // -------------------------------------------------------------------------
    test(
        'FAB FST1.14a: GIVEN a default '
        'FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: const ColorScheme.light(),
        ),
        equals(
          const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
      );
    });
    test(
        'FST1.14b: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: const ColorScheme.light(),
          radius: 30,
        ),
        equals(
          const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
        ),
      );
    });
    test(
        'FAB FST1.14c: GIVEN a circular '
        'FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same Shape', () {
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: const ColorScheme.light(),
          radius: 30,
          alwaysCircular: true,
        ),
        equals(
          const FloatingActionButtonThemeData(shape: StadiumBorder()),
        ),
      );
    });
    test(
        'FAB FST1.14d: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          radius: 30,
          backgroundSchemeColor: SchemeColor.primaryContainer,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.primaryContainer,
            foregroundColor: colorScheme.onPrimaryContainer,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
        ),
      );
    });
    test(
        'FAB FST1.14e: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          radius: 32,
        ),
        equals(
          const FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
          ),
        ),
      );
    });
    test(
        'FAB FST1.14f: GIVEN a null shape '
        'FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with default shape values and colors', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.secondary,
          radius: 32,
          useShape: false,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onSecondary,
          ),
        ),
      );
    });
    test(
        'FST1.14f: GIVEN a null shape FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with default shape values and colors', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.secondary,
          radius: 32,
          useShape: true,
          alwaysCircular: true,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.secondary,
            foregroundColor: colorScheme.onSecondary,
            shape: const StadiumBorder(),
          ),
        ),
      );
    });
    test(
        'FAB FST1.14g: GIVEN a custom FlexSubTheme.floatingActionButtonTheme() '
        'EXPECT equal to FloatingActionButtonThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.floatingActionButtonTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.onPrimary,
          radius: 32,
        ),
        equals(
          FloatingActionButtonThemeData(
            backgroundColor: colorScheme.onPrimary,
            foregroundColor: colorScheme.primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(32),
              ),
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.chipTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Chip tests
    // -------------------------------------------------------------------------
    test(
        'Chip FST1.15: GIVEN a default FlexSubTheme.chipTheme() '
        'EXPECT equal to ChipThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          labelStyle: textTheme.labelLarge!,
        ),
        equals(
          ChipThemeData(
            padding: const EdgeInsets.all(4),
            labelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff000000)),
            secondaryLabelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff000000)),
            backgroundColor: const Color(0xffdfccfb),
            deleteIconColor: const Color(0xff000000),
            disabledColor: const Color(0x2613002f),
            selectedColor: const Color(0xffbe96f8),
            secondarySelectedColor: const Color(0xffbe96f8),
            checkmarkColor: const Color(0xff000000),
            surfaceTintColor: const Color(0xff6200ee),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            iconTheme: const IconThemeData(
              color: Color(0xff6200ee),
              size: 18.0,
            ),
          ),
        ),
      );
    });
    test(
        'Chip FST1.15-M3: GIVEN a default '
        'FlexSubTheme.chipTheme(M3 no-null scheme) '
        'EXPECT equal to ChipThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          labelStyle: textTheme.labelLarge!,
          baseSchemeColor: SchemeColor.primary,
          useMaterial3: true,
        ),
        equals(
          ChipThemeData(
            labelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff000000)),
            secondaryLabelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff000000)),
            backgroundColor: const Color(0xffdfccfb),
            deleteIconColor: const Color(0xff000000),
            disabledColor: const Color(0x2613002f),
            selectedColor: const Color(0xff03dac6),
            secondarySelectedColor: const Color(0xff03dac6),
            surfaceTintColor: const Color(0xff6200ee),
            checkmarkColor: const Color(0xff000000),
            iconTheme: const IconThemeData(
              color: Color(0xff6200ee),
              size: 18.0,
            ),
          ),
        ),
      );
    });
    test(
        'Chip FST1.15-M3-n: GIVEN a default '
        'FlexSubTheme.chipTheme(M3 null scheme) '
        'EXPECT equal to ChipThemeData() version '
        'with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
          seedColor: const Color(0xFF6750A4), brightness: Brightness.light);
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          labelStyle: textTheme.labelLarge!,
          useMaterial3: true,
        ),
        equals(
          ChipThemeData(
            checkmarkColor: colorScheme.onSecondaryContainer,
          ),
        ),
      );
    });
    test(
        'Chip FST1.16: GIVEN a '
        'FlexSubTheme.chipTheme() with usedSchemeColor '
        'Secondary EXPECT equal to ChipThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2018(platform: TargetPlatform.android).black;
      expect(
        FlexSubThemes.chipTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.secondary,
          labelStyle: textTheme.labelLarge!,
        ),
        equals(
          ChipThemeData(
            padding: const EdgeInsets.all(4),
            labelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff000000)),
            secondaryLabelStyle:
                textTheme.labelLarge!.copyWith(color: const Color(0xff000000)),
            backgroundColor: const Color(0xffccf7f3),
            deleteIconColor: const Color(0xff000000),
            disabledColor: const Color(0x26002b27),
            selectedColor: const Color(0xff97efe7),
            secondarySelectedColor: const Color(0xff97efe7),
            surfaceTintColor: const Color(0xff6200ee),
            checkmarkColor: const Color(0xff000000),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            iconTheme: const IconThemeData(
              color: Color(0xff015c54),
              size: 18.0,
            ),
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.navigationBarTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes NavigationBar tests
    // -------------------------------------------------------------------------
    test(
        'Chip FST1.17: GIVEN a default '
        'FlexSubTheme.navigationBarTheme() '
        'EXPECT equal to NavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.navigationBarTheme(
          colorScheme: colorScheme,
          useFlutterDefaults: true,
        ),
        equals(
          const NavigationBarThemeData(
            height: null,
            elevation: null,
            labelBehavior: null,
            backgroundColor: null,
            indicatorColor: null,
            labelTextStyle: null,
            iconTheme: null,
          ),
        ),
      );
    });
    test(
        'Chip FST1.18custom1: GIVEN a custom1 '
        'FlexSubTheme.navigationBarTheme() '
        'EXPECT equal to NavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2021(platform: TargetPlatform.android).black;
      final NavigationBarThemeData navBarTheme =
          FlexSubThemes.navigationBarTheme(
        colorScheme: colorScheme,
        elevation: 3,
        selectedIconSchemeColor: SchemeColor.secondary,
        selectedLabelSchemeColor: SchemeColor.error,
        unselectedIconSchemeColor: SchemeColor.onSurface,
        unselectedLabelSchemeColor: SchemeColor.onSurface,
        backgroundSchemeColor: null,
        indicatorSchemeColor: SchemeColor.secondaryContainer,
        height: 80,
        opacity: 0.9,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        mutedUnselectedIcon: true,
        mutedUnselectedLabel: true,
        indicatorAlpha: 0x3D,
        unselectedAlphaBlend: 0x66,
        unselectedAlpha: 0xA5,
      );
      expect(
        navBarTheme.toString(),
        equalsIgnoringHashCodes(
          NavigationBarThemeData(
            height: 80,
            elevation: 3,
            backgroundColor: colorScheme.background.withOpacity(0.9),
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: colorScheme.secondaryContainer.withAlpha(0x3D),
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return textTheme.labelSmall!
                      .copyWith(color: colorScheme.error);
                }
                return textTheme.labelSmall!.copyWith(
                  color: colorScheme.error
                      .blendAlpha(colorScheme.error, 0x66)
                      .withAlpha(0xA5),
                );
              },
            ),
            iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return IconThemeData(
                    size: 24,
                    color: colorScheme.secondary,
                  );
                }
                return IconThemeData(
                    size: 24,
                    color: colorScheme.onSurface
                        .blendAlpha(colorScheme.onSurface, 0x66)
                        .withAlpha(0xA5));
              },
            ),
          ).toString(),
        ),
      );
      // Does it have the right states?
      expect(
        navBarTheme.iconTheme!
            .resolve(<MaterialState>{MaterialState.selected})?.color,
        equals(colorScheme.secondary),
      );
      expect(
        navBarTheme.iconTheme!.resolve(<MaterialState>{})?.color,
        equals(
          colorScheme.onSurface
              .blendAlpha(colorScheme.onSurface, 0x66)
              .withAlpha(0xA5),
        ),
      );
      expect(
        navBarTheme.labelTextStyle!
            .resolve(<MaterialState>{MaterialState.selected})?.color,
        equals(colorScheme.error),
      );
      expect(
        navBarTheme.labelTextStyle!.resolve(<MaterialState>{})?.color,
        equals(
          colorScheme.onSurface
              .blendAlpha(colorScheme.onSurface, 0x66)
              .withAlpha(0xA5),
        ),
      );
    });
    test(
        'Chip FST1.18custom2: GIVEN a custom1 '
        'FlexSubTheme.navigationBarTheme() '
        'EXPECT equal to NavigationBarThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      final TextTheme textTheme =
          Typography.material2021(platform: TargetPlatform.android).black;
      final NavigationBarThemeData navBarTheme =
          FlexSubThemes.navigationBarTheme(
        colorScheme: colorScheme,
        labelTextStyle: textTheme.bodySmall,
        selectedIconSchemeColor: SchemeColor.secondaryContainer,
        selectedLabelSchemeColor: SchemeColor.primaryContainer,
        unselectedIconSchemeColor: SchemeColor.onSurface,
        unselectedLabelSchemeColor: SchemeColor.onSurface,
        indicatorSchemeColor: SchemeColor.secondary,
        backgroundSchemeColor: SchemeColor.error,
        height: 80,
        opacity: 0.9,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        mutedUnselectedIcon: false,
        mutedUnselectedLabel: false,
        indicatorAlpha: 0x3D,
        unselectedAlphaBlend: 0x66,
        unselectedAlpha: 0xA5,
        selectedIconSize: 28,
        unselectedIconSize: 25,
      );
      expect(
        navBarTheme.toString(),
        equalsIgnoringHashCodes(
          NavigationBarThemeData(
            height: 80,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            backgroundColor: colorScheme.error.withOpacity(0.9),
            indicatorColor: colorScheme.secondary.withAlpha(0x3D),
            labelTextStyle: MaterialStateProperty.resolveWith<TextStyle>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return textTheme.bodySmall!
                      .copyWith(color: colorScheme.primaryContainer);
                }
                return textTheme.bodySmall!
                    .copyWith(color: colorScheme.onSurface);
              },
            ),
            iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return IconThemeData(
                    size: 28,
                    color: colorScheme.secondaryContainer,
                  );
                }
                return IconThemeData(size: 25, color: colorScheme.onSurface);
              },
            ),
          ).toString(),
        ),
      );
      // Does it have the right states?
      expect(
        navBarTheme.iconTheme!
            .resolve(<MaterialState>{MaterialState.selected})?.color,
        equals(colorScheme.secondaryContainer),
      );
      expect(
        navBarTheme.iconTheme!
            .resolve(<MaterialState>{MaterialState.selected})?.size,
        equals(28),
      );
      expect(
        navBarTheme.iconTheme!.resolve(<MaterialState>{})?.color,
        equals(
          colorScheme.onSurface,
        ),
      );
      expect(
        navBarTheme.iconTheme!.resolve(<MaterialState>{})?.size,
        equals(25),
      );
      expect(
        navBarTheme.labelTextStyle!
            .resolve(<MaterialState>{MaterialState.selected})?.color,
        equals(colorScheme.primaryContainer),
      );
      expect(
        navBarTheme.labelTextStyle!.resolve(<MaterialState>{})?.color,
        equals(
          colorScheme.onSurface,
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.switchTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Switch tests
    // -------------------------------------------------------------------------
    test(
        'Switch FST1.19-light: GIVEN a light default '
        'FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            thumbColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary;
                }
                return Colors.grey.shade50;
              },
            ),
            trackColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.black12;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary.withAlpha(0x70);
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0x30);
              },
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return null;
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return null;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Switch FST1.19-light-states: Does Switch have right '
        'M2 material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      // Disabled colors
      // Disabled thumb colors
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme).thumbColor!.resolve(
            <MaterialState>{MaterialState.disabled, MaterialState.selected}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
        ).thumbColor!.resolve(
            <MaterialState>{MaterialState.disabled, MaterialState.selected}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.primary),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
        ).thumbColor!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, colorScheme.primary)
              .withAlpha(kAlphaLowDisabled),
        ),
      );
      // Disabled track colors
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
        ).trackColor!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, colorScheme.primary)
              .withAlpha(kAlphaVeryLowDisabled),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.black12),
      );
      // Selected background
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary.withAlpha(0x70)),
      );
      // Interaction states - Using test with Opacity based SDK values on
      // purpose, to confirm results match alpha based ones used by FCS.
      // Non tinted interactions
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.onSurface.withOpacity(0.08)),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      // Non tinted interactions - selected
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .overlayColor!
            .resolve(
                <MaterialState>{MaterialState.selected, MaterialState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .overlayColor!
            .resolve(
                <MaterialState>{MaterialState.selected, MaterialState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .overlayColor!
            .resolve(
                <MaterialState>{MaterialState.selected, MaterialState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      // Tinted interactions
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme, useTintedInteraction: true)
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme, useTintedInteraction: true)
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme, useTintedInteraction: true)
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme, useTintedInteraction: true)
            .overlayColor!
            .resolve(
                <MaterialState>{MaterialState.selected, MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme, useTintedInteraction: true)
            .overlayColor!
            .resolve(
                <MaterialState>{MaterialState.selected, MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme, useTintedInteraction: true)
            .overlayColor!
            .resolve(
                <MaterialState>{MaterialState.selected, MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );

      // Default states
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{}),
        equals(Colors.grey.shade50),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
        ).trackColor!.resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0x50)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
        ).trackColor!.resolve(<MaterialState>{}),
        equals(kSwitchM2LightTrackColor),
      );
    });

    test(
        'Switch FST1.19-dark: GIVEN a dark default FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
        ).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            thumbColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade800;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.secondary;
                }
                return Colors.grey.shade400;
              },
            ),
            trackColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.white10;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.secondary.withAlpha(0x70);
                }
                // Opinionated color on track when not selected
                return colorScheme.secondary.withAlpha(0x25);
              },
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return null;
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return null;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Switch FST1.19-dark-states: Does Switch have right '
        'M2 material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      // Disabled colors
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade800),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme).thumbColor!.resolve(
            <MaterialState>{MaterialState.disabled, MaterialState.selected}),
        equals(Colors.grey.shade800),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
        ).thumbColor!.resolve(
            <MaterialState>{MaterialState.disabled, MaterialState.selected}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.primary),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
        ).thumbColor!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
                  colorScheme.onSurface, colorScheme.primary)
              .withAlpha(kAlphaLowDisabled),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.white10),
      );
      // Selected background
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary.withAlpha(0x80)),
      );
      // Default states
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .thumbColor!
            .resolve(<MaterialState>{}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
        ).trackColor!.resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0x65)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
        ).trackColor!.resolve(<MaterialState>{}),
        equals(Colors.white30),
      );
    });
    test(
        'Switch FST1.19-custom-light: GIVEN a light custom '
        'FlexSubTheme.switchTheme() '
        'EXPECT equal to SwitchThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          splashRadius: 30,
          unselectedIsColored: true,
        ).toString(),
        equalsIgnoringHashCodes(
          SwitchThemeData(
            splashRadius: 30,
            thumbColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.tertiary;
                }
                return Colors.grey.shade50;
              },
            ),
            trackColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.black12;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.tertiary.withAlpha(0x70);
                }
                // Opinionated color on track when not selected
                return colorScheme.tertiary.withAlpha(0x30);
              },
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return null;
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return null;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Switch FST1.19-light-M3-states: '
        'Does Switch have right M3 states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      final SwitchThemeData switchTheme = FlexSubThemes.switchTheme(
        colorScheme: colorScheme,
        useMaterial3: true,
      );
      // Disabled thumb colors
      expect(
        switchTheme.thumbColor!.resolve(
            <MaterialState>{MaterialState.disabled, MaterialState.selected}),
        equals(colorScheme.surface),
      );
      expect(
        switchTheme.thumbColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.38)),
      );
      expect(
        switchTheme.trackOutlineColor!.resolve(<MaterialState>{}),
        equals(colorScheme.outline),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: true,
        ).thumbColor!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.primary),
        ),
      );
      // Disabled track colors
      expect(
        switchTheme.trackColor!.resolve(
            <MaterialState>{MaterialState.disabled, MaterialState.selected}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        switchTheme.trackColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.surfaceVariant.withOpacity(0.12)),
      );
      expect(
        switchTheme.trackOutlineColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: true,
        ).trackColor!.resolve(
            <MaterialState>{MaterialState.disabled, MaterialState.selected}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.primary),
        ),
      );
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          useTintedDisable: true,
          useMaterial3: true,
        ).trackOutlineColor!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(
          FlexSubThemes.tintedDisable(
              colorScheme.onSurface, colorScheme.primary),
        ),
      );

      // Selected thumb colors
      expect(
        switchTheme.thumbColor!.resolve(
            <MaterialState>{MaterialState.selected, MaterialState.pressed}),
        equals(colorScheme.primaryContainer),
      );
      expect(
        switchTheme.thumbColor!.resolve(
            <MaterialState>{MaterialState.selected, MaterialState.hovered}),
        equals(colorScheme.primaryContainer),
      );
      expect(
        switchTheme.thumbColor!.resolve(
            <MaterialState>{MaterialState.selected, MaterialState.focused}),
        equals(colorScheme.primaryContainer),
      );
      expect(
        switchTheme.thumbColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.onPrimary),
      );
      // Selected track color
      expect(
        FlexSubThemes.switchTheme(colorScheme: colorScheme)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary.withAlpha(0x70)),
      );
      // Pressed color
      expect(
        switchTheme.thumbColor!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.onSurfaceVariant),
      );
      // Hovered color
      expect(
        switchTheme.thumbColor!.resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.onSurfaceVariant),
      );
      // Focused color
      expect(
        switchTheme.thumbColor!.resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.onSurfaceVariant),
      );

      // Interaction states - Using test with Opacity based SDK values on
      // purpose, to confirm results match alpha based ones used by FCS.
      // Non tinted interactions
      // Overlay colors
      expect(
        switchTheme.overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      expect(
        switchTheme.overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.onSurface.withOpacity(0.08)),
      );
      expect(
        switchTheme.overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.onSurface.withOpacity(0.12)),
      );
      // trackColor
      expect(
        switchTheme.trackColor!.resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.surfaceVariant),
      );
      expect(
        switchTheme.trackColor!.resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.surfaceVariant),
      );
      expect(
        switchTheme.trackColor!.resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.surfaceVariant),
      );
      expect(
        switchTheme.trackColor!.resolve(<MaterialState>{}),
        equals(colorScheme.surfaceVariant),
      );

      expect(
        switchTheme.trackColor!.resolve(
            <MaterialState>{MaterialState.selected, MaterialState.pressed}),
        equals(colorScheme.primary),
      );
      expect(
        switchTheme.trackColor!.resolve(
            <MaterialState>{MaterialState.selected, MaterialState.hovered}),
        equals(colorScheme.primary),
      );
      expect(
        switchTheme.trackColor!.resolve(
            <MaterialState>{MaterialState.selected, MaterialState.focused}),
        equals(colorScheme.primary),
      );
      // Non tinted interactions - selected
      expect(
        switchTheme.overlayColor!.resolve(
            <MaterialState>{MaterialState.selected, MaterialState.pressed}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        switchTheme.overlayColor!.resolve(
            <MaterialState>{MaterialState.selected, MaterialState.hovered}),
        equals(colorScheme.primary.withOpacity(0.08)),
      );
      expect(
        switchTheme.overlayColor!.resolve(
            <MaterialState>{MaterialState.selected, MaterialState.focused}),
        equals(colorScheme.primary.withOpacity(0.12)),
      );
      expect(
        switchTheme.trackColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Tinted interactions
      // Overlay color
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(
                <MaterialState>{MaterialState.selected, MaterialState.pressed}),
        equals(FlexSubThemes.tintedPressed(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(
                <MaterialState>{MaterialState.selected, MaterialState.hovered}),
        equals(FlexSubThemes.tintedHovered(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                useTintedInteraction: true,
                useMaterial3: true)
            .overlayColor!
            .resolve(
                <MaterialState>{MaterialState.selected, MaterialState.focused}),
        equals(FlexSubThemes.tintedFocused(
            colorScheme.surface, colorScheme.primary, 1.5)),
      );

      // Unselected is colored
      // trackColor color
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withAlpha(0x33)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withAlpha(0x33)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withAlpha(0x33)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0x33)),
      );

      // Default states
      expect(
        switchTheme.thumbColor!.resolve(<MaterialState>{}),
        equals(colorScheme.outline),
      );
      expect(
        switchTheme.trackColor!.resolve(<MaterialState>{}),
        equals(colorScheme.surfaceVariant),
      );
      expect(
        switchTheme.trackOutlineColor!.resolve(<MaterialState>{}),
        equals(colorScheme.outline),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
          useMaterial3: true,
        ).trackColor!.resolve(<MaterialState>{}),
        equals(colorScheme.surfaceVariant),
      );
      // Default state for trackColor when unselectedIsColored, is true
      expect(
        FlexSubThemes.switchTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
          useMaterial3: true,
        ).trackColor!.resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0x33)),
      );
    });
  });
  group('WITH: FlexSubTheme.checkboxTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes CheckBox tests
    // -------------------------------------------------------------------------
    test(
        'CheckBox FST1.20-light: GIVEN a light default '
        'FlexSubTheme.checkboxTheme() '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          useMaterial3: false,
        ).toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            checkColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade200;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.onPrimary;
                }
                return Colors.grey.shade50;
              },
            ),
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary;
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0xDD);
              },
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'CheckBox FST1.20-light-states: Does '
        'CheckBox have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      // Disabled colors
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .checkColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade200),
      );
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade400),
      );
      // Selected background
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .checkColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.onPrimary),
      );
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Default states
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .checkColor!
            .resolve(<MaterialState>{}),
        equals(Colors.grey.shade50),
      );
      expect(
        FlexSubThemes.checkboxTheme(
                colorScheme: colorScheme, unselectedIsColored: true)
            .fillColor!
            .resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: false,
        ).fillColor!.resolve(<MaterialState>{}),
        equals(Colors.black54),
      );
    });

    test(
        'CheckBox FST1.20-dark: GIVEN a dark default '
        'FlexSubTheme.checkboxTheme() '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.checkboxTheme(
                colorScheme: colorScheme, unselectedIsColored: true)
            .toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            checkColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade600;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.onPrimary;
                }
                return Colors.grey.shade400;
              },
            ),
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade800;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary;
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0xDD);
              },
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'CheckBox FST1.20-dark-states: Does CheckBox have '
        'right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      // Disabled colors
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
        ).checkColor!.resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade900),
      );
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade800),
      );
      // Selected background
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .checkColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.onPrimary),
      );
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Unselected is colored
      // trackColor color
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.pressed}),
        equals(colorScheme.primary.withAlpha(0x44)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.hovered}),
        equals(colorScheme.primary.withAlpha(0x44)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<MaterialState>{MaterialState.focused}),
        equals(colorScheme.primary.withAlpha(0x44)),
      );
      expect(
        FlexSubThemes.switchTheme(
                colorScheme: colorScheme,
                unselectedIsColored: true,
                useMaterial3: true)
            .trackColor!
            .resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0x44)),
      );
      // Default states
      expect(
        FlexSubThemes.checkboxTheme(colorScheme: colorScheme)
            .checkColor!
            .resolve(<MaterialState>{}),
        equals(Colors.grey.shade400),
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
        ).fillColor!.resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          // unselectedIsColored: false, Is false by default.
        ).fillColor!.resolve(<MaterialState>{}),
        equals(Colors.white70),
      );
    });
    test(
        'CheckBox FST1.20-custom-light: GIVEN a light '
        'custom FlexSubTheme.checkboxTheme '
        'EXPECT equal to CheckboxThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.checkboxTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          splashRadius: 30,
          unselectedIsColored: false,
        ).toString(),
        equalsIgnoringHashCodes(
          CheckboxThemeData(
            splashRadius: 30,
            checkColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade200;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.onTertiary;
                }
                return Colors.grey.shade50;
              },
            ),
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.tertiary;
                }
                return Colors.black54;
              },
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.tertiary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.tertiary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.tertiary.withOpacity(0.12);
                }
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.radioTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Radio tests
    // -------------------------------------------------------------------------
    test(
        'Radio FST1.21-light: GIVEN a light default FlexSubTheme.radioTheme() '
        'EXPECT equal to RadioThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary;
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0xDD);
              },
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Radio FST1.21-light-states: Does Radio '
        'have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      // Disabled colors
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade400),
      );
      // Selected radio fill
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Default states
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
        ).fillColor!.resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          // unselectedIsColored: false,  <- False by default
        ).fillColor!.resolve(<MaterialState>{}),
        equals(Colors.black54),
      );
    });

    test(
        'Radio FST1.21-dark: GIVEN a dark default FlexSubTheme.radioTheme() '
        'EXPECT equal to RadioThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme).toString(),
        equalsIgnoringHashCodes(
          RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade800;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.primary;
                }
                // Opinionated color on track when not selected
                return colorScheme.primary.withAlpha(0xDD);
              },
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Radio FST1.21-dark-states: Does '
        'Radio have right material states', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.dark,
      );
      // Disabled colors
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.disabled}),
        equals(Colors.grey.shade800),
      );
      // Selected radio fill
      expect(
        FlexSubThemes.radioTheme(colorScheme: colorScheme)
            .fillColor!
            .resolve(<MaterialState>{MaterialState.selected}),
        equals(colorScheme.primary),
      );
      // Default states
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          unselectedIsColored: true,
        ).fillColor!.resolve(<MaterialState>{}),
        equals(colorScheme.primary.withAlpha(0xDD)),
      );
      // Default state for trackColor when unselectedIsColored, is false
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          // unselectedIsColored: false, <- False by default
        ).fillColor!.resolve(<MaterialState>{}),
        equals(Colors.white70),
      );
    });
    test(
        'Radio FST1.21-custom-light: GIVEN a light custom '
        'FlexSubTheme.radioTheme() '
        'EXPECT equal to RadioThemeData() version with same values', () {
      final ColorScheme colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF6750A4),
        brightness: Brightness.light,
      );
      expect(
        FlexSubThemes.radioTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          splashRadius: 30,
          unselectedIsColored: false,
        ).toString(),
        equalsIgnoringHashCodes(
          RadioThemeData(
            splashRadius: 30,
            fillColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey.shade400;
                }
                if (states.contains(MaterialState.selected)) {
                  return colorScheme.tertiary;
                }
                return Colors.black54;
              },
            ),
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  if (states.contains(MaterialState.pressed)) {
                    return colorScheme.onSurface.withOpacity(0.12);
                  }
                  if (states.contains(MaterialState.hovered)) {
                    return colorScheme.primary.withOpacity(0.08);
                  }
                  if (states.contains(MaterialState.focused)) {
                    return colorScheme.primary.withOpacity(0.12);
                  }
                  return Colors.transparent;
                }
                if (states.contains(MaterialState.pressed)) {
                  return colorScheme.primary.withOpacity(0.12);
                }
                if (states.contains(MaterialState.hovered)) {
                  return colorScheme.onSurface.withOpacity(0.08);
                }
                if (states.contains(MaterialState.focused)) {
                  return colorScheme.onSurface.withOpacity(0.12);
                }
                return Colors.transparent;
              },
            ),
          ).toString(),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.navigationRailTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes NavigationRail tests
    // -------------------------------------------------------------------------
    test(
        'NavigationRail FST1.22-light-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that uses Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          useFlutterDefaults: true,
        ),
        equals(
          const NavigationRailThemeData(
            elevation: 0,
            useIndicator: true,
            indicatorColor: Color(0x00000000),
          ),
        ),
      );
    });
    test(
        'NavigationRail FST1.22-dark-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that uses Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          useFlutterDefaults: true,
        ),
        equals(
          const NavigationRailThemeData(
            elevation: 0,
            useIndicator: true,
            indicatorColor: Color(0x00000000),
          ),
        ),
      );
    });
    test(
        'NavigationRail FST1.22-light-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that NOT use Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          // useFlutterDefaults: false // <<- Assumed as default,
        ),
        equals(
          const NavigationRailThemeData(
            elevation: 0,
            useIndicator: true,
            indicatorColor: Color(0x00000000),
            backgroundColor: Color(0xffffffff),
            unselectedLabelTextStyle: TextStyle(
                inherit: true, color: Color(0xa5000000), fontSize: 12.0),
            selectedLabelTextStyle: TextStyle(
                inherit: true, color: Color(0xff6200ee), fontSize: 12.0),
            unselectedIconTheme: IconThemeData(
                color: Color(0xa5000000), opacity: 1.0, size: 24.0),
            selectedIconTheme: IconThemeData(
                color: Color(0xff6200ee), opacity: 1.0, size: 24.0),
          ),
        ),
      );
    });
    test(
        'NavigationRail FST1.22-dark-flutter default: GIVEN a default '
        'FlexSubTheme.navigationRailTheme() that NOT use Flutter defaults '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          // useFlutterDefaults: false // <<- Assumed as default,
        ),
        equals(
          const NavigationRailThemeData(
            elevation: 0,
            useIndicator: true,
            indicatorColor: Color(0x00000000),
            backgroundColor: Color(0xff121212),
            unselectedLabelTextStyle: TextStyle(
                inherit: true, color: Color(0xa5ffffff), fontSize: 12.0),
            selectedLabelTextStyle: TextStyle(
                inherit: true, color: Color(0xffbb86fc), fontSize: 12.0),
            unselectedIconTheme: IconThemeData(
                color: Color(0xa5ffffff), opacity: 1.0, size: 24.0),
            selectedIconTheme: IconThemeData(
                color: Color(0xffbb86fc), opacity: 1.0, size: 24.0),
          ),
        ),
      );
    });
    test(
        'NavigationRail FST1.22custom: GIVEN a custom '
        'FlexSubTheme.navigationRailTheme() '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          selectedLabelSchemeColor: SchemeColor.secondary,
          selectedIconSchemeColor: SchemeColor.secondaryContainer,
          unselectedLabelSchemeColor: SchemeColor.onSurface,
          unselectedIconSchemeColor: SchemeColor.tertiary,
          backgroundSchemeColor: SchemeColor.surface,
          mutedUnselectedIcon: true,
          mutedUnselectedLabel: true,
          elevation: 1,
          opacity: 0.5,
          unselectedAlphaBlend: 0xFA,
          unselectedAlpha: 0x45,
          labelType: NavigationRailLabelType.all,
          groupAlignment: 0,
        ),
        equals(
          NavigationRailThemeData(
            elevation: 1,
            backgroundColor: colorScheme.surface.withOpacity(0.5),
            selectedIconTheme: IconThemeData(
              color: colorScheme.secondaryContainer,
              size: 24,
              opacity: 1,
            ),
            selectedLabelTextStyle: TextStyle(
              color: colorScheme.secondary,
              fontSize: 12,
            ),
            unselectedLabelTextStyle: TextStyle(
              color: colorScheme.onSurface
                  .blendAlpha(colorScheme.onSurface, 0xFA)
                  .withAlpha(0x45),
              fontSize: 12,
            ),
            unselectedIconTheme: IconThemeData(
              color: colorScheme.tertiary
                  .blendAlpha(colorScheme.tertiary, 0xFA)
                  .withAlpha(0x45),
              size: 24,
              opacity: 1,
            ),
            useIndicator: true,
            indicatorColor: const Color(0x00000000),
            labelType: NavigationRailLabelType.all,
            groupAlignment: 0,
          ),
        ),
      );
    });
    test(
        'NavigationRail FST1.23custom: GIVEN a custom '
        'FlexSubTheme.navigationRailTheme() '
        'EXPECT equal to NavigationRailThemeData() version '
        'with same values Icons Size test', () {
      const ColorScheme colorScheme = ColorScheme.dark();
      expect(
        FlexSubThemes.navigationRailTheme(
          colorScheme: colorScheme,
          selectedLabelSchemeColor: SchemeColor.secondary,
          selectedIconSchemeColor: SchemeColor.secondaryContainer,
          unselectedLabelSchemeColor: SchemeColor.onSurface,
          unselectedIconSchemeColor: SchemeColor.tertiary,
          backgroundSchemeColor: SchemeColor.surface,
          mutedUnselectedIcon: true,
          mutedUnselectedLabel: true,
          unselectedIconSize: 30,
          selectedIconSize: 32,
          elevation: 1,
          opacity: 0.5,
          unselectedAlphaBlend: 0xFA,
          unselectedAlpha: 0x45,
          labelType: NavigationRailLabelType.all,
          groupAlignment: 0,
        ),
        equals(
          NavigationRailThemeData(
            elevation: 1,
            backgroundColor: colorScheme.surface.withOpacity(0.5),
            selectedIconTheme: IconThemeData(
              color: colorScheme.secondaryContainer,
              size: 32,
              opacity: 1,
            ),
            selectedLabelTextStyle: TextStyle(
              color: colorScheme.secondary,
              fontSize: 12,
            ),
            unselectedLabelTextStyle: TextStyle(
              color: colorScheme.onSurface
                  .blendAlpha(colorScheme.onSurface, 0xFA)
                  .withAlpha(0x45),
              fontSize: 12,
            ),
            unselectedIconTheme: IconThemeData(
              color: colorScheme.tertiary
                  .blendAlpha(colorScheme.tertiary, 0xFA)
                  .withAlpha(0x45),
              size: 30,
              opacity: 1,
            ),
            useIndicator: true,
            indicatorColor: const Color(0x00000000),
            labelType: NavigationRailLabelType.all,
            groupAlignment: 0,
          ),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.sliderTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Slider tests
    // -------------------------------------------------------------------------
    test(
        'Slider FST1.24a-light: GIVEN a light default '
        'FlexSubTheme.sliderTheme() '
        'EXPECT equal to SliderThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.sliderTheme(colorScheme: colorScheme)
            .toString(minLevel: DiagnosticLevel.debug),
        equalsIgnoringHashCodes(
          const SliderThemeData(
            activeTrackColor: Color(0xff6200ee),
            inactiveTrackColor: Color(0x3d6200ee),
            disabledActiveTrackColor: Color(0x52000000),
            disabledInactiveTrackColor: Color(0x1f000000),
            activeTickMarkColor: Color(0x8affffff),
            inactiveTickMarkColor: Color(0x8a6200ee),
            disabledActiveTickMarkColor: Color(0x1fffffff),
            disabledInactiveTickMarkColor: Color(0x1f000000),
            thumbColor: Color(0xff6200ee),
            disabledThumbColor: Color(0xff9e9e9e),
            overlayColor: Color(0x00000000),
            valueIndicatorShape: RectangularSliderValueIndicatorShape(),
          ).toString(minLevel: DiagnosticLevel.debug),
        ),
      );
    });
    test(
        'Slider FST1.24b-light: GIVEN a light custom '
        'FlexSubTheme.sliderTheme() '
        'EXPECT equal to SliderThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.sliderTheme(
          colorScheme: colorScheme,
          baseSchemeColor: SchemeColor.tertiary,
          trackHeight: 6,
          valueIndicatorColor: const Color(0xFF342342),
          valueIndicatorTextStyle: const TextStyle(color: Colors.white12),
        ).toString(minLevel: DiagnosticLevel.debug),
        equalsIgnoringHashCodes(
          const SliderThemeData(
            trackHeight: 6.0,
            activeTrackColor: Color(0xff03dac6),
            inactiveTrackColor: Color(0x3d03dac6),
            disabledActiveTrackColor: Color(0x52000000),
            disabledInactiveTrackColor: Color(0x1f000000),
            activeTickMarkColor: Color(0x8a000000),
            inactiveTickMarkColor: Color(0x8a03dac6),
            disabledActiveTickMarkColor: Color(0x1f000000),
            disabledInactiveTickMarkColor: Color(0x1f000000),
            thumbColor: Color(0xff03dac6),
            disabledThumbColor: Color(0xff9e9e9e),
            overlayColor: Color(0x00000000),
            valueIndicatorColor: Color(0xff342342),
            valueIndicatorShape: RectangularSliderValueIndicatorShape(),
            valueIndicatorTextStyle:
                TextStyle(inherit: true, color: Color(0x1fffffff)),
          ).toString(minLevel: DiagnosticLevel.debug),
        ),
      );
    });
  });
  group('WITH: FlexSubTheme.tooltipTheme ', () {
    // -------------------------------------------------------------------------
    // FlexSubThemes Tooltip tests
    // -------------------------------------------------------------------------
    test(
        'Tooltip FST1.25a-light: GIVEN a light default '
        'FlexSubTheme.tooltipTheme() '
        'EXPECT equal to TooltipThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.tooltipTheme(
          colorScheme: colorScheme,
        ).toString(),
        equalsIgnoringHashCodes(
          TooltipThemeData(
            textStyle: ThemeData(brightness: Brightness.light)
                .textTheme
                .bodyMedium!
                .copyWith(color: colorScheme.surface),
            decoration: BoxDecoration(
              color: colorScheme.onSurface,
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              border: Border.all(color: Colors.transparent),
            ),
          ).toString(),
        ),
      );
    });
    test(
        'Tooltip FST1.25b-light: GIVEN a light custom '
        'FlexSubTheme.tooltipTheme() '
        'EXPECT equal to TooltipThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.tooltipTheme(
          colorScheme: colorScheme,
          foregroundColor: const Color(0xFFB5DEC2),
          backgroundColor: const Color(0xFF032F11),
          borderColor: const Color(0x88CCCCCC),
          borderRadius: 9,
          backgroundAlpha: 0xDD,
          textStyle:
              ThemeData(brightness: Brightness.light).textTheme.bodyLarge,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(12),
          waitDuration: const Duration(seconds: 1),
          showDuration: const Duration(milliseconds: 2500),
        ).toString(),
        equalsIgnoringHashCodes(
          TooltipThemeData(
            textStyle: ThemeData(brightness: Brightness.light)
                .textTheme
                .bodyLarge!
                .copyWith(color: const Color(0xFFB5DEC2)),
            decoration: BoxDecoration(
              color: const Color(0xDD032F11),
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              border: Border.all(color: const Color(0x88CCCCCC)),
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(12),
            waitDuration: const Duration(seconds: 1),
            showDuration: const Duration(milliseconds: 2500),
          ).toString(),
        ),
      );
    });
    test(
        'Tooltip FST1.25b-light: GIVEN a light custom '
        'FlexSubTheme.tooltipTheme() '
        'EXPECT equal to TooltipThemeData() version with same values', () {
      const ColorScheme colorScheme = ColorScheme.light();
      expect(
        FlexSubThemes.tooltipTheme(
          colorScheme: colorScheme,
          backgroundSchemeColor: SchemeColor.tertiary,
          foregroundColor: const Color(0xFFB5DEC2),
          backgroundColor: const Color(0xFF032F11),
          borderColor: const Color(0x88CCCCCC),
          borderRadius: 9,
          backgroundAlpha: 0xDD,
          textStyle:
              ThemeData(brightness: Brightness.light).textTheme.bodyLarge,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(12),
          waitDuration: const Duration(seconds: 1),
          showDuration: const Duration(milliseconds: 2500),
        ).toString(),
        equalsIgnoringHashCodes(
          TooltipThemeData(
            textStyle: ThemeData(brightness: Brightness.light)
                .textTheme
                .bodyLarge!
                .copyWith(color: colorScheme.onTertiary),
            decoration: BoxDecoration(
              color: colorScheme.tertiary.withAlpha(0xDD),
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              border: Border.all(color: const Color(0x88CCCCCC)),
            ),
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(12),
            waitDuration: const Duration(seconds: 1),
            showDuration: const Duration(milliseconds: 2500),
          ).toString(),
        ),
      );
    });
  });
}
