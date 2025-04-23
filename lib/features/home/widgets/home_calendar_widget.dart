import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/common/constants/app_color.dart';
import 'package:frontend/common/constants/app_string.dart';
import 'package:frontend/features/features.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomeCalendarWidget extends ConsumerStatefulWidget {
  const HomeCalendarWidget({super.key});

  @override
  ConsumerState<HomeCalendarWidget> createState() => _HomeCalendarWidgetState();
}

class _HomeCalendarWidgetState extends ConsumerState<HomeCalendarWidget> {
  late Timer _timer;
  final DateTime _weddingDate =
      DateTime(2025, 9, 14, 11, 0); // 2025년 9월 14일 오전 11시
  late Duration _timeLeft;

  @override
  void initState() {
    super.initState();
    _calculateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateTimeLeft();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    setState(() {
      _timeLeft = _weddingDate.difference(now);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 76),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // 날짜와 시간
            Text(
              '2025.9.14',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '일요일 오전 11시 00분',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),

            // 구분선
            Divider(color: Colors.grey[300], thickness: 1),

            // 달력
            _buildCalendar(),

            // 구분선
            Divider(color: Colors.grey[300], thickness: 1),

            // 카운트다운
            const SizedBox(height: 24),
            _buildCountdown(),
            const SizedBox(height: 24),

            // 메시지
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[700],
                ),
                children: [
                  const TextSpan(text: AppString.groomName),
                  const TextSpan(
                    text: ' ♥ ',
                    style: TextStyle(color: AppColor.color_E66E5F),
                  ),
                  const TextSpan(
                    text: '정윤의 결혼식이 ',
                  ),
                  TextSpan(
                    text: '${_timeLeft.inDays}',
                    style: TextStyle(color: AppColor.color_E66E5F),
                  ),
                  const TextSpan(text: '일 남았습니다.'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    return Column(
      children: [
        // 요일 표시줄
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _dayText('일', isWeekend: true, isSunday: true),
              _dayText('월'),
              _dayText('화'),
              _dayText('수'),
              _dayText('목'),
              _dayText('금'),
              _dayText('토', isWeekend: true),
            ],
          ),
        ),

        // 달력 그리드
        GridView.count(
          crossAxisCount: 7,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.2,
          children: _buildCalendarDays(),
        ),
      ],
    );
  }

  List<Widget> _buildCalendarDays() {
    final List<int?> days = [
      null,
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      15,
      16,
      17,
      18,
      19,
      20,
      21,
      22,
      23,
      24,
      25,
      26,
      27,
      28,
      29,
      30,
      null,
      null,
      null,
      null,
    ];

    return days.asMap().entries.map((entry) {
      final index = entry.key;
      final day = entry.value;
      final isSunday = index % 7 == 0;

      if (day == null) {
        return const SizedBox();
      }

      if (day == 14) {
        return Center(
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[400],
            ),
            child: Center(
              child: Text(
                day.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }

      return Center(
        child: Text(
          day.toString(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isSunday ? Colors.red : Colors.grey[700],
          ),
        ),
      );
    }).toList();
  }

  Widget _dayText(String text,
      {bool isWeekend = false, bool isSunday = false}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: isSunday
            ? Colors.red
            : (isWeekend ? Colors.grey[700] : Colors.grey[600]),
      ),
    );
  }

  Widget _buildCountdown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _countdownItem(_timeLeft.inDays.toString().padLeft(2, '0'), 'DAYS'),
        _countdownSeparator(),
        _countdownItem(_formatHours().padLeft(2, '0'), 'HOUR'),
        _countdownSeparator(),
        _countdownItem(_formatMinutes().padLeft(2, '0'), 'MIN'),
        _countdownSeparator(),
        _countdownItem(_formatSeconds().padLeft(2, '0'), 'SEC'),
      ],
    );
  }

  String _formatHours() {
    return (_timeLeft.inHours % 24).toString();
  }

  String _formatMinutes() {
    return (_timeLeft.inMinutes % 60).toString();
  }

  String _formatSeconds() {
    return (_timeLeft.inSeconds % 60).toString();
  }

  Widget _countdownItem(String number, String label) {
    return Container(
      width: 56,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            number,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _countdownSeparator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        ':',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
