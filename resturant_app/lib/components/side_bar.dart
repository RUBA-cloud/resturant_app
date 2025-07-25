import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  final int selectedIndex;
  Sidebar({super.key, this.selectedIndex = 0});

  final List<String> categories = ["All", "Breakfast", "Lunch"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      color: Colors.white, // or any background
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {
              // handle tap
              print("Tapped ${categories[index]}");
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: RotatedBox(
                quarterTurns: -1,
                child: Text(
                  categories[index],
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: selectedIndex == index ? Colors.black : Colors.grey,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
