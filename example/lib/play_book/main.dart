import 'package:flex_color_scheme_example/example5_themes_playground/theme/flex_theme_light.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/theme/theme_data_dark.dart';
import 'package:flex_color_scheme_example/example5_themes_playground/theme/theme_data_light.dart';
import 'package:flex_color_scheme_example/play_book/controllers/home_binding.dart';
import 'package:flex_color_scheme_example/play_book/home/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../example5_themes_playground/theme/flex_theme_dark.dart';
import '../shared/controllers/theme_controller.dart';
import '../shared/services/theme_service.dart';
import '../shared/services/theme_service_hive.dart';

/// FlexColorScheme EXAMPLE 5 - Themes Playground
///
/// The learn more about using this app see the docs at:
/// - https://docs.flexcolorscheme.com/playground
///
/// The learn more about its history and design see docs at:
/// - https://docs.flexcolorscheme.com/tutorial5
///
/// A ThemeService and ThemeController is used to manage the theme settings.
/// This follows the example architecture you get when you
/// create a Flutter template application architecture with:
///
/// flutter create -t skeleton my_flutter_app
///
/// The theme controller is used to change the theme mode, to toggle
/// opting in and out of FlexColorScheme's opinionated sub-themes, and to
/// change the index value of the used colors from the list of FlexSchemeData
/// in AppColor.schemesCustom and many other options.
///
/// You can try this app as a web app at:
/// https://rydmike.com/flexcolorscheme/themesplayground-v7-2
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ThemeService themeService = ThemeServiceHive('flex_color_scheme_v5_box_5');
  // Initialize the theme service.
  await themeService.init();
  // Create a ThemeController that uses the ThemeService.
  final ThemeController themeController = ThemeController(themeService);
  // Load preferred theme settings, while the app is loading, before MaterialApp
  // is created, this prevents a theme change when the app is first displayed.
  await themeController.loadAll();

  // Only use Google fonts via asset provided fonts.
  GoogleFonts.config.allowRuntimeFetching = false;
  // Add font license info for used fonts from Google fonts.
  LicenseRegistry.addLicense(() async* {
    final String license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  });

  runApp(PlaygroundApp(controller: themeController));
}

class PlaygroundApp extends StatelessWidget {
  const PlaygroundApp({super.key, required this.controller});
  final ThemeController controller;

  @override
  Widget build(BuildContext context) {
    // Whenever the theme controller notifies the listenable in the
    // ListenableBuilder, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: controller,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Themes Playground',

          theme: controller.useFlexColorScheme ? flexThemeLight(controller) : themeDataLight(controller),
          darkTheme: controller.useFlexColorScheme ? flexThemeDark(controller) : themeDataDark(controller),
          // Use the dark/light theme based on controller setting.
          themeMode: controller.themeMode,
          initialBinding: HomeBinding(),
          home: GestureDetector(

            onTap: () => FocusScope.of(context).unfocus(),

            child: PlayBookHomePage(),
          ),
        );
      },
    );
  }
}
