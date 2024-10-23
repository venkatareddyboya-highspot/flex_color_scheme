


import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Action to be performed when the button is pressed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Button Pressed!'),
          ),
        );
      },
      child: Text('Press Me'),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        textStyle: TextStyle(fontSize: 18),
      ),
    );
  }


}