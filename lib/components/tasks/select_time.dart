import 'package:flutter/material.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  final int selectedIndex;
  final Function(int) onSelect;

  @override
  SelectTimeState createState() => SelectTimeState();
}

class SelectTimeState extends State<SelectTime> {
  @override
  Widget build(BuildContext context) {
    final items = ['Today', 'Week', 'Future', "All Time"];

    return Container(
      // width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(
          0xFFE6F4FF,
        ), // azul claro do fundo (parecido com a imagem)
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(9),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(items.length, (index) {
          final bool isSelected = widget.selectedIndex == index;

          return GestureDetector(
            onTap: () => widget.onSelect(index),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color.fromARGB(255, 142, 209, 248)
                    : Colors.transparent, // azul mais forte no selecionado
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                items[index],
                style: TextStyle(
                  color: isSelected
                      ? const Color.fromARGB(255, 27, 63, 82)
                      : Color.fromARGB(255, 61, 61, 61),
                  fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
