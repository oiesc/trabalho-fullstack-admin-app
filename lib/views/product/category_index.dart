import 'package:adminapp/controllers/product_controller.dart';
import 'package:adminapp/models/product_model.dart';
import 'package:adminapp/resources/global_colors.dart';
import 'package:adminapp/resources/global_widgets.dart';
import 'package:adminapp/views/product/category_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final productController = GetIt.I.get<ProductController>();

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
      appBar: AppBar(title: const Text("Categories")),
      body: Observer(builder: (_) {
        return Container(
            child: productController.isLoading
                ? const LoadingWidget()
                : Column(
                    children: [
                      Expanded(
                        child: productController.categories == null ||
                                productController.products!.isEmpty
                            ? const EmptyWidget()
                            : Scrollbar(
                                thumbVisibility: true,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      productController.categories?.length ?? 0,
                                  itemBuilder: (context, index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CategoryWidget(
                                          index: index,
                                          category: productController
                                              .categories![index]),
                                      if (index ==
                                          (productController
                                                  .categories!.length -
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
                  ));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CategoryData(),
            )),
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    Key? key,
    required this.index,
    required this.category,
  }) : super(key: key);

  final int index;
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (index > 0)
          const Divider(
            color: GlobalColors.silver,
          ),
        InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryData(
                  category: category,
                ),
              )),
          child: Container(
            padding: EdgeInsets.only(
                left: 16, right: 16, bottom: 8, top: index > 0 ? 8 : 16),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "Name: ",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        children: [
                          TextSpan(
                            text: category.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.more_vert_outlined,
                  ),
                ]),
          ),
        ),
      ],
    );
  }
}
