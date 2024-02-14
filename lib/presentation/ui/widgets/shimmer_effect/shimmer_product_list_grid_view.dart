import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProductListGridView extends StatelessWidget {
  const ShimmerProductListGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.83,
        mainAxisSpacing: 8,
      ),
      itemCount: 15, // Number of grid items
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            elevation: 3,
            child: Container(
              height: 115,
              width: 70,
              color: Colors.grey[300]!,
            ),
          ),
        );
      },
    );
  }
}
