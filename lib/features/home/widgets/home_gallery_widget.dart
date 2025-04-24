import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/features/features.dart';

class HomeGalleryWidget extends ConsumerStatefulWidget {
  final List<GalleryModel> galleryImageList1to2;
  final List<GalleryModel> galleryImageList1to1;

  const HomeGalleryWidget({super.key, required this.galleryImageList1to2, required this.galleryImageList1to1});

  @override
  ConsumerState<HomeGalleryWidget> createState() => _HomeGalleryWidgetState();
}

class _HomeGalleryWidgetState extends ConsumerState<HomeGalleryWidget> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.2, initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final rowCount = (widget.galleryImageList1to2.length / 3).ceil();
    final rowCount1 = (widget.galleryImageList1to1.length / 4).ceil();

    return Column(
      children: [
        const SizedBox(height: 72),
        Text(AppString.homeGalleryTitleEn,
            style: TextStyle(fontSize: 11, color: AppColor.color_9E9E9E)),
        const SizedBox(height: 4),
        Text(AppString.homeGalleryTitle,
            style: TextStyle(fontSize: 18, color: AppColor.color_9E9E9E)),
        const SizedBox(height: 12),
        // 3개씩 묶어서 반복 생성
        ...List.generate(rowCount, (rowIdx) {
          final start = rowIdx * 3;
          final chunk = widget.galleryImageList1to2.sublist(start, start + 3 > widget.galleryImageList1to2.length ? widget.galleryImageList1to2.length : start + 3);
          return _buildGalleryRow(chunk, largeLeft: rowIdx.isEven);
        }),
        ...List.generate(rowCount1, (rowIdx) {
          final start = rowIdx * 4;
          final chunk = widget.galleryImageList1to1.sublist(start, start + 4 > widget.galleryImageList1to1.length ? widget.galleryImageList1to1.length : start + 4);
          return _buildGalleryRow2(chunk, largeLeft: rowIdx.isEven);
        }),
      ],
    );
  }

  Widget _buildGalleryRow(List<GalleryModel> imgs, {required bool largeLeft}) {
    return Container(
      height: 240,
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Row(
        children: largeLeft
            ? [
          Expanded(flex: 1, child: _buildImage(imgs[0])),
          Expanded(flex: 1, child: Column(
            children: [
              Expanded(child: _buildImage(imgs.length > 1 ? imgs[1] : imgs[0], alignment: const Alignment(0, -0.5))),
              Expanded(child: _buildImage(imgs.length > 2 ? imgs[2] : imgs[0], alignment: const Alignment(0, -0.3))),
            ],
          )),
        ]
            : [
          Expanded(flex: 1, child: Column(
            children: [
              Expanded(child: _buildImage(imgs[0], alignment: const Alignment(0, 0))),
              Expanded(child: _buildImage(imgs.length > 1 ? imgs[1] : imgs[0], alignment: const Alignment(0, -0.9))),
            ],
          )),
          Expanded(flex: 1, child: _buildImage(imgs.length > 2 ? imgs[2] : imgs[0])),
        ],
      ),
    );
  }

  Widget _buildGalleryRow2(List<GalleryModel> imgs, {required bool largeLeft}) {
    return Container(
      height: 360,
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildImage(imgs[0], alignment: const Alignment(0, 0)),
                ),
                Expanded(
                  flex: 1,
                  child: _buildImage(imgs[1], alignment: const Alignment(0, 0)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: _buildImage(imgs[2], alignment: const Alignment(0, -0.7)),
                ),
                Expanded(
                  flex: 2,
                  child: _buildImage(imgs[3], alignment: const Alignment(0, 0)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildImage(GalleryModel model, {Alignment alignment = Alignment.center}) {
    final List<GalleryModel> combinedList = [
      ...widget.galleryImageList1to2,
      ...widget.galleryImageList1to1,
    ];

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return GalleryDialog(
              galleryImageList: combinedList,
              initialIndex: model.id,
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
            image: AssetImage(model.assetPath),
            fit: BoxFit.cover,
            alignment: alignment,
          ),
        ),
      ),
    );
  }
}
