import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flex_color_scheme_example/play_book/home/home_page.dart';
import 'package:flex_color_scheme_example/play_book/themes/themes_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../shared/controllers/theme_controller.dart';
import '../shared/services/theme_service.dart';
import '../shared/services/theme_service_hive.dart';
import 'controllers/home_page_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ThemeService themeService =
      ThemeServiceHive('flex_color_scheme_v5_box_5');
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
    final String license =
        await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  });

  runApp(PlaygroundApp(controller: themeController));
}

class PlaygroundApp extends StatefulWidget {
  const PlaygroundApp({super.key, required this.controller});
  final ThemeController controller;

  @override
  State<PlaygroundApp> createState() => _PlaygroundAppState();
}

class _PlaygroundAppState extends State<PlaygroundApp> {
  late final ThemesController themesController;
  @override
  void initState() {
    super.initState();
    themesController = Get.put(ThemesController());
    Get.put(() => HomePageController());
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<ThemesController>();
  }

  @override
  Widget build(BuildContext context) {
    // Whenever the theme controller notifies the listenable in the
    // ListenableBuilder, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (BuildContext context, Widget? child) {
        return GetX<ThemesController>(builder: (themesController) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Themes Playground',
            theme: addThemeExtenstions(
              ThemeData.light(),
              themesController.currentTheme.value,
            ),
            // Use the dark/light theme based on controller setting.
            themeMode: ThemeMode.light,
            //initialBinding: HomeBinding(),
            home: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: PlayBookHomePage(),
            ),
          );
        });
      },
    );
  }
}
