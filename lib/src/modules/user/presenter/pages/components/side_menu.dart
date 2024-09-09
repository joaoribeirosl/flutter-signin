import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 75,
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 4.0),
          child: Column(
            children: [
              SizedBox(height: 24),
              // Logo do menu
              Column(
                children: [
                  Icon(
                    Icons.menu,
                    size: 50,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Menu",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // const SizedBox(height: 40),
              // Expanded(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       // Task Button
              //       IconButton(
              //         icon: const Icon(Icons.check_circle_outline),
              //         onPressed: () {},
              //       ),
              //       const SizedBox(height: 24),
              //       // Profile Button
              //       IconButton(
              //         icon: const Icon(Icons.person_outline),
              //         onPressed: () {},
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
