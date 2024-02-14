import 'package:crafty_bay/presentation/state_holders/bottom_nav_controller.dart';
import 'package:crafty_bay/presentation/state_holders/category_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/category_item_widget.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Get.find<BottomNavController>().changeIndex(0);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 15,
          leading: IconButton(
            onPressed: () {
              Get.find<BottomNavController>().changeIndex(0);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            ),
          ),
          title: const Text(
            'Category',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryListController>().getCategoryList();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GetBuilder<CategoryListController>(builder: (controller) {
              return Visibility(
                visible: controller.inProgress == false,
                replacement: const CenterCircularProgressIndicator(),
                child: GridView.builder(
                  itemCount: controller.categoryListModel.categoryList!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.64,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      category:
                          controller.categoryListModel.categoryList![index],
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
