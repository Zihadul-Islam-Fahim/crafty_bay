import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Number of list items
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: ListTile(
            leading: Container(
              height: 150,
              width: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            title: Container(
              height: 15,
              width: MediaQuery.of(context).size.width * 0.3,
              color: Colors.white,
            ),
            subtitle: Container(
              height: 10,
              width: MediaQuery.of(context).size.width * 0.5,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
