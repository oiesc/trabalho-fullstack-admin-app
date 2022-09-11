import 'package:adminapp/controllers/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  final orderController = GetIt.I.get<OrderController>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('teste')),
    );
  }
}
