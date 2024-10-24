import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonConfigController extends GetxController {
  // Button properties (default values)
  ButtonType selectedButtonType = ButtonType.primary;
  String buttonLabel = "Button";
  bool enableLeftIcon = false;
  bool enableRightIcon = false;
  bool isButtonDisabled = false;

  setButtonType(ButtonType? buttonType) {
    selectedButtonType = buttonType ?? ButtonType.primary;
    update();
  }

  setButtonLabel(String label) {
    buttonLabel = label;
    update();
  }

  setEnableLeftIcon(bool enable) {
    enableLeftIcon = enable;
    update();
  }

  setEnableRightIcon(bool enable) {
    enableRightIcon = enable;
    update();
  }

  setDisableButton(bool enable) {
    isButtonDisabled = enable;
    update();
  }

  String getButtonCodeSnippet() {
    String widgetString = """ ButtonWidget(
      label: ${buttonLabel},
      buttonType: ${selectedButtonType},
      leftIconData: ${enableLeftIcon ? Icons.arrow_back : null},
      rightIconData: ${enableRightIcon ? Icons.arrow_forward : null},
      isDisabled: ${isButtonDisabled},
      onTap: () {
       
        }
      },
    )
              """;

    return widgetString;
  }
}
