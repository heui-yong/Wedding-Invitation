import 'package:frontend/features/features.dart';
import 'package:flutter/material.dart';

class GalleryDialog extends StatefulWidget {
  final List<GalleryModel> galleryImageList;
  final int initialIndex;

  const GalleryDialog({
    Key? key,
    required this.galleryImageList,
    required this.initialIndex,
  }) : super(key: key);

  @override
  _GalleryDialogState createState() => _GalleryDialogState();
}

class _GalleryDialogState extends State<GalleryDialog> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.galleryImageList.length,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            itemBuilder: (context, i) {
              return Image.asset(
                widget.galleryImageList[i].assetPath,
                fit: BoxFit.contain,
              );
            },
          ),
          Positioned(
            left: 0,
            child: IconButton(
              icon: Icon(Icons.chevron_left, size: 32, color: Colors.white),
              onPressed: () {
                if (_currentIndex > 0) {
                  _pageController.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
            ),
          ),
          Positioned(
            right: 0,
            child: IconButton(
              icon: Icon(Icons.chevron_right, size: 32, color: Colors.white),
              onPressed: () {
                if (_currentIndex < widget.galleryImageList.length - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}