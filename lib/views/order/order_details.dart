import 'package:adminapp/controllers/order_controller.dart';
import 'package:adminapp/models/order_model.dart';
import 'package:adminapp/resources/global_colors.dart';
import 'package:adminapp/resources/global_functions.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key, required this.order});
  final OrderModel order;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final orderController = GetIt.I.get<OrderController>();
  late final OrderModel? order;

  @override
  void initState() {
    super.initState();
    order = widget.order;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Order #${order?.id}")),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Text(
                "ORDER #${order?.id}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: Text.rich(
                TextSpan(
                  text: "Costumer name: ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: order?.usuario,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 16, right: 16),
              child: Text.rich(
                TextSpan(
                  text: "Status: ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: order?.status,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: GlobalFunctions().getStatusColor(order?.status),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 4, left: 16, right: 16),
              child: Text(
                "Products: ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 4, left: 8, right: 8),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: GlobalColors.green),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: order?.products?.length,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index > 0)
                      const Divider(
                        color: GlobalColors.silver,
                      ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 4, left: 4, right: 4),
                      child: Text.rich(
                        TextSpan(
                          text: "Product name: ",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: order?.products?[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 4, left: 4, right: 4),
                      child: Text.rich(
                        TextSpan(
                          text: "Product price: ",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: GlobalFunctions()
                                  .formatReal(order?.products?[index].price),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text.rich(
                        TextSpan(
                          text: "Product quantity: ",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: "${order?.products?[index].quantity}",
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Text.rich(
                TextSpan(
                  text: "Total price: ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: GlobalFunctions().formatReal(order?.price),
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
