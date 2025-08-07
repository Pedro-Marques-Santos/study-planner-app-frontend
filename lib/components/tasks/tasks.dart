import 'package:app_task/components/search_tasks/search_tasks.dart';
import 'package:app_task/components/status_tasks/status_tasks.dart';
import 'package:app_task/components/task/task.dart';
import 'package:flutter/material.dart';
import 'package:app_task/components/tasks/select_time.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int selectedIndex = 0;

  void handleSelect(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void handleSearch(String value) {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 370),
            child: Column(
              children: [
                SelectTime(
                  selectedIndex: selectedIndex,
                  onSelect: handleSelect,
                ),
                const SizedBox(height: 16),
                const StatusTasks(),
                const SizedBox(height: 5),
                SearchTasks(onSearch: handleSearch),
                const SizedBox(height: 25),
                const Task(),
                const SizedBox(height: 18),
                const Task(),
                const SizedBox(height: 18),
                const Task(),
                const SizedBox(height: 18),
                const Task(),
                const SizedBox(height: 18),
                const Task(),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
