import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  TaskState createState() => TaskState();
}

class TaskState extends State<Task> {
  String selectedStatus = 'In Progress';

  final List<String> statuses = ['In Progress', 'Completed', 'Pending'];

  void onMenuSelected(String choice) {
    if (choice == 'Edit') {
    } else if (choice == 'Delete') {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 209, 229, 245),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withAlpha(35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Text(
                  'Joe Rogan Experience\n- Lex Fridman',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
              PopupMenuButton<String>(
                onSelected: onMenuSelected,
                color: Color.fromARGB(255, 255, 255, 255),
                icon: Icon(
                  Icons.more_vert,
                  color: const Color.fromARGB(255, 158, 158, 158),
                ),
                itemBuilder: (BuildContext context) {
                  return ['Edit', 'Delete'].map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: SizedBox(
                        width: 45,
                        child: Text(
                          choice,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 61, 61, 61),
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  }).toList();
                },
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'July 21, 2025',
                style: TextStyle(fontSize: 14, fontFamily: 'monospace'),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: selectedStatus,
                    icon: const Icon(Icons.arrow_drop_down),
                    dropdownColor: Color.fromARGB(255, 255, 255, 255),
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                    ),
                    items: statuses.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedStatus = newValue!;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
