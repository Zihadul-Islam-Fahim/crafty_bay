import 'package:crafty_bay/presentation/state_holders/brand_list_controller.dart';
import 'package:crafty_bay/presentation/ui/widgets/brand_item_widget.dart';
import 'package:crafty_bay/presentation/ui/widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandsScreen extends StatefulWidget {
  const BrandsScreen({super.key});

  @override
  State<BrandsScreen> createState() => _BrandsScreenState();
}

class _BrandsScreenState extends State<BrandsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 20,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        title: const Text(
          'Brands',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<BrandListController>().getBrandList();
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GetBuilder<BrandListController>(builder: (controller) {
            return Visibility(
              visible: controller.inProgress == false,
              replacement: const CenterCircularProgressIndicator(),
              child: GridView.builder(
                itemCount: controller.brandListModel.data!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.64,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return BrandItem(
                    brand: controller.brandListModel.data![index],
                  );
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
