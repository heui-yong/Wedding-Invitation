import 'package:flutter/material.dart';
import 'package:frontend/common/common.dart';
import 'dart:ui' as ui;
import 'dart:html';

class HomeMapWidget extends StatefulWidget {
  const HomeMapWidget({super.key});

  @override
  State<HomeMapWidget> createState() => _HomeMapWidgetState();
}

class _HomeMapWidgetState extends State<HomeMapWidget> {
  @override
  void initState() {
    super.initState();
    // iframe으로 카카오 지도 등록
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'kakao-map',
      (int viewId) => IFrameElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..src = 'kakao_map/map.html'
        ..style.border = 'none'
        ..setAttribute('referrerpolicy', 'no-referrer-when-downgrade')
        ..setAttribute('allow', 'geolocation')
        ..allowFullscreen = true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TitleWidget(
            titleEn: AppString.homeMapTitleEn,
            titleKo: AppString.homeMapTitleKo),
        SizedBox(
          height: 12,
        ),
        Text(AppString.marryPlace,
            style: TextStyle(fontSize: 16, color: AppColor.color_000000)),
        SizedBox(
          height: 8,
        ),
        Text("부산 해운대구 센텀1로 17",
            style: TextStyle(fontSize: 14, color: AppColor.color_9E9E9E)),
        SizedBox(
          height: 12,
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 300,
              color: AppColor.color_9E9E9E,
              // 카카오 지도 표시
              child: HtmlElementView(viewType: 'kakao-map'),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              color: AppColor.color_F5E6E6.withOpacity(0.3),
              height: 40,
              child: Row(
                children: [
                  Expanded(child: buildMapMethod(AppImagePath.naverMapPath, "네이버 지도")),
                  VerticalDivider(
                    color: AppColor.color_9E9E9E,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Expanded(child: buildMapMethod(AppImagePath.kakaoMapPath, "카카오 내비")),
                  VerticalDivider(
                    color: AppColor.color_9E9E9E,
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  Expanded(child: buildMapMethod(AppImagePath.tMapPath, "티맵")),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
          ],
        ),
      ],
    );
  }

  Center buildMapMethod(String imagePath, String mapName) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imagePath,
            width: 18,
            height: 18,
          ),
          const SizedBox(width: 12,),
          Text(
            mapName,
            style: TextStyle(color: AppColor.color_000000, fontSize: 14),
          )
        ],
      ),
    );
  }
}
