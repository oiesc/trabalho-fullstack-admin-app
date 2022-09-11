import 'package:adminapp/controllers/home_controller.dart';
import 'package:adminapp/resources/global_colors.dart';
import 'package:adminapp/views/home/home.dart';
import 'package:adminapp/views/order/order.dart';
import 'package:adminapp/views/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  GetIt getIt = GetIt.I;
  getIt.registerLazySingleton<HomeController>(() => HomeController());
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
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(152, 56),
              shape: const StadiumBorder(),
              backgroundColor: GlobalColors.maroon,
              padding: const EdgeInsets.all(16),
            ),
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: GlobalColors.maroon),
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/products': (context) => const ProductScreen(),
          '/orders': (context) => const OrderScreen(),
        });
  }
}
