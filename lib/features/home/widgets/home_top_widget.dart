import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';

class HomeTopWidget extends StatelessWidget {
  const HomeTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        const Text(
          AppString.homeTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "Francisco",
              fontSize: 24,
              color: AppColor.color_9E9E9E),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              children: [
                Text(
                  AppString.groomNameEn,
                  style: TextStyle(
                      fontFamily: "Francisco",
                      fontSize: 14,
                      color: AppColor.color_9E9E9E),
                ),
                SizedBox(height: 4),
                Text(
                  AppString.groomNameKo,
                  style: TextStyle(fontSize: 14, color: AppColor.color_9E9E9E),
                )
              ],
            ),
            const SizedBox(width: 60),
            Container(
              width: 0.5,
              height: 20,
              color: AppColor.color_9E9E9E,
            ),
            const SizedBox(width: 60),
            const Column(
              children: [
                Text(
                  AppString.brideNameEn,
                  style: TextStyle(
                      fontFamily: "Francisco",
                      fontSize: 14,
                      color: AppColor.color_9E9E9E),
                ),
                SizedBox(height: 4),
                Text(
                  AppString.brideNameKo,
                  style: TextStyle(fontSize: 14, color: AppColor.color_9E9E9E),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 14,
        ),
        Image.asset(
          AppImagePath.homeTitlePath,
          width: MediaQuery.of(context).size.width * 0.6,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 14,
        ),
        const Text(
          AppString.marryDate,
          style: TextStyle(fontSize: 14, color: AppColor.color_9E9E9E),
        ),
        const Text(
          AppString.marryPlace,
          style: TextStyle(fontSize: 14, color: AppColor.color_9E9E9E),
        ),
        const SizedBox(height: 24)
      ],
    );
  }
}
