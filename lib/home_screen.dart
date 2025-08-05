// import 'package:app_task/components/custom_bottom_navbar/custom_bottom_navbar.dart';
import 'package:app_task/components/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 240, 240, 240),
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Header(
                  selectedIndex: selectedIndex,
                  onTabSelected: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: selectedIndex == 0
                      ? const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text('Lista de Tasks aqui'),
                        )
                      : const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text('Categorias aqui'),
                        ),
                ),
              ],
            ),

            // Menu flutuante aqui
            // CustomBottomNavBar(
            //   selectedIndex: selectedIndex,
            //   onTabSelected: (index) {
            //     setState(() {
            //       selectedIndex = index;
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
