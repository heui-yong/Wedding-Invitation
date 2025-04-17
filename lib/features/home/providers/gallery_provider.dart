import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/features/home/home.dart';

final galleryImageListProvider = Provider<List<GalleryModel>>((ref) {
  return [
    GalleryModel(id: "1", assetPath: AppImagePath.gallery1Path),
    GalleryModel(id: "2", assetPath: AppImagePath.gallery2Path),
    GalleryModel(id: "3", assetPath: AppImagePath.gallery3Path),
    GalleryModel(id: "4", assetPath: AppImagePath.gallery4Path),
    GalleryModel(id: "5", assetPath: AppImagePath.gallery5Path),
    GalleryModel(id: "6", assetPath: AppImagePath.gallery6Path),
    GalleryModel(id: "7", assetPath: AppImagePath.gallery7Path),
    GalleryModel(id: "8", assetPath: AppImagePath.gallery8Path),
    GalleryModel(id: "9", assetPath: AppImagePath.gallery9Path),
    GalleryModel(id: "10", assetPath: AppImagePath.gallery10Path),
    GalleryModel(id: "11", assetPath: AppImagePath.gallery11Path),
    GalleryModel(id: "12", assetPath: AppImagePath.gallery12Path),
    GalleryModel(id: "13", assetPath: AppImagePath.gallery13Path),
    GalleryModel(id: "14", assetPath: AppImagePath.gallery14Path),
  ];
});
