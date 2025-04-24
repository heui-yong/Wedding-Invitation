// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:frontend/common/common.dart';
// import 'package:frontend/features/features.dart';
//
// class HomeGalleryWidget3 extends ConsumerWidget {
//   final List<GalleryModel> galleryImageList1to2;
//   final List<GalleryModel> galleryImageList1to1;
//
//   const HomeGalleryWidget3({
//     super.key,
//     required this.galleryImageList1to2,
//     required this.galleryImageList1to1
//   });
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final rowCount = (galleryImageList1to2.length / 3).ceil();
//     final rowCount1 = (galleryImageList1to1.length / 4).ceil();
//
//     return Column(
//       children: [
//         const SizedBox(height: 72),
//         Text(AppString.homeGalleryTitleEn,
//             style: TextStyle(fontSize: 11, color: AppColor.color_9E9E9E)),
//         const SizedBox(height: 4),
//         Text(AppString.homeGalleryTitle,
//             style: TextStyle(fontSize: 18, color: AppColor.color_9E9E9E)),
//         const SizedBox(height: 12),
//         // 3개씩 묶어서 반복 생성
//         ...List.generate(rowCount, (rowIdx) {
//           final start = rowIdx * 3;
//           final chunk = galleryImageList1to2.sublist(start, start + 3 > galleryImageList1to2.length ? galleryImageList1to2.length : start + 3);
//           return _buildGalleryRow(chunk, largeLeft: rowIdx.isEven);
//         }),
//         ...List.generate(rowCount1, (rowIdx) {
//           final start = rowIdx * 4;
//           final chunk = galleryImageList1to1.sublist(start, start + 4 > galleryImageList1to1.length ? galleryImageList1to1.length : start + 4);
//           return _buildGalleryRow2(chunk, largeLeft: rowIdx.isEven);
//         }),
//       ],
//     );
//   }
//
//   Widget _buildGalleryRow(List<GalleryModel> imgs, {required bool largeLeft}) {
//     return Container(
//       height: 240,
//       padding: const EdgeInsets.symmetric(horizontal: 36),
//       child: Row(
//         children: largeLeft
//             ? [
//           Expanded(flex: 1, child: _buildImage(imgs[0])),
//           Expanded(flex: 1, child: Column(
//             children: [
//               Expanded(child: _buildImage(imgs.length > 1 ? imgs[1] : imgs[0], alignment: const Alignment(0, -0.5))),
//               Expanded(child: _buildImage(imgs.length > 2 ? imgs[2] : imgs[0], alignment: const Alignment(0, -0.3))),
//             ],
//           )),
//         ]
//             : [
//           Expanded(flex: 1, child: Column(
//             children: [
//               Expanded(child: _buildImage(imgs[0], alignment: const Alignment(0, 0))),
//               Expanded(child: _buildImage(imgs.length > 1 ? imgs[1] : imgs[0], alignment: const Alignment(0, -0.9))),
//             ],
//           )),
//           Expanded(flex: 1, child: _buildImage(imgs.length > 2 ? imgs[2] : imgs[0])),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildGalleryRow2(List<GalleryModel> imgs, {required bool largeLeft}) {
//     return Container(
//       height: 360,
//       padding: const EdgeInsets.symmetric(horizontal: 36),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 1,
//             child: Column(
//               children: [
//                 Expanded(
//                   flex: 2,
//                   child: _buildImage(imgs[0], alignment: const Alignment(0, 0)),
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: _buildImage(imgs[1], alignment: const Alignment(0, 0)),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             flex: 1,
//             child: Column(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: _buildImage(imgs[2], alignment: const Alignment(0, -0.7)),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: _buildImage(imgs[3], alignment: const Alignment(0, 0)),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _buildImage(GalleryModel model, {Alignment alignment = Alignment.center}) {
//     final List<GalleryModel> combinedList = [
//       ...galleryImageList1to2,
//       ...galleryImageList1to1,
//     ];
//
//     return GestureDetector(
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return GalleryDialog(
//               galleryImageList: widget.galleryImageList,
//               initialIndex: index,
//             );
//           },
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.all(4),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           image: DecorationImage(
//             image: AssetImage(model.assetPath),
//             fit: BoxFit.cover,
//             alignment: alignment,
//           ),
//         ),
//       ),
//     );
//   }
// }