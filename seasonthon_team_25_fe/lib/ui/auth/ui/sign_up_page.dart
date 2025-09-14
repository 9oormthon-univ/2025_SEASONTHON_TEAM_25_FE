import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/radius.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/auth/presentation/providers/auth_controller.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/primary_filled_button.dart';
import 'package:seasonthon_team_25_fe/ui/components/buttons/secondary_outlined_button.dart';
import 'package:seasonthon_team_25_fe/utils/toasts.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFieldKey = GlobalKey<FormFieldState<String>>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  bool isEmailError = false;
  bool isPasswordError = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    final isLoading = state.signUp.isLoading;

    ref.listen<AuthState>(authControllerProvider, (prev, next) async {
      next.signUp.when(
        data: (entity) async {
          if (entity == null) return;
          if (!mounted) return;
          ToastUtils.showInfoToast(context, '회원가입 성공!');
          context.go('/login');
        },
        error: (e, _) {
          if (!mounted) return;
          ToastUtils.showErrorToast(context, e.toString());
        },
        loading: () {},
      );
    });

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.wt,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 142, 20, 89),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "회원 가입",
                  style: AppTypography.h1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 6),
                Text(
                  "원활한 서비스 이용을 위해서는 로그인이 필요해요",
                  style: AppTypography.l500,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 115),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Form(
                    key: _formKey,
                    autovalidateMode:
                        AutovalidateMode.disabled, // 버튼 클릭 시에만 검증하도록 설정
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-Mail", style: AppTypography.xl500),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            key: _emailFieldKey,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (_) {
                              // 사용자가 다시 입력하면 에러 하이라이트 해제
                              if (isEmailError) {
                                setState(() => isEmailError = false);
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 13,
                              ),
                              filled: true,
                              fillColor: !isEmailError
                                  ? AppColors.sk_50
                                  : AppColors.rd_25,
                              hintText: "example@faff.com",
                              hintStyle: AppTypography.m500.copyWith(
                                color: AppColors.wt_50,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.bottomSheet,
                                ),
                                borderSide: BorderSide.none,
                              ),
                              helperText: '',
                              helperStyle: const TextStyle(
                                height: 0,
                                fontSize: 0,
                              ),
                              errorStyle: AppTypography.m500.copyWith(
                                color: AppColors.secondaryRd,
                              ),
                            ),
                            validator: (value) {
                              final v = (value ?? '').trim();
                              if (v.isEmpty) return "이메일 주소를 입력해 주세요";
                              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                              if (!emailRegex.hasMatch(v)) {
                                return "example@faff.com 형태로 입력해 주세요";
                              }
                              return null;
                            },
                          ),
                        ),

                        const SizedBox(height: 12),

                        Text("Password", style: AppTypography.xl500),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          child: TextFormField(
                            key: _passwordFieldKey,
                            controller: _passwordController,
                            obscureText: true,
                            onChanged: (_) {
                              if (isPasswordError) {
                                setState(() => isPasswordError = false);
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 13,
                              ),
                              filled: true,
                              fillColor: !isPasswordError
                                  ? AppColors.sk_50
                                  : AppColors.rd_25,
                              hintText: "영문, 숫자, 특수문자 포함 10자 이상을 입력해 주세요",
                              hintStyle: AppTypography.m500.copyWith(
                                color: AppColors.wt_50,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppRadius.bottomSheet,
                                ),
                                borderSide: BorderSide.none,
                              ),
                              helperText: '',
                              helperStyle: const TextStyle(
                                height: 0,
                                fontSize: 0,
                              ),
                              errorStyle: AppTypography.m500.copyWith(
                                color: AppColors.secondaryRd,
                              ),
                            ),
                            validator: (value) {
                              final v = value ?? '';
                              if (v.isEmpty) return "비밀번호를 입력해 주세요";
                              if (v.length < 8 || v.length > 20) {
                                return "비밀번호는 8자-20자여야 합니다";
                              }
                              final hasLetter = RegExp(r'[A-Za-z]').hasMatch(v);
                              final hasNumber = RegExp(r'[0-9]').hasMatch(v);
                              final hasSpecial = RegExp(
                                r'[!@#$%^&*(),.?":{}|<>]',
                              ).hasMatch(v);
                              if (!hasLetter || !hasNumber || !hasSpecial) {
                                return "영어와 숫자와 특수문자를 모두 포함해야 합니다";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 139),

                PrimaryFilledButton(
                  label: '가입하기',
                  isLoading: isLoading,
                  customWidth: double.infinity,
                  onPressed: () async {
                    FocusScope.of(context).unfocus();

                    // 폼 전체 1회 검증
                    final ok = _formKey.currentState?.validate() ?? false;

                    setState(() {
                      final emailOk =
                          _emailFieldKey.currentState?.validate() ?? false;
                      final pwOk =
                          _passwordFieldKey.currentState?.validate() ?? false;
                      isEmailError = !emailOk;
                      isPasswordError = !pwOk;
                    });

                    if (!ok) return;

                    final email = _emailController.text.trim();
                    final password = _passwordController.text;

                    await ref
                        .read(authControllerProvider.notifier)
                        .signUp(email, password);
                  },
                ),

                const SizedBox(height: 12),

                SecondaryOutLinedButton(
                  label: "로그인하기",
                  onPressed: () => context.go('/login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
