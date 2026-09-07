import 'package:flutter/material.dart';

import './pages/inicio.dart';
import './pages/galeria.dart';
import './pages/musica.dart';
import './pages/declaracao.dart';
import './pages/games.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eu & Você - Nossa História',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFC85C7A),
        ),
      ),

      initialRoute: '/',

      routes: {
        '/': (context) => const Inicio(),
        '/galeria': (context) => const Galeria(),
        '/musica': (context) => const Musica(),
        '/declaracao': (context) => const Declaracao(),
        '/nosso-cantinho': (context) => const Games(),
      },
    );
  }
}