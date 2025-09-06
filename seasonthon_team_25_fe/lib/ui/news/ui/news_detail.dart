// 금융 상품 상세 보기

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/mini_done_alret.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';
import 'package:seasonthon_team_25_fe/ui/components/reward_box.dart';

class NewsDetail extends ConsumerStatefulWidget {
  const NewsDetail({super.key});

  @override
  ConsumerState<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends ConsumerState<NewsDetail> {
  final Map<String, String> mockArticle = {
    "title": "청년 희망 적금 출시",
    "date": "2025-09-05",
    "imageUrl":
        "https://cdn.ceomagazine.co.kr/news/photo/202112/30595_21552_318.jpg",
    "summary": "청년들을 위한 높은 금리의 적금 상품이 출시되었습니다.",
    "content":
        "정부와 금융권이 협력하여 청년들의 자산 형성을 돕기 위한 청년 희망 적금을 출시했습니다. "
        "연 5% 금리를 제공하며, 2년 만기 조건으로 최대 2천만 원까지 저축이 가능합니다.",
    "source": "한국경제신문",
  };

  bool isDone = false;

  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: const CustomAppBar(title: '뉴스', showLeft: true, showRight: true),
      body: Stack(
        children: [
          // 본문: 패딩 + 스크롤
          Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              0,
              20,
              90,
            ), // 하단 버튼/토스트 공간 확보
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 제목
                  Text(
                    mockArticle["title"]!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.bk,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 날짜
                  Text(
                    mockArticle["date"]!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gr600,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 썸네일
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      mockArticle["imageUrl"]!,
                      width: double.infinity,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 구분선
                  const Divider(height: 32, thickness: 1),

                  // 요약 라벨
                  MiniDoneAlret(
                    width: 70,
                    child: Text(
                      "요약",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.sk,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 요약 텍스트
                  Text(
                    mockArticle["summary"]!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.sk,
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 본문
                  Text(
                    mockArticle["content"]!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: AppColors.bk,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // 구분선
                  const Divider(height: 32, thickness: 1),
                  Text(
                    // "출처: ${mockArticle["source"]!}",
                    "파프의 뉴스 시스템은 대한민국 공식 전자정부 누리집인 <대한민국 정책브리핑>의 검증된 기사만을 사용합니다.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gr600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 토스트(조건부 표시) - 화면 하단 중앙
          if (isDone)
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Center(
                child: MiniDoneAlret(
                  child: Text(
                    "스크랩 완료!",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.wt, // 대비 좋은 색 추천
                    ),
                  ),
                ),
              ),
            ),

          // 우하단 버튼
          Positioned(
            right: 20,
            bottom: 20,
            child: PrimaryActionButton(
              height: 44,
              width: 90,
              isLoading: false,
              label: "스크랩",
              onPressed: () {
                setState(() => isDone = true);
                Future.delayed(const Duration(seconds: 3), () {
                  if (!mounted) return;
                  setState(() => isDone = false);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
