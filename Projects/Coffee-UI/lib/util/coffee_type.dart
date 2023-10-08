import 'package:flutter/material.dart';

class CoffeeTypes extends StatelessWidget {
  final String coffeeTypes;
  final bool isSelected;
  final VoidCallback onTap;

  CoffeeTypes({
    required this.coffeeTypes,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            coffeeTypes,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.orange : Colors.white,
            ),
          )),
    );
  }
}
