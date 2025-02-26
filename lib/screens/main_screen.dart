import 'package:flutter/material.dart';
import 'package:aplication_noticias/screens/home_screen.dart';
import 'package:aplication_noticias/screens/Noticias_screen.dart';
import 'package:aplication_noticias/screens/search_screen.dart';
import 'package:aplication_noticias/screens/login_screen.dart'; // Importa LoginScreen aquí
import 'package:aplication_noticias/providers/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:aplication_noticias/screens/settings_screen.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  MainScreen({this.initialIndex = 0});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  final List<Widget> _screens = [
    HomeScreen(),
    NoticiasScreen(),
    SearchScreen(),
    SettingsScreen(),
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
            title: DefaultTextStyle(
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              child: Text('News APP'),
            ),
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white),
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
                label: 'Noticias',
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
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            onTap: _onItemTapped,
          ),
        );
      },
    );
  }
}