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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          Text('home page'),
          SizedBox(height: 12),
          ButtonWidget(),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key});

  final WidgetStatesController _statesController = WidgetStatesController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<WidgetState>>(
      valueListenable: _statesController,
      builder: (context, states, _) {
        return InkWell(
          onTapDown: (_) {
            _statesController.update(WidgetState.pressed, true);
          },
          onTapCancel: () {
            _statesController.update(WidgetState.pressed, false);
          },
          onTap: () {
            _statesController.update(WidgetState.pressed, false);
          },
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
            height: 36,
            decoration: BoxDecoration(
              color: states.contains(WidgetState.pressed) ? Colors.red : const Color(0xFF006DC7),
              borderRadius: const BorderRadius.all(Radius.circular(6)),
            ),
            child: const Text(
              'Button',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
