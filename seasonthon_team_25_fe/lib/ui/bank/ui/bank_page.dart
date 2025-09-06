import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/blur_card.dart';
import 'package:seasonthon_team_25_fe/ui/components/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/reward_box.dart';

class BankPage extends ConsumerStatefulWidget {
  const BankPage({super.key});

  @override
  ConsumerState<BankPage> createState() => _BankPageState();
}

class _BankPageState extends ConsumerState<BankPage> {
  final String reward = "1,234원";
  final String userName = "Username";

  @override
  void initState() {
    super.initState();
    // 초기화 로직 필요 시 작성
    // 바텀 시트 띄워야 함
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        enableDrag: false, // 사용자가 바텀시트를 드래그로 내릴 수 없게 설정
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (context) {
          return const _BottomSheetContent();
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "나만의 뱅크",
        showLeft: true,
        showRight: false,
        onTapLeft: () {
          // 왼쪽 버튼 눌렀을 때
          debugPrint("뒤로가기 눌림");
          context.go('/home');
        },
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.sk, AppColors.wt],
          ),
        ),
        child: Column(
          spacing: 16,
          children: [
            Assets.images.onboarding.faffNocircle.image(
              width: 225,
              height: 275.6,
              fit: BoxFit.contain,
            ),
            Text(
              "반가워요 $userName님!",
              style: AppTypography.h2.copyWith(color: AppColors.wt),
            ),

            RewardBox(
              text: reward,
              textColor: AppColors.wt,
              backgroundColor: AppColors.sk.withValues(alpha: .25),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  const _BottomSheetContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20,40,20,0),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min, // 내용만큼만 높이 차지
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("뱅크 모드 선택"),
          GestureDetector(
            onTap: () {
              context.go('/bank/list');
            },
            child: BlurredCard(
              height: 44,
              child: Text("진행 중인 금융 상품 보러가기"),
            ),
          ),
          GestureDetector(
            onTap: () {
              context.go('/bank/in-progress');
            },
            child: BlurredCard(
              height: 44,
              child: Text("만기된 금융 상품 보러가기"),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // 바텀 시트 닫기
            },
            child: BlurredCard(
              height: 44,
              child: Text("새로운 금융 상품 보러가기"),
            ),
          ),
        ],
      ),
    );
  }
}
