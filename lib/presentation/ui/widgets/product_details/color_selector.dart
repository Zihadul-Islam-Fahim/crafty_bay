import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({
    super.key,
    required this.productColors,
    required this.onChange,
  });

  final List<Color> productColors;
  final Function(Color) onChange;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  final ValueNotifier<Color> _selectedColor = ValueNotifier(Colors.yellow);

  @override
  void initState() {
    super.initState();
    _selectedColor.value = widget.productColors.first;
    widget.onChange(_selectedColor.value);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.productColors
          .map(
            (c) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: ValueListenableBuilder(
                valueListenable: _selectedColor,
                builder: (context, value, _) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      _selectedColor.value = c;
                      widget.onChange(c);
                    },
                    child: CircleAvatar(
                      backgroundColor: c,
                      child: _selectedColor.value == c
                          ? const Icon(
                              Icons.check,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
          )
          .toList(),
    );
  }
}
