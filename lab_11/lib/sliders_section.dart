import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'container_model.dart';

class ContainerDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final containerModel = Provider.of<ContainerModel>(context);

    return Center(
      child: Container(
        width: containerModel.width,
        height: containerModel.height,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(containerModel.borderRadius),
          ),
        ),
      ),
    );
  }
}
