import 'package:adminapp/controllers/home_controller.dart';
import 'package:adminapp/controllers/order_controller.dart';
import 'package:adminapp/controllers/product_controller.dart';
import 'package:adminapp/provider/global_request.dart';
import 'package:adminapp/resources/global_colors.dart';
import 'package:adminapp/resources/global_scaffold.dart';
import 'package:adminapp/views/home/home.dart';
import 'package:adminapp/views/order/order_index.dart';
import 'package:adminapp/views/product/product_index.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() async {
  GetIt getIt = GetIt.I;
  getIt.registerLazySingleton<GlobalProvider>(() => GlobalProvider());
  getIt.registerLazySingleton<HomeController>(() => HomeController());
  getIt.registerLazySingleton<OrderController>(() => OrderController());
  getIt.registerLazySingleton<ProductController>(() => ProductController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    return MaterialApp(
        builder: (context, child) => GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: ScaffoldMessenger(
                key: GlobalScaffold.instance.scaffoldMessengerKey,
                child: child!)),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'Montserrat',
            primaryColor: GlobalColors.maroon,
            scaffoldBackgroundColor: GlobalColors.white,
            appBarTheme:
                const AppBarTheme(backgroundColor: GlobalColors.maroon),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                minimumSize: const Size(152, 56),
                shape: const StadiumBorder(),
                backgroundColor: GlobalColors.maroon,
                padding: const EdgeInsets.all(16),
              ),
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: GlobalColors.maroon),
            primarySwatch: Colors.blue,
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              alignLabelWithHint: true,
            )),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/products': (context) => const ProductScreen(),
          '/orders': (context) => const OrderScreen(),
        });
  }
}
