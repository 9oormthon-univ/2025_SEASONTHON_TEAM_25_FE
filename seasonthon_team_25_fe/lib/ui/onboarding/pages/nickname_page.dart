import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/presentation/providers/onboarding_controller.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/app_bar/custom_app_bar.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/utils/toasts.dart';

class NicknamePage extends ConsumerStatefulWidget {
  const NicknamePage({super.key});

  @override
  ConsumerState<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends ConsumerState<NicknamePage> {
  final _formKey = GlobalKey<FormState>();
  final _nickNameController = TextEditingController();

  @override
  void dispose() {
    _nickNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(onboardingControllerProvider);
    final isLoading = state.createName.isLoading;

    ref.listen<OnboardingState>(onboardingControllerProvider, (prev, next) {
      next.createName.when(
        data: (res) {
          if (res == null || !mounted) return;
          // 로컬 저장 성공 여부
          if (next.savedLocally) {
            context.go('/home');
          } else {
            ToastUtils.showErrorToast(context, '닉네임 로컬 저장에 실패했어요. 다시 시도해 주세요.');
          }
        },
        error: (e, _) {
          if (!mounted) return;
          ToastUtils.showErrorToast(context, e.toString());
        },
        loading: () {},
      );
    });

    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: CustomAppBar(
        backgroundColor: AppColors.wt,
        title: "시작하기",
        showRightBtn: true,
        onTapRightBtn: () {
          context.go("/login");
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 66, 20, 145),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.onboarding.faffNocircle.image(
                  width: 128,
                  height: 240,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 54.7),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('파프에게 당신의 이름을 알려 주세요', style: AppTypography.h2),
                      Text(
                        '한/영문, 숫자로 이용해 20자 내로 입력해 주세요',
                        style: AppTypography.l500.copyWith(
                          color: AppColors.gr600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(minHeight: 48),
                  child: TextFormField(
                    controller: _nickNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.sk_25,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppRadius.bottomSheet,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppRadius.bottomSheet,
                        ),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 5,
                      ),
                      errorStyle: AppTypography.m500.copyWith(
                        color: AppColors.secondaryRd,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '닉네임을 입력해 주세요';
                      }
                      if (value.length > 20) {
                        return '닉네임은 최대 20자까지 입력 가능합니다';
                      }
                      final regExp = RegExp(r'^[a-zA-Z0-9가-힣]+$');
                      if (!regExp.hasMatch(value)) {
                        return '닉네임에는 한글, 영문, 숫자만 사용할 수 있습니다';
                      }
                      return null;
                    },
                  ),
                ),
                // 로그인으로 바로 가는 버튼
                const SizedBox(height: 38),
                PrimaryFilledButton(
                  isLoading: false,
                  label: '시작하기',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final name = _nickNameController.text;
                      ref
                          .read(onboardingControllerProvider.notifier)
                          .createNickName(name);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
