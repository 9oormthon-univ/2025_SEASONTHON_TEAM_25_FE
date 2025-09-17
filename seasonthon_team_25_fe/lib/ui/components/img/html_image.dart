import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class HtmlImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  HtmlImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  }) {
    final viewType = 'html-img-${url.hashCode}';
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) {
        final element = html.ImageElement()
          ..src = url
          ..style.objectFit = _fitToCss(fit)
          ..style.width = width != null ? '${width}px' : '100%'   // 항상 명시
          ..style.height = height != null ? '${height}px' : 'auto'; // 높이도 명시
        return element;
      },
    );
    _viewType = viewType;
  }

  late final String _viewType;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: HtmlElementView(viewType: _viewType),
      ),
    );
  }

  String _fitToCss(BoxFit fit) {
    switch (fit) {
      case BoxFit.contain:
        return 'contain';
      case BoxFit.cover:
        return 'cover';
      case BoxFit.fill:
        return 'fill';
      case BoxFit.fitHeight:
        return 'scale-down';
      case BoxFit.fitWidth:
        return 'scale-down';
      default:
        return 'cover';
    }
  }
}
