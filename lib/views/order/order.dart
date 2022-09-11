import 'package:adminapp/resources/global_colors.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Orders')),
      body: Scrollbar(
        thumbVisibility: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) => Column(
            children: [
              OrderWidget(
                id: "K455s",
                index: index,
                customerName: "João Silva",
                status: "Accepted",
                statusColor: GlobalColors.green,
                productsName: "Burger 1, Burger 2",
                totalPrice: "R\$ 20.99",
              ),
            ],
          ),
        ),
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
        Container(
          margin: EdgeInsets.only(
              left: 8, right: 8, bottom: 8, top: index > 0 ? 8 : 16),
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
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
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () => print("teste $index"),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.more_vert_outlined,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
