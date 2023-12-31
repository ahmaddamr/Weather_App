import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: const Text(
              'There is no weather 😶 Start',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: const Text(
              'Searching Now 🔍',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
