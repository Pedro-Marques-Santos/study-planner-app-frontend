import 'dart:async';
import 'package:flutter/material.dart';

class SearchTasks extends StatefulWidget {
  final Function(String) onSearch;

  const SearchTasks({super.key, required this.onSearch});

  @override
  State<SearchTasks> createState() => _SearchTasksState();
}

class _SearchTasksState extends State<SearchTasks> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  void _onTextChanged(String text) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      widget.onSearch(text);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 231, 231, 231)),
      ),
      child: TextField(
        controller: _controller,
        onChanged: _onTextChanged,
        decoration: const InputDecoration(
          hintText: 'Search tasks...',
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Color.fromARGB(255, 153, 153, 153),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 9),
        ),
        style: const TextStyle(
          fontSize: 16,
          color: Color.fromARGB(255, 61, 61, 61),
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
