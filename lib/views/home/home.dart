import 'package:adminapp/controllers/home_controller.dart';
import 'package:adminapp/resources/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController = GetIt.I.get<HomeController>();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 100, title: const AppBarWidget()),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Scrollbar(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      IconWidget(type: "products"),
                      IconWidget(type: "orders")
                    ],
                  ),
                  Observer(builder: (_) {
                    return DropdownButton(
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(8),
                        alignment: Alignment.centerLeft,
                        value: homeController.listValue,
                        items: const [
                          DropdownMenuItem(
                              value: 1,
                              child: Text('Orders awaiting to be accepted')),
                          DropdownMenuItem(
                              value: 2, child: Text('Orders in progress')),
                        ],
                        onChanged: (value) =>
                            homeController.changeListValue(value));
                  }),
                ],
              ),
            ),
          ),
        ));
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  final String type;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
          left: type == "products" ? 0 : 8,
          bottom: 16,
          right: type == "products" ? 8 : 0,
        ),
        height: 50,
        decoration: BoxDecoration(
          color: type == "products" ? GlobalColors.orange : GlobalColors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => Navigator.pushNamed(
              context, type == "products" ? "/products" : "/orders"),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: 40,
                height: 40,
                child: Icon(
                  type == "products"
                      ? Icons.lunch_dining_rounded
                      : Icons.format_list_numbered_rounded,
                  color: GlobalColors.white,
                  size: 30,
                ),
              ),
            ),
            Expanded(
                child: Text(
              type == "products" ? 'Products' : 'Orders',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: GlobalColors.white,
              ),
            )),
            const SizedBox(
              width: 40,
              height: 40,
              child: Icon(
                Icons.expand_more,
                color: GlobalColors.white,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: GlobalColors.white,
            borderRadius: BorderRadius.circular(50),
            image: const DecorationImage(
              image: AssetImage("assets/images/logo.png"),
            ),
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Burger Place',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                'Management App',
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ))
      ],
    );
  }
}
