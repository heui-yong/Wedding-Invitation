import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/features/features.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.color_ffffff,
      body: Align(
        alignment: Alignment.topCenter,
        child: HomeTopWidget(),
        // 카카오톡 공유 버튼 추가
        // Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: KakaoShareButton(
        //     label: '초대장 공유하기',
        //     title: '우리의 결혼식에 초대합니다',
        //     description: '소중한 분들을 초대합니다. 참석해 주시면 감사하겠습니다.',
        //     imageUrl:
        //         '${Uri.base.origin}/Wedding-Invitation/assets/images/main_image.jpg',
        //     linkUrl: Uri.base.toString(),
        //   ),
        // ),
      ),
    );
  }
}