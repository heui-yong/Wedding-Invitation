import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';

class HomeMapWidget extends StatelessWidget {
  const HomeMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
            titleEn: AppString.homeMapTitleEn,
            titleKo: AppString.homeMapTitleKo),
        SizedBox(
          height: 12,
        ),
        Text(AppString.marryPlace,
            style: TextStyle(fontSize: 16, color: AppColor.color_000000)),
        SizedBox(
          height: 8,
        ),
        Text("부산 해운대구 센텀1로 17",
            style: TextStyle(fontSize: 14, color: AppColor.color_9E9E9E)),
      ],
    );
  }
}
