import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/utils/financial_terms.dart';

class HighlightInfo {
  final String term;
  final int start;
  final int end;
  
  HighlightInfo({
    required this.term,
    required this.start,
    required this.end,
  });
}

class HighlightableText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final Function(String)? onTermTap;
  
  const HighlightableText({
    super.key,
    required this.text,
    this.style,
    this.textAlign,
    this.onTermTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.start,
      text: _buildTextSpan(context),
    );
  }

  TextSpan _buildTextSpan(BuildContext context) {
    final List<TextSpan> spans = [];
    String remainingText = text;
    
    // 하이라이트할 용어들을 길이 순으로 정렬 (긴 용어부터 처리)
    final sortedTerms = List<String>.from(FinancialTerms.highlightTerms)
      ..sort((a, b) => b.length.compareTo(a.length));
    
    // 모든 하이라이트 위치를 미리 찾기
    final List<HighlightInfo> highlights = [];
    final Set<String> usedTerms = {}; // 이미 사용된 용어 추적
    
    for (String term in sortedTerms) {
      // 이미 이 용어를 사용했다면 건너뛰기
      if (usedTerms.contains(term)) continue;
      
      final index = remainingText.indexOf(term);
      if (index != -1) {
        // 이미 하이라이트된 영역과 겹치는지 확인
        bool overlaps = highlights.any((highlight) => 
          (index >= highlight.start && index < highlight.end) ||
          (index + term.length > highlight.start && index + term.length <= highlight.end) ||
          (index <= highlight.start && index + term.length >= highlight.end)
        );
        
        if (!overlaps) {
          highlights.add(HighlightInfo(
            term: term,
            start: index,
            end: index + term.length,
          ));
          usedTerms.add(term); // 이 용어를 사용했다고 표시
        }
      }
    }
    
    // 위치 순으로 정렬
    highlights.sort((a, b) => a.start.compareTo(b.start));
    
    // 텍스트를 하이라이트와 함께 구성
    int currentIndex = 0;
    
    for (final highlight in highlights) {
      // 하이라이트 이전 텍스트 추가
      if (currentIndex < highlight.start) {
        spans.add(TextSpan(
          text: remainingText.substring(currentIndex, highlight.start),
          style: style ?? AppTypography.l500.copyWith(color: AppColors.gr600),
        ));
      }
      
      // 하이라이트된 용어 추가
      spans.add(TextSpan(
        text: highlight.term,
        style: (style ?? AppTypography.l500).copyWith(
          color: AppColors.secondaryBl,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.secondaryBl,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            onTermTap?.call(highlight.term);
          },
      ));
      
      currentIndex = highlight.end;
    }
    
    // 마지막 하이라이트 이후 텍스트 추가
    if (currentIndex < remainingText.length) {
      spans.add(TextSpan(
        text: remainingText.substring(currentIndex),
        style: style ?? AppTypography.l500.copyWith(color: AppColors.gr600),
      ));
    }
    
    return TextSpan(children: spans);
  }

}
