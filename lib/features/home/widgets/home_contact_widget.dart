import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/features/features.dart';

class HomeContactWidget extends StatefulWidget {
  const HomeContactWidget({super.key});

  @override
  State<HomeContactWidget> createState() => _HomeContactWidgetState();
}

class _HomeContactWidgetState extends State<HomeContactWidget> {
  // 전화 걸기 중복 호출 방지 플래그
  bool _isProcessingCall = false;
  bool _isProcessingSms = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            AppImagePath.gallery8Path,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        buildName("${AppString.groomFName} · ${AppString.groomMName}", "아들 ",
            AppString.groomName),
        buildName("${AppString.brideFName} · ${AppString.brideMName}", "  딸  ",
            AppString.brideName),
        const SizedBox(
          height: 12,
        ),
        Center(
          child: InkWell(
            onTap: () => _showContactDialog(context),
            child: Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: AppColor.color_5A5555.withOpacity(0.5), width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call,
                      color: AppColor.color_5A5555.withOpacity(0.5), size: 20),
                  SizedBox(width: 12),
                  Text(
                    AppString.contact,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColor.color_5A5555.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 72,
        ),
      ],
    );
  }

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ContactDialog()
    );
  }

  Row buildName(String text, String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyle(
              fontSize: 14,
              fontFamily: "MaruBuri",
              fontWeight: FontWeight.w700,
              color: AppColor.color_5A5555),
        ),
        Text(
          " 의 ",
          style: TextStyle(
              fontSize: 12,
              fontFamily: "MaruBuri",
              fontWeight: FontWeight.w300,
              color: AppColor.color_5A5555.withOpacity(0.9)),
        ),
        Text(
          text1,
          style: TextStyle(
              fontSize: 12,
              fontFamily: "MaruBuri",
              fontWeight: FontWeight.w300,
              color: AppColor.color_5A5555.withOpacity(0.9)),
        ),
        Text(
          text2,
          style: TextStyle(
              fontSize: 14,
              fontFamily: "MaruBuri",
              fontWeight: FontWeight.w700,
              color: AppColor.color_5A5555),
        )
      ],
    );
  }
}
