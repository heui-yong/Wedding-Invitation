import 'dart:js_util';
import 'package:js/js.dart';
import 'package:js/js_util.dart';

/// JavaScript 함수 호출을 위한 외부 함수 선언
@JS('shareKakao')
external void _shareKakao(
    String title, String description, String imageUrl, String linkUrl);

/// 카카오톡 공유 기능을 제공하는 서비스 클래스
class KakaoShareService {
  /// 카카오톡으로 웨딩 초대장을 공유합니다.
  static void shareWeddingInvitation({
    required String title,
    required String description,
    required String imageUrl,
    required String linkUrl,
  }) {
    // JavaScript 함수 호출
    _shareKakao(title, description, imageUrl, linkUrl);
  }

  /// 현재 URL에 기본 정보로 카카오톡 공유하기
  static void shareDefault() {
    final currentUrl = Uri.base.toString();
    shareWeddingInvitation(
      title: '웨딩 초대장',
      description: '저희의 결혼식에 초대합니다',
      imageUrl:
          '${Uri.base.origin}/Wedding-Invitation/assets/images/main_image.jpg',
      linkUrl: currentUrl,
    );
  }
}
