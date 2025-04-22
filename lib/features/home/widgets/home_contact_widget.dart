import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';

class HomeContactWidget extends StatefulWidget {
  const HomeContactWidget({super.key});

  @override
  State<HomeContactWidget> createState() => _HomeContactWidgetState();
}

class _HomeContactWidgetState extends State<HomeContactWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            AppImagePath.gallery14Path,
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
                      color: AppColor.color_5A5555.withOpacity(0.5),
                      size: 20),
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
          height: 12,
        ),
      ],
    );
  }

  void _showContactDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 300,
          color: AppColor.color_ffffff,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                color: AppColor.color_FBF5EE,
                padding: EdgeInsets.symmetric(vertical: 14),
                child: const Column(
                  children: [
                    Text(
                      "CONTACT",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "연락하기",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildContactRow("신랑", "이희용", Icons.call, Icons.email),
                    _buildContactRow("신랑 아버지", "이규동", Icons.call, Icons.email),
                    _buildContactRow("신랑 어머니", "윤선이", Icons.call, Icons.email),
                    const Divider(height: 0.5,),
                    _buildContactRow("신부", "백정윤", Icons.call, Icons.email,
                        textColor: AppColor.color_C87878),
                    _buildContactRow("신부 아버지", "백상일", Icons.call, Icons.email,
                        textColor: AppColor.color_C87878),
                    _buildContactRow("신부 어머니", "홍길동", Icons.call, Icons.email,
                        textColor: AppColor.color_C87878),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactRow(
      String title, String name, IconData callIcon, IconData emailIcon,
      {Color textColor = AppColor.color_5A82A0}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(callIcon, color: textColor, size: 20),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {},
            icon: Icon(emailIcon, color: textColor, size: 20),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
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
