import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/models/onboarding_models.dart';
import 'package:seasonthon_team_25_fe/feature/onboarding/data/repositoryImpl/onboarding_repositoryImpl.dart';
import 'package:seasonthon_team_25_fe/gen/assets.gen.dart';
import 'package:seasonthon_team_25_fe/ui/utils/primary_action_dtn.dart';
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
              Assets.images.utils.xIcon.path,
              height: 24,
              width: 24,
            ),
            onPressed: () {
              //Navigator.pop(context);
              Navigator.pushReplacementNamed(context, '/login');
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
                // SvgPicture.asset(
                //   Assets.images.onboarding.welcomText.path,
                //   // height: 56,
                //   // width: 90,
                // ),
                // SvgPicture.asset(
                //   Assets.images.onboarding.FAFF.path,
                //   // height: 20,
                //   // width: 120,
                // ),
                Assets.images.onboarding.faffNocircle.image(),
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
                        await ref
                            .read(onboardingRepositoryProvider)
                            .createCharacter(characterName: characterName);

                        // SharedPreferences에 저장
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('characterName', characterName);

                        // 홈으로 이동
                        if (context.mounted) {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      } catch (e) {
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
