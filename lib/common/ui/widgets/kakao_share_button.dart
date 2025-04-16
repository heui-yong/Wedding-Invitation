import 'package:flutter/material.dart';
import 'package:frontend/common/services/kakao_share_service.dart';

/// 카카오톡 공유 버튼 위젯
class KakaoShareButton extends StatelessWidget {
  /// 커스텀 제목
  final String? title;

  /// 커스텀 설명
  final String? description;

  /// 커스텀 이미지 URL
  final String? imageUrl;

  /// 커스텀 링크 URL
  final String? linkUrl;

  /// 버튼 크기
  final double size;

  /// 버튼 라벨
  final String label;

  /// 버튼 스타일
  final ButtonStyle? style;

  const KakaoShareButton({
    Key? key,
    this.title,
    this.description,
    this.imageUrl,
    this.linkUrl,
    this.size = 48.0,
    this.label = '카카오톡 공유하기',
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        if (title != null &&
            description != null &&
            imageUrl != null &&
            linkUrl != null) {
          // 커스텀 정보로 공유
          KakaoShareService.shareWeddingInvitation(
            title: title!,
            description: description!,
            imageUrl: imageUrl!,
            linkUrl: linkUrl!,
          );
        } else {
          // 기본 정보로 공유
          KakaoShareService.shareDefault();
        }
      },
      label: Text(label),
      style: style ??
          ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFFEE500), // 카카오 노란색
            foregroundColor: Colors.black, // 텍스트 색상
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
    );
  }
}
