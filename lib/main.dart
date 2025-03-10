import 'package:aplication_noticias/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:aplication_noticias/providers/news_provider.dart';
import 'package:aplication_noticias/providers/theme_provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
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

  final newsProvider = NewsProvider();
  await newsProvider.loadNewsFromLocalStorage();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => ThemeProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'NOTICIAS ARG',
          theme: themeProvider.currentTheme,
          home: MainScreen(),
        );
      },
    );
  }
}
