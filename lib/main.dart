import 'package:adminapp/resources/global_colors.dart';
import 'package:adminapp/views/home/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        builder: (context, child) => ScaffoldMessenger(child: child!),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primaryColor: GlobalColors.maroon,
          scaffoldBackgroundColor: GlobalColors.white,
          appBarTheme: const AppBarTheme(backgroundColor: GlobalColors.maroon),
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
        });
  }
}
