import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class SizeSelector extends StatefulWidget {
  const SizeSelector({super.key, required this.sizes, required this.onChange});

  final List<String> sizes;
  final Function(String) onChange;

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  final ValueNotifier<String> _selectedSize = ValueNotifier("3");

  @override
  void initState() {
    super.initState();
    _selectedSize.value = widget.sizes.first;
    widget.onChange(_selectedSize.value);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedSize,
      builder: (context, value, _) {
        return Row(
          children: widget.sizes
              .map(
                (c) => Container(
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(30),
                      color: _selectedSize.value == c
                          ? AppColors.primaryColor
                          : Colors.white),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      _selectedSize.value = c;
                      widget.onChange(c);
                    },
                    child: Center(
                      child: Text(
                        c,
                        style: TextStyle(
                            color: _selectedSize.value == c
                                ? Colors.white
                                : AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
