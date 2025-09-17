import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';

enum BubbleNip {
  none,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
  left,
  right,
  topCenter, // 추가
  bottomCenter, // 추가
  centerLeft, // 추가
  centerRight, // 추가
}

enum BlurType { none, hint }

class SpeechBubble extends StatelessWidget {
  const SpeechBubble({
    super.key,
    required this.child,
    this.color = const Color(0xFFFFFFFF),
    this.borderColor,
    this.borderWidth = 0,
    this.radius = 24,
    this.nip = BubbleNip.left,
    this.nipWidth = 18,
    this.nipHeight = 20,
    this.nipOffset = 40,
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
      case BubbleNip.bottomCenter:
        return EdgeInsets.only(bottom: nipHeight);
      case BubbleNip.topLeft:
      case BubbleNip.topRight:
      case BubbleNip.topCenter:
        return EdgeInsets.only(top: nipHeight);
      case BubbleNip.left:
      case BubbleNip.centerLeft:
        return EdgeInsets.only(left: nipWidth);
      case BubbleNip.right:
      case BubbleNip.centerRight:
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
      child: Padding(padding: padding + _extraInset, child: child),
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

    double left = 0, top = 0, right = size.width, bottom = size.height;
    if (nip == BubbleNip.bottomLeft ||
        nip == BubbleNip.bottomRight ||
        nip == BubbleNip.bottomCenter) {
      bottom -= nipHeight;
    } else if (nip == BubbleNip.topLeft ||
        nip == BubbleNip.topRight ||
        nip == BubbleNip.topCenter) {
      top += nipHeight;
    } else if (nip == BubbleNip.left || nip == BubbleNip.centerLeft) {
      left += nipWidth;
    } else if (nip == BubbleNip.right || nip == BubbleNip.centerRight) {
      right -= nipWidth;
    }

    final bodyRect = Rect.fromLTRB(left, top, right, bottom);
    final body = RRect.fromRectAndRadius(bodyRect, r);

    final path = Path()..addRRect(body);

    switch (nip) {
      case BubbleNip.left:
        {
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
      case BubbleNip.topCenter:
        {
          final centerX = bodyRect.left + bodyRect.width / 2;
          final y = bodyRect.top;
          path.moveTo(centerX - nipWidth / 2, y);
          path.lineTo(centerX + nipWidth / 2, y);
          path.lineTo(centerX, y - nipHeight);
          path.close();
          break;
        }
      case BubbleNip.bottomCenter:
        {
          final centerX = bodyRect.left + bodyRect.width / 2;
          final y = bodyRect.bottom;
          path.moveTo(centerX - nipWidth / 2, y);
          path.lineTo(centerX + nipWidth / 2, y);
          path.lineTo(centerX, y + nipHeight);
          path.close();
          break;
        }
      case BubbleNip.centerLeft:
        {
          final centerY = bodyRect.top + bodyRect.height / 2;
          final x = bodyRect.left;
          path.moveTo(x, centerY - nipHeight / 2);
          path.lineTo(x, centerY + nipHeight / 2);
          path.lineTo(x - nipWidth, centerY);
          path.close();
          break;
        }
      case BubbleNip.centerRight:
        {
          final centerY = bodyRect.top + bodyRect.height / 2;
          final x = bodyRect.right;
          path.moveTo(x, centerY - nipHeight / 2);
          path.lineTo(x, centerY + nipHeight / 2);
          path.lineTo(x + nipWidth, centerY);
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
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, elevation);
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
