import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:get/get.dart';

class ThemesController extends GetxController {
  late Rx<AppColors> currentTheme = Rx<AppColors>(themes.first);

  void updateTheme(AppColors appColors) {
    currentTheme.value = appColors;
  }
}
