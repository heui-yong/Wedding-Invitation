import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'dart:js' as js;

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
                    const Divider(
                      height: 0.5,
                    ),
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
      padding: const EdgeInsets.symmetric(vertical: 6),
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
            onPressed: () {
              if (_isProcessingCall) return; // 이미 처리 중이면 중단

              final phoneNumber = getPhoneNumber(title);
              if (phoneNumber.isEmpty) return;

              _makePhoneCall(phoneNumber);
            },
            icon: Icon(callIcon, color: textColor, size: 20),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {
              if (_isProcessingSms) return; // 이미 처리 중이면 중단

              final phoneNumber = getPhoneNumber(title);
              if (phoneNumber.isEmpty) return;

              _sendSMS(phoneNumber);
            },
            icon: Icon(emailIcon, color: textColor, size: 20),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }

  // 전화 걸기 기능을 처리하는 메서드
  void _makePhoneCall(String phoneNumber) async {
    // 이미 처리 중이면 중단
    if (_isProcessingCall) return;
    _isProcessingCall = true;

    // 1초 후 플래그 리셋 (무한 루프 방지)
    Future.delayed(const Duration(seconds: 1), () {
      _isProcessingCall = false;
    });

    // 사용자 환경 확인
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    final bool isKakao =
        userAgent.contains('kakaotalk') || userAgent.contains('kakao');
    final bool isIOS = userAgent.contains('iphone') ||
        userAgent.contains('ipad') ||
        userAgent.contains('ipod');
    final bool isAndroid = userAgent.contains('android');

    if (isKakao) {
      // 카카오톡 내부 브라우저용 JavaScript 함수 호출 (단순 방식으로)
      js.context.callMethod('callPhoneNumber', [phoneNumber]);
      return;
    }

    // 기기별 분기 처리
    try {
      final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

      if (isIOS) {
        // iOS는 location.href 방식이 더 안정적
        html.window.location.href = 'tel:$phoneNumber';
      } else if (isAndroid) {
        // 안드로이드는 url_launcher 사용
        if (await canLaunchUrl(phoneUri)) {
          await launchUrl(phoneUri, mode: LaunchMode.externalApplication);
        } else {
          html.window.location.href = 'tel:$phoneNumber';
        }
      } else {
        // 기타 환경
        html.window.location.href = 'tel:$phoneNumber';
      }
    } catch (e) {
      // 오류 시 가장 단순한 방법 시도
      html.window.location.href = 'tel:$phoneNumber';
    }
  }

  // 문자 보내기 기능을 처리하는 메서드
  void _sendSMS(String phoneNumber) async {
    // 이미 처리 중이면 중단
    if (_isProcessingSms) return;
    _isProcessingSms = true;

    // 1초 후 플래그 리셋 (무한 루프 방지)
    Future.delayed(const Duration(seconds: 1), () {
      _isProcessingSms = false;
    });

    // 사용자 환경 확인
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    final bool isKakao =
        userAgent.contains('kakaotalk') || userAgent.contains('kakao');
    final bool isIOS = userAgent.contains('iphone') ||
        userAgent.contains('ipad') ||
        userAgent.contains('ipod');
    final bool isAndroid = userAgent.contains('android');

    if (isKakao) {
      // 카카오톡 내부 브라우저용 JavaScript 함수 호출 (단순 방식으로)
      js.context.callMethod('sendSMS', [phoneNumber]);
      return;
    }

    // 기기별 분기 처리
    try {
      final Uri smsUri = Uri(scheme: 'sms', path: phoneNumber);

      if (isIOS) {
        // iOS는 location.href 방식이 더 안정적
        html.window.location.href = 'sms:$phoneNumber';
      } else if (isAndroid) {
        // 안드로이드는 url_launcher 사용
        if (await canLaunchUrl(smsUri)) {
          await launchUrl(smsUri, mode: LaunchMode.externalApplication);
        } else {
          html.window.location.href = 'sms:$phoneNumber';
        }
      } else {
        // 기타 환경
        html.window.location.href = 'sms:$phoneNumber';
      }
    } catch (e) {
      // 오류 시 가장 단순한 방법 시도
      html.window.location.href = 'sms:$phoneNumber';
    }
  }

  // 해당 인물의 전화번호를 반환하는 helper 메서드
  String getPhoneNumber(String title) {
    switch (title) {
      case "신랑":
        return "01012345678"; // 실제 신랑 전화번호로 변경해주세요
      case "신랑 아버지":
        return "01023456789"; // 실제 신랑 아버지 전화번호로 변경해주세요
      case "신랑 어머니":
        return "01034567890"; // 실제 신랑 어머니 전화번호로 변경해주세요
      case "신부":
        return "01045678901"; // 실제 신부 전화번호로 변경해주세요
      case "신부 아버지":
        return "01056789012"; // 실제 신부 아버지 전화번호로 변경해주세요
      case "신부 어머니":
        return "01067890123"; // 실제 신부 어머니 전화번호로 변경해주세요
      default:
        return "";
    }
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
