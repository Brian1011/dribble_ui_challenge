import 'package:drible_real_estate_ui/presenter/screens/home_screen.dart';
import 'package:drible_real_estate_ui/presenter/screens/map_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xFFFCA719),
          hintColor: const Color(0xFFA5957E),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: const Color(0xFFA5957E),
            // background color of two colors in the app
            surface: const Color(0xFFF5F5F5),
            background: const Color(0xFFFFFFFF),
          ),
          textTheme: const TextTheme(
            headlineLarge:
                TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            headlineMedium:
                TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            headlineSmall:
                TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            bodyLarge: TextStyle(fontSize: 16.0),
            bodyMedium: TextStyle(fontSize: 14.0),
            bodySmall: TextStyle(fontSize: 12.0),
          ),
          useMaterial3: true,
        ),
        routes: {
          '/search': (context) => const MapScreen(),
          '/': (context) => HomeScreen(),
        });
  }
}
