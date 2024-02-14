import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SectionTitle({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            fontFamily: 'Poppins',
          ),
        ),
        TextButton(
          onPressed: onTap,
          child: const Text(
            'See all',
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
          ),
        )
      ],
    );
  }
}
