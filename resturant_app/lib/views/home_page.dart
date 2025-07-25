import 'package:flutter/material.dart';
import 'package:resturant_app/constants/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F0F2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header & Avatar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Better Ice cream",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        "better planet",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage(
                      'assets/avatar.png',
                    ), // Add your avatar image
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Category Chips
              Row(
                children: [
                  _CategoryChip(label: "All", selected: true),
                  const SizedBox(width: 8),
                  _CategoryChip(label: "Ice-Cream", icon: Icons.icecream),
                  const SizedBox(width: 8),
                  _CategoryChip(
                    label: "100%",
                    icon: Icons.check_circle_outline,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Flavor of the week
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Flavor of the week",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: Colors.black38,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Ice Cream Card
              _FlavorCard(),
              const Spacer(),
              // Bottom Cart Bar
              _CartBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final bool selected;
  const _CategoryChip({required this.label, this.icon, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon != null
          ? Icon(icon, size: 18, color: selected ? Colors.white : Colors.pink)
          : null,
      label: Text(
        label,
        style: TextStyle(
          color: selected ? Colors.white : Colors.pink,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: selected ? Colors.pink : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
    );
  }
}

class _FlavorCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: maincolor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          // Ice Cream Image
          Positioned(
            left: 170,
            top: 10,
            child: Image.asset(
              'asset/images/test7.png',
              height: 200,
              width: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          // Texts
          Positioned(
            left: 16,
            top: 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Rocky Road",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 6),
                Chip(
                  label: Text("Fudge Brownie"),
                  backgroundColor: Color(0xFFE7F3E9),
                  labelStyle: TextStyle(color: Colors.black54),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                ),
                SizedBox(height: 16),
                Text(
                  "\$12.00",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
          // Cart Button
          Positioned(
            right: 16,
            bottom: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(16),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: const Color(0xFF7C184A),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Cart Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Text(
                    "2",
                    style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  "Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  "2 Items",
                  style: TextStyle(color: Colors.white70, fontSize: 15),
                ),
              ],
            ),
          ),
          // Cart Images (example)
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('asset/images/background.jpg'),
                ),
                const SizedBox(width: 4),
                CircleAvatar(
                  radius: 16,
                  backgroundImage: AssetImage('asset/images/background.jpg'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
