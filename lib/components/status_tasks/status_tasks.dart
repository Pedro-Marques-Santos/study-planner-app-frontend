import 'package:flutter/material.dart';

class StatusTasks extends StatefulWidget {
  const StatusTasks({super.key});

  @override
  State<StatusTasks> createState() => _StatusTasksState();
}

class _StatusTasksState extends State<StatusTasks> {
  String selectedStatus = 'All Subjects';

  final List<String> statusOptions = [
    'All Subjects',
    'Completed',
    'Pending',
    'In Progress',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 231, 231, 231)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedStatus,
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          isExpanded: true,
          dropdownColor: Color.fromARGB(255, 255, 255, 255),
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 61, 61, 61),
            fontWeight: FontWeight.w400,
          ),
          onChanged: (String? newValue) {
            if (newValue != null) {
              setState(() {
                selectedStatus = newValue;
              });
            }
          },
          items: statusOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
      ),
    );
  }
}
