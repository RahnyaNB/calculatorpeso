import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;
  final String result;
  final String BMIcategory;

  ResultPage({required this.height, required this.weight, required this.result, required this.BMIcategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Height: $height cm',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'Weight: $weight kg',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'BMI result: $result kg',
              style: TextStyle(fontSize: 24.0),
            ),
            Text(
              'Category: $BMIcategory',
              style: TextStyle(fontSize: 24.0),
            ),

          ],
        ),
      ),
    );
  }
}
