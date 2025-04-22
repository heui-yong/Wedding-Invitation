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
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        const Text(
          AppString.homeInvitationMessageTitleEn,
          style: TextStyle(fontSize: 14, color: AppColor.color_9E9E9E),
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          AppString.homeInvitationMessageTitle,
          style: TextStyle(fontSize: 22, color: AppColor.color_9E9E9E),
        ),
        const SizedBox(
          height: 4,
        ),
        const Text(
          AppString.homeInvitationMessageDesc,
          style: TextStyle(
            fontSize: 16,
            color: AppColor.color_9E9E9E,
            height: 2
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24,),
      ],
    );
  }
}
