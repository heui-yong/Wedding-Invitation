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
  late List<GalleryModel> galleryImageList1to2;
  late List<GalleryModel> galleryImageList1to1;

  @override
  Widget build(BuildContext context) {
    galleryImageList1to2 = ref.watch(galleryImageListProvider1to2);
    galleryImageList1to1 = ref.watch(galleryImageListProvider1to1);

    return Scaffold(
      backgroundColor: AppColor.color_FBF5EE,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HomeTopWidget(),
                const BouquetWidget(),
                const InvitationMessageWidget(),
                const HomeContactWidget(),
                HomeCalendarWidget(),
                HomeGalleryWidget(galleryImageList1to2: galleryImageList1to2, galleryImageList1to1: galleryImageList1to1,)
                // HomeGalleryWidget3(galleryImageList1to2: galleryImageList1to2, galleryImageList1to1: galleryImageList1to1,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
