import 'package:adminapp/controllers/product_controller.dart';
import 'package:adminapp/models/product_model.dart';
import 'package:adminapp/resources/global_colors.dart';
import 'package:adminapp/resources/global_functions.dart';
import 'package:adminapp/resources/global_widgets.dart';
import 'package:adminapp/views/product/category_index.dart';
import 'package:adminapp/views/product/product_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final productController = GetIt.I.get<ProductController>();

  @override
  void initState() {
    super.initState();
    productController.getCategories();
    productController.getProducts();
  }

  @override
  void dispose() {
    productController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CategoryScreen(),
                )),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(
                Icons.category,
              ),
            ),
          ),
        ],
      ),
      body: Observer(builder: (_) {
        return Container(
          child: productController.isLoading
              ? const LoadingWidget()
              : Column(
                  children: [
                    Container(
                      color: GlobalColors.orange,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButton(
                          underline: Container(),
                          iconEnabledColor: GlobalColors.white,
                          iconDisabledColor: GlobalColors.white,
                          dropdownColor: GlobalColors.orange,
                          style: const TextStyle(
                              color: GlobalColors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(8),
                          alignment: Alignment.centerLeft,
                          value: productController.listValue,
                          items: productController.filter
                              .map(
                                (e) => DropdownMenuItem(
                                    value: e.id, child: Text(e.name!)),
                              )
                              .toList(),
                          onChanged: (value) =>
                              productController.changeListValue(value)),
                    ),
                    Expanded(
                      child: productController.products == null ||
                              productController.products!.isEmpty
                          ? const EmptyWidget()
                          : Scrollbar(
                              thumbVisibility: true,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    productController.products?.length ?? 0,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    ProductWidget(
                                      index: index,
                                      product:
                                          productController.products![index],
                                    ),
                                    if (index ==
                                        (productController.products!.length -
                                            1))
                                      const SizedBox(
                                        height: 80,
                                      )
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProductData(),
            )),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class ProductWidget extends StatelessWidget {
  const ProductWidget({
    Key? key,
    required this.index,
    required this.product,
  }) : super(key: key);

  final int index;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (index > 0)
          const Divider(
            color: GlobalColors.silver,
          ),
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductData(
                  product: product,
                ),
              )),
          child: Container(
            margin: EdgeInsets.only(
                left: 8, right: 8, bottom: 8, top: index > 0 ? 8 : 16),
            width: MediaQuery.of(context).size.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: GlobalColors.silver),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: product.photoLocation != null &&
                                product.photoLocation != ''
                            ? NetworkImage(product.photoLocation!)
                            : const AssetImage("assets/images/no-image.png")
                                as ImageProvider,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${product.name}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Text(
                              "${product.description}",
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: Text.rich(
                              TextSpan(
                                text: "Category: ",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                children: [
                                  TextSpan(
                                    text: "${product.category?.name}",
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
                              text: "Price: ",
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                  text: GlobalFunctions()
                                      .formatReal(product.price),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                  )),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.more_vert_outlined,
                    ),
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
