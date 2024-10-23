import 'package:flex_color_scheme_example/temp_example/radio_widget.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      themeMode: ThemeMode.light,
      //home: HomePage(),
      home: RadioFieldHomePage(),
    );
  }
}

class RadioFieldHomePage extends StatefulWidget {
  const RadioFieldHomePage({super.key});

  @override
  State<RadioFieldHomePage> createState() => _RadioFieldHomePageState();
}

class _RadioFieldHomePageState extends State<RadioFieldHomePage> {
  RadioGroupOptionInfo? _selectedOption;

  final options = {
    'option-1': 'Option 1',
    'option-2': 'Option 2',
    'option-3': 'Option 3',
  };

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
    return Scaffold(
      body: SingleChildScrollView(
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
