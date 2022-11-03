import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../shared/const/app_color.dart';
import '../../../../shared/controllers/theme_controller.dart';
import '../../../../shared/widgets/universal/switch_list_tile_adaptive.dart';
import '../../../../shared/widgets/universal/theme_mode_switch.dart';
import '../../dialogs/copy_scheme_to_custom_dialog.dart';
import '../../dialogs/reset_custom_colors_dialog.dart';
import 'input_colors_popup_menu.dart';
import 'show_input_colors.dart';
import 'used_colors_popup_menu.dart';

class InputColors extends StatelessWidget {
  const InputColors(
    this.controller, {
    super.key,
  });
  final ThemeController controller;

  Future<void> _handleCopySchemeTap(BuildContext context) async {
    final bool? copy = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const CopySchemeToCustomDialog();
      },
    );
    if (copy ?? false) {
      // Copy scheme to custom scheme, by setting custom scheme
      // to scheme of current scheme index.
      controller.setCustomScheme(AppColor.scheme(controller));
      // After copy, set input colors to the custom one so user can edit it.
      controller.setSchemeIndex(AppColor.schemes.length - 1);
    }
  }

  Future<void> _handleResetSchemeTap(BuildContext context) async {
    final bool? reset = await showDialog<bool?>(
      context: context,
      builder: (BuildContext context) {
        return const ResetCustomColorsDialog();
      },
    );
    if (reset ?? false) {
      await controller.resetCustomColorsToDefaults();
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final bool useSeed = controller.useKeyColors;
    final String explainSeed = useSeed
        ? 'Adjust the seed generated theme further with the "Seeded '
            'ColorScheme" feature'
        : 'Seeded color schemes use at least primary color as key to seed '
            'ColorSchemes for light and dark theme';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(height: 8),
        ListTile(
          title: const Text('Theme mode'),
          subtitle: Text('Mode ${controller.themeMode.name}'),
          trailing: ThemeModeSwitch(
            themeMode: controller.themeMode,
            onChanged: controller.setThemeMode,
          ),
          // Toggle theme mode also via the ListTile tap.
          onTap: () {
            if (Theme.of(context).brightness == Brightness.light) {
              controller.setThemeMode(ThemeMode.dark);
            } else {
              controller.setThemeMode(ThemeMode.light);
            }
          },
        ),
        InputColorsPopupMenu(controller: controller),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
          child: ShowInputColors(controller: controller),
        ),
        if (controller.schemeIndex !=
            (AppColor.schemes.length - 1)) ...<Widget>[
          ListTile(
            title: const Text('Use a custom theme?'),
            subtitle: const Text('Tap here to active the customizable theme'),
            onTap: () {
              controller.setSchemeIndex(AppColor.schemes.length - 1);
            },
          ),
          ListTile(
            title: const Text('Copy current colors to the customizable '
                'theme?'),
            subtitle:
                const Text('Tap a color code to copy it to the clipboard'),
            trailing: ElevatedButton(
              onPressed: () async {
                await _handleCopySchemeTap(context);
              },
              child: const Text('Copy'),
            ),
            onTap: () async {
              await _handleCopySchemeTap(context);
            },
          )
        ] else ...<Widget>[
          const ListTile(
            title: Text('This is the customizable theme'),
            subtitle: Text('Tap on colors above to modify theme colors'),
          ),
          ListTile(
            title: const Text('Reset custom theme to its default colors?'),
            subtitle: const Text('With a predefined theme selected, you can '
                'copy it as a custom theme starting point'),
            trailing: ElevatedButton(
              onPressed: () async {
                await _handleResetSchemeTap(context);
              },
              child: const Text('Reset'),
            ),
          )
        ],
        const Divider(),
        const ListTile(
          title: Text('Theme color modifiers'),
          subtitle: Text('Use the modifiers below to change the '
              'effective theme colors '
              "that define the theme's ColorScheme. The theme input color "
              'values show the colors before input modifiers, surrounding '
              'color is the effective theme.'),
        ),
        SwitchListTileAdaptive(
          title: const Text('Use Material 3 color system seed generated '
              'ColorScheme'),
          subtitle: Text(explainSeed),
          value: useSeed,
          onChanged: controller.setUseKeyColors,
        ),
        SwitchListTileAdaptive(
          title: const Text('Use Material 3 error colors'),
          subtitle: const Text('Override default M2 error colors and use M3 '
              'error colors, also when not using seeded ColorSchemes'),
          value: controller.useM3ErrorColors &&
              controller.useFlexColorScheme &&
              !controller.useKeyColors,
          onChanged: controller.useFlexColorScheme && !controller.useKeyColors
              ? controller.setUseM3ErrorColors
              : null,
        ),
        UsedColorsPopupMenu(
          title: const Text('Reduce amount of used theme colors'),
          index: controller.usedColors,
          onChanged:
              controller.useFlexColorScheme ? controller.setUsedColors : null,
        ),
        SwitchListTileAdaptive(
          title: const Text('When using Material 3, swap secondary '
              'and tertiary colors'),
          subtitle: const Text(
            'Only applies to built-in M2 designed schemes that benefit from '
            'it. Prefer ON when using M3. You can try OFF when using seeded '
            'ColorScheme with only primary seed key',
          ),
          value: controller.swapLegacyColors && controller.useFlexColorScheme,
          onChanged: controller.useFlexColorScheme
              ? controller.setSwapLegacyColors
              : null,
        ),
        if (isLight)
          SwitchListTileAdaptive(
            title: const Text('Light theme swap primary'),
            subtitle: const Text(
              'Swap primary and secondary, and their container colors',
            ),
            value: controller.swapLightColors && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setSwapLightColors
                : null,
          )
        else
          SwitchListTileAdaptive(
            title: const Text('Dark theme swap primary'),
            subtitle: const Text(
              'Swap primary and secondary, and their container colors',
            ),
            value: controller.swapDarkColors && controller.useFlexColorScheme,
            onChanged: controller.useFlexColorScheme
                ? controller.setSwapDarkColors
                : null,
          ),
        Visibility(
          visible: !isLight,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Column(
            children: <Widget>[
              SwitchListTileAdaptive(
                title: const Text('Compute dark theme'),
                subtitle: const Text('Compute dark theme from light color '
                    'values, instead of using predefined dark colors'),
                value: controller.useToDarkMethod &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors,
                onChanged:
                    controller.useFlexColorScheme && !controller.useKeyColors
                        ? controller.setUseToDarkMethod
                        : null,
              ),
              SwitchListTileAdaptive(
                title: const Text('Computed dark swaps main and container'),
                subtitle: const Text('If swapped, you can often use them '
                    'as they are with no white blend level, if light colors '
                    'use M3 design intent.'),
                value: controller.toDarkSwapPrimaryAndContainer &&
                    controller.useToDarkMethod &&
                    controller.useFlexColorScheme &&
                    !controller.useKeyColors,
                onChanged: controller.useToDarkMethod &&
                        controller.useFlexColorScheme &&
                        !controller.useKeyColors
                    ? controller.setToDarkSwapPrimaryAndContainer
                    : null,
              ),
              ListTile(
                title: Slider.adaptive(
                  max: 100,
                  divisions: 100,
                  label: controller.darkMethodLevel.toString(),
                  value: controller.darkMethodLevel.toDouble(),
                  onChanged: controller.useToDarkMethod &&
                          controller.useFlexColorScheme &&
                          !controller.useKeyColors
                      ? (double value) {
                          controller.setDarkMethodLevel(value.floor());
                        }
                      : null,
                ),
                trailing: Padding(
                  padding: const EdgeInsetsDirectional.only(end: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'LEVEL',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      Text(
                        '${controller.darkMethodLevel} %',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
