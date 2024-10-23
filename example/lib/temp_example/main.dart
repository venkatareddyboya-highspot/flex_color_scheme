import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      themeMode: ThemeMode.light,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
            const Text('home page'),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.normal,
              label: 'Normal',
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.normal,
              label: 'Back',
              leftIconData: Icons.arrow_back,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.normal,
              label: 'Next',
              rightIconData: Icons.arrow_forward,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.normal,
              leftIconData: Icons.arrow_forward,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.normal,
              label: 'Normal',
              isDisabled: true,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.normal,
              leftIconData: Icons.arrow_forward,
              isDisabled: true,
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              buttonType: ButtonType.primary,
              label: 'Primary',
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.primary,
              label: 'Back',
              leftIconData: Icons.arrow_back,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.primary,
              label: 'Next',
              rightIconData: Icons.arrow_forward,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.primary,
              leftIconData: Icons.arrow_forward,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.primary,
              label: 'Primary',
              isDisabled: true,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.primary,
              leftIconData: Icons.arrow_forward,
              isDisabled: true,
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              buttonType: ButtonType.critical,
              label: 'Critical',
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.critical,
              label: 'Back',
              leftIconData: Icons.arrow_back,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.critical,
              label: 'Next',
              rightIconData: Icons.arrow_forward,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.critical,
              leftIconData: Icons.arrow_forward,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.critical,
              label: 'Critical',
              isDisabled: true,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.critical,
              leftIconData: Icons.arrow_forward,
              isDisabled: true,
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              buttonType: ButtonType.generativeAI,
              label: 'Generative AI',
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.generativeAI,
              label: 'Back',
              leftIconData: Icons.arrow_back,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.generativeAI,
              label: 'Next',
              rightIconData: Icons.arrow_forward,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.generativeAI,
              leftIconData: Icons.arrow_forward,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.generativeAI,
              label: 'Generative AI',
              isDisabled: true,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.generativeAI,
              leftIconData: Icons.arrow_forward,
              isDisabled: true,
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              buttonType: ButtonType.anchorStandalone,
              label: 'Anchor Standalone',
              rightIconData: Icons.arrow_forward,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.anchorStandalone,
              leftIconData: Icons.arrow_forward,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.anchorStandalone,
              label: 'Anchor Standalone',
              rightIconData: Icons.arrow_forward,
              isDisabled: true,
            ),
            const SizedBox(height: 12),
            ButtonWidget(
              buttonType: ButtonType.anchorStandalone,
              leftIconData: Icons.arrow_forward,
              isDisabled: true,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    this.buttonType = ButtonType.primary,
    this.label,
    this.onTap,
    this.leftIconData,
    this.rightIconData,
    this.isDisabled = false,
  });

  final String? label;
  final VoidCallback? onTap;
  final ButtonType buttonType;
  final IconData? leftIconData;
  final IconData? rightIconData;
  final bool isDisabled;

  final WidgetStatesController _statesController = WidgetStatesController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<WidgetState>>(
      valueListenable: _statesController,
      builder: (BuildContext context, Set<WidgetState> states, _) {
        final bgColor = switch (buttonType) {
          ButtonType.primary => const Color(0xFF006DC7),
          ButtonType.critical => const Color(0xFFE10000),
          ButtonType.normal => const Color(0xFFF1F1F1),
          ButtonType.anchorStandalone => const Color(0xFF006DC7),
          ButtonType.generativeAI => Colors.white,
        };

        const disabledBgColor = Color(0xFFF1F1F1);

        final labelColor = switch (buttonType) {
          ButtonType.primary || ButtonType.critical => Colors.white,
          ButtonType.normal ||
          ButtonType.generativeAI =>
            const Color(0xFF343434),
          ButtonType.anchorStandalone => const Color(0xFF0075D4),
        };

        final disabledLabelColor = switch (buttonType) {
          ButtonType.primary ||
          ButtonType.critical =>
            Colors.black.withOpacity(0.3),
          ButtonType.normal ||
          ButtonType.generativeAI ||
          ButtonType.anchorStandalone =>
            const Color(0xFFDCDCDC),
        };

        final splashColor = switch (buttonType) {
          ButtonType.primary => const Color(0xFF0075D4),
          ButtonType.critical => const Color(0xFFEE0000),
          ButtonType.normal => const Color(0xFFEDEDED),
          ButtonType.anchorStandalone => const Color(0xFF005EAE),
          ButtonType.generativeAI => const Color(0xFFF3F3F3),
        };

        return GestureDetector(
          onTapDown: (_) {
            _statesController.update(WidgetState.pressed, true);
          },
          onTapCancel: () {
            _statesController.update(WidgetState.pressed, false);
          },
          onTap: () {
            _statesController.update(WidgetState.pressed, false);
            onTap?.call();
          },
          child: Builder(
            builder: (_) {
              if (buttonType == ButtonType.anchorStandalone && label != null) {
                return Text(
                  label ?? '',
                  style: TextStyle(
                    color: isDisabled
                        ? disabledLabelColor
                        : (states.contains(WidgetState.pressed)
                            ? splashColor
                            : bgColor),
                    fontWeight: FontWeight.w600,
                  ),
                );
              }
              if (buttonType == ButtonType.anchorStandalone &&
                  leftIconData != null) {
                return Icon(
                  leftIconData,
                  color: isDisabled
                      ? disabledLabelColor
                      : (states.contains(WidgetState.pressed)
                          ? splashColor
                          : bgColor),
                  size: 16,
                );
              }

              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: isDisabled
                      ? disabledBgColor
                      : (states.contains(WidgetState.pressed)
                          ? splashColor
                          : bgColor),
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                  border: buttonType == ButtonType.generativeAI && !isDisabled
                      ? const GradientBoxBorder(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF21D8D9),
                              Color(0xFF006DC7),
                            ],
                          ),
                          width: 1,
                        )
                      : Border.all(
                          color: Colors.transparent, // Equivalent to #FFFFFF
                          width: 1.0, // Equivalent to 1px
                        ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leftIconData != null) ...[
                      Icon(
                        leftIconData,
                        color: isDisabled ? disabledLabelColor : labelColor,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                    ],
                    if (label != null) ...[
                      Text(
                        label ?? '',
                        style: TextStyle(
                          color: isDisabled ? disabledLabelColor : labelColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                    if (rightIconData != null) ...[
                      const SizedBox(width: 4),
                      Icon(
                        rightIconData,
                        color: isDisabled ? disabledLabelColor : labelColor,
                        size: 16,
                      ),
                    ],
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

enum ButtonType {
  normal,
  primary,
  critical,
  generativeAI,
  anchorStandalone,
}
