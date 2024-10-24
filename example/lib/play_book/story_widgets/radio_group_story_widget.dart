import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class RadioGroupStoryWidget extends StatefulWidget {
  const RadioGroupStoryWidget({super.key});

  @override
  State<RadioGroupStoryWidget> createState() => _RadioGroupStoryWidgetState();
}

class _RadioGroupStoryWidgetState extends State<RadioGroupStoryWidget> {
  RadioGroupOptionInfo? _selectedOption;

  static const optionsList = <RadioGroupOptionInfo>[
    RadioGroupOptionInfo(label: 'Option 1', value: 'option-1'),
    RadioGroupOptionInfo(label: 'Option 2', value: 'option-2'),
    RadioGroupOptionInfo(label: 'Option 3', value: 'option-3'),
    RadioGroupOptionInfo(label: 'Option 4', value: 'option-4'),
  ];

  static const optionsList2 = <RadioGroupOptionInfo>[
    RadioGroupOptionInfo(label: 'Option 1', value: 'option-1'),
    RadioGroupOptionInfo(
        label: 'Option 2', value: 'option-2', isDisabled: true),
    RadioGroupOptionInfo(
        label: 'Option 3', value: 'option-3', isDisabled: true),
    RadioGroupOptionInfo(label: 'Option 4', value: 'option-4'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: double.infinity),
              const SizedBox(height: 12),
              RadioGroupInputWidget(
                label: 'Some label',
                optionsList: optionsList,
                selectedOption: _selectedOption,
                onChanged: (val) {
                  setState(() {
                    _selectedOption = val;
                  });
                },
                isRequired: true,
                isHorizontal: false,
                isSegmented: false,
                tooltipMessage: 'some tooltip message',
              ),
              const SizedBox(height: 12),
              RadioGroupInputWidget(
                label: 'Some label',
                optionsList: optionsList,
                selectedOption: _selectedOption,
                onChanged: (val) {
                  setState(() {
                    _selectedOption = val;
                  });
                },
                isRequired: true,
                isHorizontal: true,
                isSegmented: false,
                tooltipMessage: 'some tooltip message',
              ),
              const SizedBox(height: 12),
              RadioGroupInputWidget(
                label: 'Some label',
                optionsList: optionsList,
                selectedOption: _selectedOption,
                onChanged: (val) {
                  setState(() {
                    _selectedOption = val;
                  });
                },
                isRequired: true,
                isHorizontal: false,
                isSegmented: true,
                tooltipMessage: 'some tooltip message',
              ),
              const SizedBox(height: 12),
              RadioGroupInputWidget(
                label: 'Some label',
                optionsList: optionsList,
                selectedOption: _selectedOption,
                onChanged: (val) {
                  setState(() {
                    _selectedOption = val;
                  });
                },
                isRequired: true,
                isHorizontal: true,
                isSegmented: true,
                tooltipMessage: 'some tooltip message',
              ),
              const SizedBox(height: 24),
              RadioGroupInputWidget(
                label: 'Some label',
                optionsList: optionsList2,
                selectedOption: _selectedOption,
                onChanged: (val) {
                  setState(() {
                    _selectedOption = val;
                  });
                },
                isRequired: true,
                isHorizontal: false,
                isSegmented: false,
                tooltipMessage: 'some tooltip message',
              ),
              const SizedBox(height: 24),
              RadioGroupInputWidget(
                label: 'Some label',
                optionsList: optionsList2,
                selectedOption: _selectedOption,
                onChanged: (val) {
                  setState(() {
                    _selectedOption = val;
                  });
                },
                isRequired: true,
                isHorizontal: false,
                isSegmented: true,
                tooltipMessage: 'some tooltip message',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
