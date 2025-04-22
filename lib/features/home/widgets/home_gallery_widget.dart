import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/features/features.dart';

class HomeGalleryWidget extends ConsumerStatefulWidget {
  final List<GalleryModel> galleryImageList;

  const HomeGalleryWidget({super.key, required this.galleryImageList});

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
    return SizedBox(
      width: 350,
      child: Column(
        children: [
          Text(
            AppString.homeGallery,
            style: TextStyle(
                fontFamily: "Francisco",
                fontSize: 24,
                color: AppColor.color_9E9E9E),
          ),
          const SizedBox(height: 12),
          Column(
            children: [
              SizedBox(
                width: 350,
                height: 500,
                child: Image.asset(
                  widget.galleryImageList[_currentIndex].assetPath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 60,
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.horizontal,
                  padEnds: false,
                  itemCount: widget.galleryImageList.length,
                  pageSnapping: false,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        child: Image.asset(
                          widget.galleryImageList[index].assetPath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
