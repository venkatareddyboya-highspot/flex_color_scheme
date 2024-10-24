

import 'package:flex_color_scheme_example/play_book/components/radio_widget.dart';
import 'package:get/get.dart';

class RadioConfigController extends GetxController{

  List<RadioGroupOptionInfo> optionsList = [
    const RadioGroupOptionInfo(value: "1", label: "Option 1"),
    const RadioGroupOptionInfo(value: "2", label: "Option 2"),
    const RadioGroupOptionInfo(value: "3", label: "Option 3"),
  ];
  String radioLabel = "Set Radio Label"; // Default label
  bool isSegmented = false; // Segmentation toggle
  bool isRequired = false; // Required toggle
  bool isHorizontal = true; // Horizontal layout toggle
  RadioGroupOptionInfo? selectedOption;

  @override
  void onInit() {
    // TODO: implement onInit
    selectedOption = optionsList[0];
    super.onInit();
  }

  setLabel(String label){
    radioLabel = label;
    update();
  }

  setIsSegmented(bool value){
    isSegmented = value;
    update();
  }

  setIsRequired(bool value){
    isRequired = value;
    update();
  }

  setHorizontal(bool value){
    isHorizontal = value;
    update();
  }

  selectOption(RadioGroupOptionInfo option){
    selectedOption = option;
    update();
  }

  String getRadioCodeSnippet() {
    String widgetString = """ RadioGroupInputWidget(
                  optionsList: ${optionsList},
                  selectedOption: ${selectedOption},
                  onChanged: (value) {
                    
                  },
                  isSegmented: ${isSegmented},
                  isRequired: ${isRequired},
                  isHorizontal: ${isHorizontal},
                  label: ${radioLabel},
                )
              """;

    return widgetString;
  }

}