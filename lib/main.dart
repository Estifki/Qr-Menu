import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:qr_menu/controller/global.dart';
import 'package:qr_menu/screen/main.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => GlobalProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mechu Coffee Menu',
      theme: ThemeData(
        textTheme: GoogleFonts.ptSerifTextTheme().copyWith(
          displayLarge: GoogleFonts.ptSerif(fontWeight: FontWeight.w700),
          headlineLarge: GoogleFonts.ptSerif(fontWeight: FontWeight.w600),
          bodyLarge: GoogleFonts.ptSerif(fontWeight: FontWeight.w400),
        ),
      ),
      home: MenuPage(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
