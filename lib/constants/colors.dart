import 'package:flutter/material.dart';

class ColorPalette {
  static Map<String, Color> colors = {
    "Black": Colors.black,
    "White": Colors.white,
    "Red": Colors.red,
    "Yellow": Colors.yellow,
    "Blue": Colors.green,
    "Orange": Colors.orange,
    "Brown": Colors.brown,
    "Grey": Colors.grey,
    "Purple": Colors.purple,
    "Pink": Colors.pink
  };

  static List<DropdownMenuItem<String>> get coloritems => colors.keys.map((key) {
        return DropdownMenuItem(
          value: key,
          child: Row(
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    border: Border.all(color: (colors[key] == Colors.white) ? Colors.black : colors[key]!.withAlpha(0)), color: colors[key]),
              ),
              const SizedBox(
                width: 15,
              ),
              Text(key),
            ],
          ),
        );
      }).toList();
}
