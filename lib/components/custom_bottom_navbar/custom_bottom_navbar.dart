import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.fixedCircle,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      activeColor: Color.fromARGB(255, 63, 161, 218),
      height: 70,
      curveSize: 100,
      color: Color.fromARGB(255, 148, 148, 148),
      items: const [
        TabItem(icon: Icons.home, title: 'Home'),
        TabItem(icon: Icons.calendar_month, title: 'Calendar'),
        TabItem(icon: Icons.add, title: ''),
        TabItem(icon: Icons.bar_chart, title: 'Statistics'),
        TabItem(icon: Icons.person, title: 'User'),
      ],
      initialActiveIndex: selectedIndex,
      onTap: (int index) {
        onTabSelected(index);
      },
    );
  }
}
