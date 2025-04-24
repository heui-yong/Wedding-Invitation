import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/features/features.dart';

class HomeGalleryWidget extends ConsumerStatefulWidget {
  final List<GalleryModel> galleryImageList1to2;
  final List<GalleryModel> galleryImageList1to1;

  const HomeGalleryWidget(
      {super.key,
      required this.galleryImageList1to2,
      required this.galleryImageList1to1});

  @override
  ConsumerState<HomeGalleryWidget> createState() => _HomeGalleryWidgetState();
}

class _HomeGalleryWidgetState extends ConsumerState<HomeGalleryWidget>
    with TickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _heightAnimation;

  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(viewportFraction: 0.2, initialPage: _currentIndex);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _heightAnimation = Tween<double>(begin: 600, end: 1500).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
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
        Stack(
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Container(
                  height: _isExpanded
                      ? _heightAnimation.value
                      : 600, // Show partial content when collapsed
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                  ),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: child,
                  ),
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...List.generate(rowCount, (rowIdx) {
                    final start = rowIdx * 3;
                    final chunk = widget.galleryImageList1to2.sublist(
                        start,
                        start + 3 > widget.galleryImageList1to2.length
                            ? widget.galleryImageList1to2.length
                            : start + 3);
                    return _buildGalleryRow(chunk, largeLeft: rowIdx.isEven);
                  }),
                  ...List.generate(rowCount1, (rowIdx) {
                    final start = rowIdx * 4;
                    final chunk = widget.galleryImageList1to1.sublist(
                        start,
                        start + 4 > widget.galleryImageList1to1.length
                            ? widget.galleryImageList1to1.length
                            : start + 4);
                    return _buildGalleryRow2(chunk, largeLeft: rowIdx.isEven);
                  }),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 20.0),
                decoration: BoxDecoration(
                  gradient: _isExpanded ? null : LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(0.8),
                      Colors.white,
                    ],
                  )
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                        if (_isExpanded) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }
                      });
                    },
                    child: Container(
                      width: 160,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColor.color_5A5555.withOpacity(0.5),
                            width: 1),
                      ),
                      child: Center(
                        child: Text(
                          _isExpanded ? "접기" : "더 보기",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColor.color_5A5555.withOpacity(0.9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                            child: _buildImage(
                                imgs.length > 1 ? imgs[1] : imgs[0],
                                alignment: const Alignment(0, -0.5))),
                        Expanded(
                            child: _buildImage(
                                imgs.length > 2 ? imgs[2] : imgs[0],
                                alignment: const Alignment(0, -0.3))),
                      ],
                    )),
              ]
            : [
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                            child: _buildImage(imgs[0],
                                alignment: const Alignment(0, 0))),
                        Expanded(
                            child: _buildImage(
                                imgs.length > 1 ? imgs[1] : imgs[0],
                                alignment: const Alignment(0, -0.9))),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: _buildImage(imgs.length > 2 ? imgs[2] : imgs[0])),
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
                  child:
                      _buildImage(imgs[2], alignment: const Alignment(0, -0.7)),
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

  Widget _buildImage(GalleryModel model,
      {Alignment alignment = Alignment.center}) {
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
