import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/models/onboarding_models.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/repositoryImpl/onboarding_repositoryImpl.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    return Scaffold(
      backgroundColor: AppColors.wt,
      appBar: AppBar(
        backgroundColor: AppColors.wt,
        centerTitle: true,
        title: Text('시작하기', style: AppTypography.h3),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset(
              Assets.images.components.xIcon.path,
              height: 24,
              width: 24,
            ),
            onPressed: () {
              //Navigator.pop(context);
              context.go("/login");
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 66, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.images.onboarding.faffNocircle.image(
                  width: 120,
                  height: 175,
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
                        '한/영문, 숫자로 최대 20자까지 입력 가능해요',
                        style: AppTypography.l500,
                      ),
                      const SizedBox(height: 16),
                      Text('내 이름은', style: AppTypography.m600),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: TextFormField(
                    controller: _nickNameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.sk.withValues(alpha: .25),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '닉네임을 입력해 주세요';
                      }
                      if (value.length > 20) {
                        return '닉네임은 최대 20자까지 입력 가능합니다';
                      }
                      return null;
                    },
                  ),
                ),
                // 로그인으로 바로 가는 버튼
                const SizedBox(height: 16),
                PrimaryActionButton(
                  isLoading: false,
                  label: '시작하기',
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final characterName = _nickNameController.text.trim();
                      final body = CharacterRequest(
                        characterName: characterName,
                      );
                      debugPrint(
                        '[Onboarding] will send json: ${body.toJson()}',
                      );
                      try {
                        debugPrint('1. createCharacter 호출 전');
                        await ref
                            .read(onboardingRepositoryProvider)
                            .createCharacter(characterName: characterName);
                        debugPrint('2. createCharacter 호출 후');

                        final prefs = await SharedPreferences.getInstance();
                        debugPrint('3. SharedPreferences 인스턴스 획득');
                        await prefs.setString('characterName', characterName);
                        debugPrint('4. characterName 저장 완료');

                        if (context.mounted) {
                          debugPrint('5. 홈으로 이동');
                          context.go("/home");
                        }
                      } catch (e, stack) {
                        debugPrint('에러 발생: $e\n$stack');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('닉네임 설정에 실패했습니다. 다시 시도해 주세요.'),
                          ),
                        );
                      }
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
