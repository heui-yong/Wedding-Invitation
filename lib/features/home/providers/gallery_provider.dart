import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/features/home/home.dart';

final galleryImageListProvider1to2 = Provider<List<GalleryModel>>((ref) {
  return [
    GalleryModel(id: 1, assetPath: AppImagePath.gallery1Path),
    GalleryModel(id: 2, assetPath: AppImagePath.gallery2Path),
    GalleryModel(id: 3, assetPath: AppImagePath.gallery3Path),
    GalleryModel(id: 4, assetPath: AppImagePath.gallery4Path, isVertical: false),
    GalleryModel(id: 5, assetPath: AppImagePath.gallery5Path),
    GalleryModel(id: 6, assetPath: AppImagePath.gallery6Path),
    GalleryModel(id: 7, assetPath: AppImagePath.gallery7Path),
    GalleryModel(id: 8, assetPath: AppImagePath.gallery8Path, isVertical: false),
    GalleryModel(id: 9, assetPath: AppImagePath.gallery9Path),
    // GalleryModel(id: "10", assetPath: AppImagePath.gallery10Path),
    // GalleryModel(id: "11", assetPath: AppImagePath.gallery11Path),
    // GalleryModel(id: "12", assetPath: AppImagePath.gallery12Path),
    // GalleryModel(id: "13", assetPath: AppImagePath.gallery13Path),
    // GalleryModel(id: "14", assetPath: AppImagePath.homeTitlePath),
    // GalleryModel(id: "15", assetPath: AppImagePath.gallery15Path),
    // GalleryModel(id: "16", assetPath: AppImagePath.gallery16Path),
    // GalleryModel(id: "17", assetPath: AppImagePath.gallery17Path),
    // GalleryModel(id: "18", assetPath: AppImagePath.gallery18Path, isVertical: false),
    // GalleryModel(id: "19", assetPath: AppImagePath.gallery19Path),
  ];
});

final galleryImageListProvider1to1 = Provider<List<GalleryModel>>((ref) {
  return [
    GalleryModel(id: 10, assetPath: AppImagePath.gallery10Path),
    GalleryModel(id: 12, assetPath: AppImagePath.gallery12Path, isVertical: false),
    GalleryModel(id: 11, assetPath: AppImagePath.gallery11Path, isVertical: false),
    GalleryModel(id: 13, assetPath: AppImagePath.gallery13Path),
    GalleryModel(id: 14, assetPath: AppImagePath.gallery14Path),
    GalleryModel(id: 15, assetPath: AppImagePath.gallery15Path, isVertical: false),
    GalleryModel(id: 16, assetPath: AppImagePath.gallery16Path),
    GalleryModel(id: 17, assetPath: AppImagePath.gallery17Path, isVertical: false),
  ];
});
