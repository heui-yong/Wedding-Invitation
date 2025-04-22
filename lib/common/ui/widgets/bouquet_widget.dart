import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';

class BouquetWidget extends StatelessWidget {
  const BouquetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImagePath.bouquetPath,
      width: 70,
      height: 70,
    );
  }
}
