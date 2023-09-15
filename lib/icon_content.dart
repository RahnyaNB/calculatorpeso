import 'package:flutter/material.dart';

    class IconContent extends StatelessWidget {
      IconContent({super.key, required this.text, required this.icon});

      String text;
      IconData icon;

      @override
      Widget build(BuildContext context) {
        return Column(
        children: [
          Icon(
            icon, 
            size: 80.8
          ),
          SizedBox(
          height: 30.0,
          ),
          Text(text,
          style: TextStyle(
            fontSize: 20.0,
            color: Color(0XFF8D8E91),
            fontWeight: FontWeight.bold,
          ),
          )
        ],
        );
      }
    }
