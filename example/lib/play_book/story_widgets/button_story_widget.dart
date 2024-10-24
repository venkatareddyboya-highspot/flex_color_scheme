import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ButtonStoryWidget extends StatelessWidget {
  const ButtonStoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: double.infinity),
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
