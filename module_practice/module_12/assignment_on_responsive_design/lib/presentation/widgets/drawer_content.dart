import 'package:flutter/material.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          color: const Color(0xFF11CF83),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'The Flutter World!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Explore more & more',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        const ListTile(
          leading: Icon(Icons.schedule),
          title: Text('Schedule', style: TextStyle(fontSize: 14),),
        ),
        SizedBox(height: 20),
        ListTile(
          leading: const Icon(Icons.message),
          title: const Text('Message', style: TextStyle(fontSize: 14),),
        ),
      ],
    );
  }
}
