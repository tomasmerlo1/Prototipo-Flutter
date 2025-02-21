import 'package:flutter/material.dart';
import 'package:aplication_noticias/screens/home_screen.dart';
import 'package:aplication_noticias/screens/listviewregister_screen.dart';
import 'package:aplication_noticias/screens/search_screen.dart'; // Importar SearchScreen
import 'package:aplication_noticias/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:aplication_noticias/providers/theme_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(), // Noticias de Argentina
    ListViewScreen(), // Categorías
    SearchScreen(), // Buscador de noticias
    Center(child: Text('Configuración')), // Configuración
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('BAHIA NOTICIAS'),
            backgroundColor: Colors.blue,
            actions: [
              IconButton(
                icon: Icon(Icons.brightness_6),
                onPressed: () {
                  themeProvider.toggleTheme();
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
            ],
          ),
          body: _screens[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Categorías',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Buscador',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Configuración',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}
