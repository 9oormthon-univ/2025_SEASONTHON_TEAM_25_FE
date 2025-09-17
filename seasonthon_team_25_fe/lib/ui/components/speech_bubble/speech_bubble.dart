import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';

enum BubbleNip { none, topLeft, topRight, bottomLeft, bottomRight, left, right }

enum BlurType { none, hint }

class SpeechBubble extends StatelessWidget {
  const SpeechBubble({
    super.key,
    required this.child,
    this.color = const Color(0xFFFFFFFF),
    this.borderColor,
    this.borderWidth = 0,
    this.radius = 24,
    this.nip = BubbleNip.left, // 좌측 꼬리 기본
    this.nipWidth = 18, // 꼬리 길이(밖으로 돌출)
    this.nipHeight = 20, // 모서리 가장자리에서 차지하는 높이(좌/우 꼬리 기준 세로)
    this.nipOffset = 40, // 모서리(위/아래)로부터 떨어진 거리
    this.padding = const EdgeInsets.all(16),
    this.elevation = 6,
    this.blurType = BlurType.none,
  });

  final Widget child;
  final Color color;
  final Color? borderColor;
  final double borderWidth;
  final double radius;

  final BubbleNip nip;
  final double nipWidth;
  final double nipHeight;
  final double nipOffset;

  final EdgeInsets padding;
  final double elevation;

  final BlurType blurType;

  EdgeInsets get _extraInset {
    switch (nip) {
      case BubbleNip.bottomLeft:
      case BubbleNip.bottomRight:
        return EdgeInsets.only(bottom: nipHeight);
      case BubbleNip.topLeft:
      case BubbleNip.topRight:
        return EdgeInsets.only(top: nipHeight);
      case BubbleNip.left:
        return EdgeInsets.only(left: nipWidth);
      case BubbleNip.right:
        return EdgeInsets.only(right: nipWidth);
      case BubbleNip.none:
        return EdgeInsets.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _SpeechBubblePainter(
        color: color,
        borderColor: borderColor,
        borderWidth: borderWidth,
        radius: radius,
        nip: nip,
        nipWidth: nipWidth,
        nipHeight: nipHeight,
        nipOffset: nipOffset,
        elevation: elevation,
        blurType: blurType,
      ),
      child: Padding(
        // 꼬리 쪽으로 여유를 자동 보정
        padding: padding + _extraInset,
        child: child,
      ),
    );
  }
}

class _SpeechBubblePainter extends CustomPainter {
  _SpeechBubblePainter({
    required this.color,
    required this.borderColor,
    required this.borderWidth,
    required this.radius,
    required this.nip,
    required this.nipWidth,
    required this.nipHeight,
    required this.nipOffset,
    required this.elevation,
    required this.blurType,
  });

  final Color color;
  final Color? borderColor;
  final double borderWidth;
  final double radius;

  final BubbleNip nip;
  final double nipWidth;
  final double nipHeight;
  final double nipOffset;
  final double elevation;
  final BlurType blurType;

  @override
  void paint(Canvas canvas, Size size) {
    final r = Radius.circular(radius);

    // 꼬리 방향에 따라 본문 영역(Rect)을 줄여 꼬리 그릴 공간 확보
    double left = 0, top = 0, right = size.width, bottom = size.height;
    if (nip == BubbleNip.bottomLeft || nip == BubbleNip.bottomRight) {
      bottom -= nipHeight;
    } else if (nip == BubbleNip.topLeft || nip == BubbleNip.topRight) {
      top += nipHeight;
    } else if (nip == BubbleNip.left) {
      left += nipWidth;
    } else if (nip == BubbleNip.right) {
      right -= nipWidth;
    }

    final bodyRect = Rect.fromLTRB(left, top, right, bottom);
    final body = RRect.fromRectAndRadius(bodyRect, r);

    // 하나의 Path에 본문 + 꼬리
    final path = Path()..addRRect(body);

    // 꼬리 그리기
    switch (nip) {
      case BubbleNip.left:
        {
          // 좌측 꼬리: 세로 위치 계산(모서리 라운드를 피해 clamp)
          final minY = bodyRect.top + radius;
          final maxY = bodyRect.bottom - radius - nipHeight;
          final baseY = (bodyRect.top + nipOffset).clamp(minY, maxY);
          final x = bodyRect.left;
          path.moveTo(x, baseY);
          path.lineTo(x, baseY + nipHeight);
          path.lineTo(x - nipWidth, baseY + nipHeight * 0.5);
          path.close();
          break;
        }
      case BubbleNip.right:
        {
          final minY = bodyRect.top + radius;
          final maxY = bodyRect.bottom - radius - nipHeight;
          final baseY = (bodyRect.top + nipOffset).clamp(minY, maxY);
          final x = bodyRect.right;
          path.moveTo(x, baseY);
          path.lineTo(x, baseY + nipHeight);
          path.lineTo(x + nipWidth, baseY + nipHeight * 0.5);
          path.close();
          break;
        }
      case BubbleNip.bottomLeft:
        {
          final minX = bodyRect.left + radius;
          final maxX = bodyRect.right - radius - nipWidth;
          final baseX = (bodyRect.left + nipOffset).clamp(minX, maxX);
          final y = bodyRect.bottom;
          path.moveTo(baseX, y);
          path.lineTo(baseX + nipWidth, y);
          path.lineTo(baseX + nipWidth * 0.5, y + nipHeight);
          path.close();
          break;
        }
      case BubbleNip.bottomRight:
        {
          final minX = bodyRect.left + radius;
          final maxX = bodyRect.right - radius - nipWidth;
          final baseX = (bodyRect.right - nipOffset - nipWidth).clamp(
            minX,
            maxX,
          );
          final y = bodyRect.bottom;
          path.moveTo(baseX, y);
          path.lineTo(baseX + nipWidth, y);
          path.lineTo(baseX + nipWidth * 0.5, y + nipHeight);
          path.close();
          break;
        }
      case BubbleNip.topLeft:
        {
          final minX = bodyRect.left + radius;
          final maxX = bodyRect.right - radius - nipWidth;
          final baseX = (bodyRect.left + nipOffset).clamp(minX, maxX);
          final y = bodyRect.top;
          path.moveTo(baseX, y);
          path.lineTo(baseX + nipWidth, y);
          path.lineTo(baseX + nipWidth * 0.5, y - nipHeight);
          path.close();
          break;
        }
      case BubbleNip.topRight:
        {
          final minX = bodyRect.left + radius;
          final maxX = bodyRect.right - radius - nipWidth;
          final baseX = (bodyRect.right - nipOffset - nipWidth).clamp(
            minX,
            maxX,
          );
          final y = bodyRect.top;
          path.moveTo(baseX, y);
          path.lineTo(baseX + nipWidth, y);
          path.lineTo(baseX + nipWidth * 0.5, y - nipHeight);
          path.close();
          break;
        }
      case BubbleNip.none:
        break;
    }

    if (elevation > 0) {
      final glowPaint = Paint()
        ..color = (blurType == BlurType.hint
            ? AppColors.hintBk
            : AppColors.primarySky.withValues(alpha: .5))
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, elevation); // 블러 효과
      canvas.drawPath(path, glowPaint);
    }

    final fill = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..isAntiAlias = true;
    canvas.drawPath(path, fill);

    if (borderColor != null && borderWidth > 0) {
      final stroke = Paint()
        ..color = borderColor!
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth
        ..isAntiAlias = true;
      canvas.drawPath(path, stroke);
    }
  }

  @override
  bool shouldRepaint(covariant _SpeechBubblePainter old) {
    return color != old.color ||
        borderColor != old.borderColor ||
        borderWidth != old.borderWidth ||
        radius != old.radius ||
        nip != old.nip ||
        nipWidth != old.nipWidth ||
        nipHeight != old.nipHeight ||
        nipOffset != old.nipOffset ||
        elevation != old.elevation;
  }
}
