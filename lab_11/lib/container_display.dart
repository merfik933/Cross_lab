import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'container_model.dart';

class SlidersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final containerModel = Provider.of<ContainerModel>(context);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SliderRow(
            label: 'Width',
            value: containerModel.width,
            min: 50,
            max: 300,
            onChanged: (value) => containerModel.setWidth(value),
          ),
          SliderRow(
            label: 'Height',
            value: containerModel.height,
            min: 50,
            max: 300,
            onChanged: (value) => containerModel.setHeight(value),
          ),
          SliderRow(
            label: 'Border Radius',
            value: containerModel.borderRadius,
            min: 0,
            max: 150,
            onChanged: (value) => containerModel.setBorderRadius(value),
          ),
        ],
      ),
    );
  }
}

class SliderRow extends StatelessWidget {
  final String label;
  final double value;
  final double min;
  final double max;
  final ValueChanged<double> onChanged;

  SliderRow({
    required this.label,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Expanded(
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: 50,
            label: value.toStringAsFixed(1),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
