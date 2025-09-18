import 'dart:ui_web' as ui;
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class ProxyImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const ProxyImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    // CORS 문제를 우회하기 위해 이미지 프록시 URL 생성
    final proxyUrl = _createProxyUrl(url);
    
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: SizedBox(
        width: width ?? double.infinity,
        height: height,
        child: _buildImageWidget(proxyUrl),
      ),
    );
  }

  String _createProxyUrl(String originalUrl) {
    // Google Cloud Storage URL을 프록시 URL로 변환
    if (originalUrl.contains('storage.cloud.google.com')) {
      // Google Cloud Storage의 공개 URL로 변환
      final uri = Uri.parse(originalUrl);
      final pathSegments = uri.pathSegments;
      if (pathSegments.length >= 3) {
        final bucket = pathSegments[0];
        final objectPath = pathSegments.skip(1).join('/');
        return 'https://storage.googleapis.com/$bucket/$objectPath';
      }
    }
    
    // CORS 프록시 서비스 사용 (개발용)
    if (originalUrl.startsWith('http')) {
      // CORS Anywhere 프록시 사용 (개발 환경에서만)
      return 'https://cors-anywhere.herokuapp.com/$originalUrl';
    }
    
    // 다른 경우에는 원본 URL 사용
    return originalUrl;
  }

  Widget _buildImageWidget(String imageUrl) {
    final viewType = 'proxy-img-${imageUrl.hashCode}';
    
    ui.platformViewRegistry.registerViewFactory(
      viewType,
      (int viewId) {
        final element = html.ImageElement()
          ..src = imageUrl
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
          ..style.filter = 'contrast(1.1) saturate(1.1) brightness(1.05)';
        
        // 에러 처리
        element.onError.listen((event) {
          print('Image load error: $imageUrl');
        });
        
        return element;
      },
    );

    return HtmlElementView(viewType: viewType);
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
