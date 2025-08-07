import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  const Header({
    super.key,
    required this.selectedIndex,
    required this.onTabSelected,
  });

  final List<String> tabs = const ['Tasks', 'Categories'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: const Center(
            child: Text(
              'My tasks',
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Poppins',
                color: Color.fromARGB(255, 107, 107, 107),
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: double.infinity,
              height: 48,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color.fromARGB(255, 216, 216, 216),
                    width: 2.5,
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(tabs.length, (index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () => onTabSelected(index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: isSelected
                                ? const Color.fromARGB(255, 53, 135, 182)
                                : Colors.transparent,
                            width: 2.5,
                          ),
                        ),
                      ),
                      child: Text(
                        tabs[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: isSelected
                              ? const Color.fromARGB(255, 53, 135, 182)
                              : const Color.fromARGB(255, 107, 107, 107),
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
