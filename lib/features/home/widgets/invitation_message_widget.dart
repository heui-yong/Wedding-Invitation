import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/common/common.dart';
import 'package:frontend/features/features.dart';

class InvitationMessageWidget extends ConsumerStatefulWidget {
  const InvitationMessageWidget({super.key});

  @override
  ConsumerState<InvitationMessageWidget> createState() =>
      _InvitationMessageWidgetState();
}

class _InvitationMessageWidgetState
    extends ConsumerState<InvitationMessageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Text(
          AppString.homeInvitationMessageTitleEn,
          style: TextStyle(fontSize: 11, color: AppColor.color_9E9E9E),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          AppString.homeInvitationMessageTitle,
          style: TextStyle(fontSize: 18, color: AppColor.color_9E9E9E),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          AppString.homeInvitationMessageDesc,
          style: TextStyle(
            fontFamily: "Komi",
            fontSize: 16,
            color: AppColor.color_9E9E9E,
            height: 2
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 24,),
      ],
    );
  }
}
