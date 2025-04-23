import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/features/features.dart';

class HomeGalleryWidget2 extends ConsumerStatefulWidget {
  final List<GalleryModel> galleryImageList;

  const HomeGalleryWidget2({super.key, required this.galleryImageList});

  @override
  ConsumerState<HomeGalleryWidget2> createState() => _HomeGalleryWidget2State();
}

class _HomeGalleryWidget2State extends ConsumerState<HomeGalleryWidget2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 72,
        ),
        Text(
          AppString.homeGalleryTitleEn,
          style: TextStyle(fontSize: 11, color: AppColor.color_9E9E9E),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          AppString.homeGalleryTitle,
          style: TextStyle(fontSize: 18, color: AppColor.color_9E9E9E),
        ),
        const SizedBox(height: 12,),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3,
          ),
          itemCount: widget.galleryImageList.length,
          itemBuilder: (context, index) {
            var galleryImage = widget.galleryImageList[index];
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return GalleryDialog(
                      galleryImageList: widget.galleryImageList,
                      initialIndex: index,
                    );
                  },
                );
              },
              child: Container(
                color: AppColor.color_9E9E9E1.withOpacity(0.3),
                child: Image.asset(galleryImage.assetPath),
              ),
            );
          },
        ),
      ],
    );
  }
}