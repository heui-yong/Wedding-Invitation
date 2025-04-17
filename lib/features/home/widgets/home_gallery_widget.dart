import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Image.asset(
        widget.galleryImageList[0].assetPath,
        width: MediaQuery.of(context).size.width * 0.8,
        fit: BoxFit.contain,
      ),
    );
  }
}
