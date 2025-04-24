import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.titleEn,
    required this.titleKo,
  });

  final String titleEn;
  final String titleKo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(titleEn,
            style: TextStyle(fontSize: 11, color: AppColor.color_9E9E9E)),
        const SizedBox(height: 4),
        Text(titleKo,
            style: TextStyle(fontSize: 18, color: AppColor.color_9E9E9E)),
        const SizedBox(height: 12),
      ],
    );
  }
}