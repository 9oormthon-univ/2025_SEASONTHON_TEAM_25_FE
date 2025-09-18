import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class HtmlImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const HtmlImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final viewType = 'html-img-${url.hashCode}';
    
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) {
        final element = html.ImageElement()
          ..src = url
          ..style.objectFit = _fitToCss(fit)
          ..style.width = width != null ? '${width}px' : '100%'
          ..style.height = height != null ? '${height}px' : '100%'
          ..style.borderRadius = borderRadius != null ? '${borderRadius!.topLeft.x}px' : '0px'
          ..style.display = 'block'
          ..style.visibility = 'visible'
          ..style.maxWidth = '100%'
          ..style.maxHeight = '100%'
          ..style.minWidth = '100%'
          ..style.minHeight = '100%'
          ..style.objectPosition = 'center center'
          ..style.imageRendering = 'high-quality'
          ..style.filter = 'contrast(1.1) saturate(1.1) brightness(1.05)'
          ..style.transform = 'scale(1)'
          ..style.backfaceVisibility = 'hidden'
          ..style.perspective = '1000px'
          ..style.willChange = 'transform'
          ..style.transformOrigin = 'center center';
        
        return element;
      },
    );

    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: HtmlElementView(viewType: viewType),
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
        return 'cover';
      case BoxFit.fitWidth:
        return 'cover';
      case BoxFit.none:
        return 'none';
      case BoxFit.scaleDown:
        return 'cover';
      default:
        return 'cover';
    }
  }
}