import 'package:aplication_noticias/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:aplication_noticias/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:aplication_noticias/providers/news_provider.dart';
import 'package:aplication_noticias/providers/theme_provider.dart'; // Importa el ThemeProvider

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyBcgDMtUYqxPH8FdtoiP4dPbb8gYfJX-Ps",
      authDomain: "prototipo-flutter.firebaseapp.com",
      projectId: "prototipo-flutter",
      storageBucket: "prototipo-flutter.appspot.com",
      messagingSenderId: "706298610676",
      appId: "1:706298610676:web:06e39ff091280b04346fa1",
      measurementId: "G-M6MS6M5GJ8",
    ),
  );

  // Inicializa NewsProvider y carga las noticias de SharedPreferences
  final newsProvider = NewsProvider();
  await newsProvider.loadNewsFromLocalStorage();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()), // Agrega el ThemeProvider
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'NOTICIAS ARG',
          theme: themeProvider.currentTheme, // Aplica el tema
          home: MainScreen(),
        );
      },
    );
  }
}
