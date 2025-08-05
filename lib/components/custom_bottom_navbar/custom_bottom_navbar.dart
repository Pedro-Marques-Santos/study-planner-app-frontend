import 'package:flutter/material.dart';

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
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Fundo com recorte curvo
          ClipPath(
            clipper: NavBarClipper(),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(Icons.home, 0),
                  _buildNavItem(Icons.calendar_month, 1),
                  const SizedBox(width: 70), // Espaço para o botão central
                  _buildNavItem(Icons.grid_view, 3),
                  _buildNavItem(Icons.person, 4),
                ],
              ),
            ),
          ),

          // Botão "+" flutuante
          Positioned(
            bottom: 35,
            child: GestureDetector(
              onTap: () => onTabSelected(2),
              child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 32),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () => onTabSelected(index),
      child: Icon(
        icon,
        color: selectedIndex == index ? Colors.blue : Colors.grey,
        size: 28,
      ),
    );
  }
}

// Clipper para fazer o recorte curvo central
class NavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width * 0.5 - 40, 0);

    path.quadraticBezierTo(size.width * 0.5 - 35, 0, size.width * 0.5 - 35, 20);

    path.arcToPoint(
      Offset(size.width * 0.5 + 35, 20),
      radius: Radius.circular(40),
      clockwise: false,
    );

    path.quadraticBezierTo(size.width * 0.5 + 35, 0, size.width * 0.5 + 40, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
