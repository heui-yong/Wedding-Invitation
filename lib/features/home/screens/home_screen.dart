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
  late List<GalleryModel> galleryImageList;

  @override
  Widget build(BuildContext context) {
    galleryImageList = ref.watch(galleryImageListProvider);

    return Scaffold(
      backgroundColor: AppColor.color_ffffff,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HomeTopWidget(),
            HomeGalleryWidget(galleryImageList: galleryImageList)
          ],
        ),
      ),
    );
  }
}
