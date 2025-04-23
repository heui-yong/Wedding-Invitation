class GalleryModel {
  final String id;
  final String assetPath;
  final bool isVertical;

  GalleryModel({
    required this.id,
    required this.assetPath,
    this.isVertical = true
  });
}