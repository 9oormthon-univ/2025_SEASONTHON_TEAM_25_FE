import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:seasonthon_team_25_fe/core/theme/colors.dart';
import 'package:seasonthon_team_25_fe/core/theme/typography.dart';
import 'package:seasonthon_team_25_fe/feature/auth/presentation/providers/auth_controller.dart';
import 'package:seasonthon_team_25_fe/ui/components/primary_action_dtn.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailFieldKey = GlobalKey<FormFieldState<String>>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();

  bool isEmailError = false;
  bool isPasswordError = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    final isLoading = state.login.isLoading;

    ref.listen(authControllerProvider, (prev, next) {
      next.login.when(
        data: (entity) {
          if (entity == null) return;
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('로그인 성공! 👋')));
          //context.go('/nickname');
          context.go('/home');  //시연을 위함
        },
        error: (e, _) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.toString())));
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
            padding: const EdgeInsets.fromLTRB(20, 94, 20, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "로그인",
                  style: AppTypography.h1.copyWith(color: AppColors.bk),
                ),
                const SizedBox(height: 6),
                Text(
                  "원활한 서비스 이용을 위해서는 로그인이 필요해요",
                  style: AppTypography.l500,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 131),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("E-Mail", style: AppTypography.xl500),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: TextFormField(
                            key: _emailFieldKey,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (_) {
                              if (isEmailError) {
                                setState(() => isEmailError = false);
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 20,
                              ),
                              filled: true,
                              fillColor:
                                  isEmailError
                                      ? AppColors.rd.withValues(alpha: .25)
                                      : AppColors.sk.withValues(alpha: .8),
                              hintText:
                                  isEmailError
                                      ? "유효한 이메일 주소를 입력해 주세요"
                                      : "name@example.com 형태로 입력해 주세요",
                              hintStyle:
                                  isEmailError
                                      ? AppTypography.m500.copyWith(
                                        color: AppColors.rd.withValues(
                                          alpha: .75,
                                        ),
                                      )
                                      : AppTypography.m500,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              helperText: '',
                              helperStyle: const TextStyle(
                                height: 0,
                                fontSize: 0,
                              ),
                              errorStyle: const TextStyle(
                                height: 0,
                                fontSize: 0,
                              ),
                            ),
                            validator: (value) {
                              final v = (value ?? '').trim();
                              if (v.isEmpty) {
                                return "이메일을 입력해 주세요";
                              }
                              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                              if (!emailRegex.hasMatch(v)) {
                                return "name@example.com 형태로 입력해 주세요";
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
                          height: 48,
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
                                vertical: 20,
                              ),
                              filled: true,
                              fillColor:
                                  isPasswordError
                                      ? AppColors.rd.withValues(alpha: .25)
                                      : AppColors.sk.withValues(alpha: .8),
                              hintText: "영어, 숫자, 특수문자를 포함한 8-20자를 입력해 주세요",
                              hintStyle:
                                  isPasswordError
                                      ? AppTypography.m500.copyWith(
                                        color: AppColors.rd.withValues(
                                          alpha: .75,
                                        ),
                                      )
                                      : AppTypography.m500,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              errorStyle: const TextStyle(
                                height: 0,
                                fontSize: 0,
                              ),
                              helperText: '',
                              helperStyle: const TextStyle(
                                height: 0,
                                fontSize: 0,
                              ),
                            ),
                            validator: (value) {
                              final v = value ?? '';
                              if (v.isEmpty) {
                                return "비밀번호를 입력해 주세요";
                              }
                              if (v.length < 8 || v.length > 20) {
                                return "비밀번호는 8자-20자여야 합니다";
                              }
                              final hasLetter = RegExp(r'[A-Za-z]').hasMatch(v);
                              final hasNumber = RegExp(r'[0-9]').hasMatch(v);
                              final hasSpecialChar = RegExp(
                                r'[!@#$%^&*(),.?":{}|<>]',
                              ).hasMatch(v);
                              if (!hasLetter || !hasNumber || !hasSpecialChar) {
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

                PrimaryActionButton(
                  isLoading: isLoading,
                  label: '로그인',
                  onPressed: () async {
                    final emailOk =
                        _emailFieldKey.currentState?.validate() ?? false;
                    final pwOk =
                        _passwordFieldKey.currentState?.validate() ?? false;

                    setState(() {
                      isEmailError = !emailOk;
                      isPasswordError = !pwOk;
                    });

                    if (!(emailOk && pwOk)) return;

                    final email = _emailController.text.trim();
                    final password = _passwordController.text;

                    await ref
                        .read(authControllerProvider.notifier)
                        .login(email, password);
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
