class FinancialTerms {
  // 하이라이트할 금융 용어 목록
  static const List<String> highlightTerms = [
    '만기',
    '약정 이율',
    '우대금리',
    '최고 한도',
    '단리',
    '복리',
    '정액적립식',
    '자유적립식',
    '만기일시지급식',
    '중도 해지',
    '고시 금리',
    '납입',
    '계좌',
    '이자',
    '비대면',
    '평잔',
    'ESG',
    '재예치',
    '펀드',
    '주택청약종합저축',
    '오픈뱅킹',
    '원금',
    '월복리',
    '약정 이자율',
    '해약',
    '신규',
    '이체',
    '불입',
    '통장',
    '금리',
  ];

  // 용어명을 API 호출용 키로 매핑
  static const Map<String, String> termMapping = {
    '만기': '만기',
    '약정 이율': '약정이율',
    '우대금리': '우대금리',
    '최고 한도': '최고한도',
    '단리': '단리',
    '복리': '복리',
    '정액적립식': '정액적립식',
    '자유적립식': '자유적립식',
    '만기일시지급식': '만기일시지급식',
    '중도 해지': '중도해지',
    '고시 금리': '고시금리',
    '납입': '납입',
    '계좌': '계좌',
    '이자': '이자',
    '비대면': '비대면',
    '평잔': '평잔',
    'ESG': 'ESG',
    '재예치': '재예치',
    '펀드': '펀드',
    '주택청약종합저축': '주택청약종합저축',
    '오픈뱅킹': '오픈뱅킹',
    '원금': '원금',
    '월복리': '월복리',
    '약정 이자율': '약정이자율',
    '해약': '해약',
    '신규': '신규',
    '이체': '이체',
    '불입': '불입',
    '통장': '통장',
    '금리': '금리',
  };

  // 텍스트에서 하이라이트할 용어가 있는지 확인
  static bool containsHighlightTerm(String text) {
    return highlightTerms.any((term) => text.contains(term));
  }

  // 텍스트에서 하이라이트할 용어 목록 반환
  static List<String> getHighlightTermsInText(String text) {
    return highlightTerms.where((term) => text.contains(term)).toList();
  }

  // 용어명을 API 키로 변환
  static String getApiKey(String term) {
    return termMapping[term] ?? term;
  }
}
