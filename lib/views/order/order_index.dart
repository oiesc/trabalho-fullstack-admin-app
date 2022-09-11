import 'package:adminapp/controllers/home_controller.dart';
import 'package:adminapp/controllers/order_controller.dart';
import 'package:adminapp/resources/global_colors.dart';
import 'package:adminapp/resources/global_functions.dart';
import 'package:adminapp/resources/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final orderController = GetIt.I.get<OrderController>();
  final homeController = GetIt.I.get<HomeController>();
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    orderController.changeListValue(1);
  }

  @override
  void dispose() {
    orderController.dispose();
    homeController.changeListValue(1);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Orders')),
        body: Observer(builder: (_) {
          return Container(
            child: orderController.isLoading
                ? const LoadingWidget()
                : Column(
                    children: [
                      Container(
                        color: GlobalColors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: DropdownButton(
                            iconEnabledColor: GlobalColors.white,
                            iconDisabledColor: GlobalColors.white,
                            dropdownColor: GlobalColors.green,
                            style: const TextStyle(
                                color: GlobalColors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            isExpanded: true,
                            borderRadius: BorderRadius.circular(8),
                            alignment: Alignment.centerLeft,
                            value: orderController.listValue,
                            items: const [
                              DropdownMenuItem(value: 1, child: Text('All')),
                              DropdownMenuItem(
                                  value: 2, child: Text('Pending')),
                              DropdownMenuItem(
                                  value: 3, child: Text('In progress')),
                              DropdownMenuItem(
                                  value: 4, child: Text('Canceled')),
                              DropdownMenuItem(
                                  value: 5, child: Text('Completed')),
                            ],
                            onChanged: (value) =>
                                orderController.changeListValue(value)),
                      ),
                      Observer(builder: (_) {
                        return Expanded(
                          child: orderController.orders!.isEmpty
                              ? const EmptyWidget()
                              : Scrollbar(
                                  controller: scrollController,
                                  thumbVisibility: true,
                                  child: SingleChildScrollView(
                                    controller: scrollController,
                                    child: OrdersWidget(
                                        orderController: orderController),
                                  )),
                        );
                      }),
                    ],
                  ),
          );
        }));
  }
}

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({
    Key? key,
    required this.orderController,
  }) : super(key: key);

  final OrderController orderController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: orderController.orders?.length ?? 0,
      itemBuilder: (context, index) => OrderWidget(
        id: "${orderController.orders?[index].id}",
        index: index,
        customerName: "${orderController.orders?[index].usuario}",
        status: "${orderController.orders?[index].status}",
        statusColor: GlobalFunctions()
            .getStatusColor(orderController.orders?[index].status),
        productsName: GlobalFunctions()
            .getProductsName(orderController.orders?[index].productsName),
        totalPrice:
            GlobalFunctions().formatReal(orderController.orders?[index].price),
      ),
    );
  }
}

class OrderWidget extends StatelessWidget {
  const OrderWidget({
    Key? key,
    required this.index,
    required this.id,
    required this.customerName,
    required this.status,
    required this.statusColor,
    required this.productsName,
    required this.totalPrice,
  }) : super(key: key);

  final int index;
  final String id;
  final String customerName;
  final String status;
  final Color statusColor;
  final String productsName;
  final String totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (index > 0)
          const Divider(
            color: GlobalColors.silver,
          ),
        InkWell(
          onTap: () => print("teste $index"),
          child: Container(
            margin: EdgeInsets.only(
                left: 16, right: 16, bottom: 8, top: index > 0 ? 8 : 16),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ORDER #$id",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text.rich(
                            TextSpan(
                              text: "Costumer name: ",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: customerName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text.rich(
                            TextSpan(
                              text: "Status: ",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: status,
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: statusColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Text.rich(
                            TextSpan(
                              text: "Products: ",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: productsName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            text: "Total price: ",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                text: totalPrice,
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                      ]),
                ),
                const Icon(
                  Icons.more_vert_outlined,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
