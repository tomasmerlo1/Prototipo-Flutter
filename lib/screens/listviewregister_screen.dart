import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            color: Colors.lightBlue,
            padding: EdgeInsets.all(15),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.contact_emergency),
                Text('All Contacts'),
                Icon(Icons.add_call)
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            padding: EdgeInsets.all(15),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sofia Gonzalez',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height: 0.0), // Espaciado entre el título y el subtítulo
                Text(
                  'sofiagonzalez@gmail.com',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'Tomas Merlo',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height: 0.0), // Espaciado entre el título y el subtítulo
                Text(
                  'tomasmerlo2018@gmail.com',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'Macarena Huarte',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height: 0.0), // Espaciado entre el título y el subtítulo
                Text(
                  'macarenahuarte@gmail.com',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'Lionel Messi',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height: 0.0), // Espaciado entre el título y el subtítulo
                Text(
                  'pulgita@gmail.com',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Text(
                  'Angel Di Maria',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height: 0.0), // Espaciado entre el título y el subtítulo
                Text(
                  'fideo@gmail.com',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
