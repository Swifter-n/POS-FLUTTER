import 'package:avis_pos/presentation/auth/bloc/auth/auth_bloc.dart';
import 'package:avis_pos/presentation/home/pages/homepage.dart';
import 'package:avis_pos/presentation/shift/bloc/shift/shift_bloc.dart';
import 'package:avis_pos/presentation/shift/pages/open_shift_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/core/constants/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _credentialController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _credentialController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          // 1. Listener untuk Autentikasi Login
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                authenticated: (user) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Welcome, ${user.name}! Memeriksa status kasir...',
                      ),
                      backgroundColor: AppColors.primary,
                      duration: const Duration(seconds: 1),
                    ),
                  );
                  // SETELAH LOGIN SUKSES, CEK STATUS SHIFT
                  context.read<ShiftBloc>().add(const ShiftEvent.checkStatus());
                },
                unauthenticated: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: AppColors.red,
                    ),
                  );
                },
                orElse: () {},
              );
            },
          ),

          // 2. Listener untuk Status Shift
          BlocListener<ShiftBloc, ShiftState>(
            listener: (context, state) {
              state.maybeWhen(
                opened: (shift) {
                  // Jika shift sudah terbuka, langsung ke Homepage (Dashboard)
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const Homepage()),
                  );
                },
                closed: () {
                  // Jika shift masih tutup, arahkan ke Open Shift Page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const OpenShiftPage()),
                  );
                },
                error: (message) {
                  // Jika gagal ngecek API shift, amannya arahkan ke Open Shift
                  // atau beri notifikasi error. Kita arahkan ke Open Shift.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Info Shift: $message'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const OpenShiftPage()),
                  );
                },
                orElse: () {},
              );
            },
          ),
        ],
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 450),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo & Heading
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.coffee_maker_rounded,
                            size: 64,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text('Welcome Back!', style: AppTextStyles.headline),
                        const SizedBox(height: 8),
                        Text(
                          'Please log in to manage todays orders.',
                          style: AppTextStyles.label,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Form Inputs
                  AppTextField(
                    label: 'Email or NIK',
                    hint: 'Enter your email or NIK',
                    controller: _credentialController,
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AppTextField(
                    label: 'Password',
                    hint: 'Enter your password',
                    controller: _passwordController,
                    isPassword: true,
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: AppColors.primary,
                    ),
                  ),

                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Forgot Password Feature
                      },
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyles.label.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Login Button connected to both AuthBloc & ShiftBloc Loading State
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, authState) {
                      return BlocBuilder<ShiftBloc, ShiftState>(
                        builder: (context, shiftState) {
                          // Tombol akan terus loading jika Auth sedang login ATAU Shift sedang dicek
                          final isAuthLoading = authState.maybeWhen(
                            loading: () => true,
                            orElse: () => false,
                          );
                          final isShiftLoading = shiftState.maybeWhen(
                            loading: () => true,
                            orElse: () => false,
                          );

                          return AppButton(
                            label: isShiftLoading
                                ? 'Checking Shift...'
                                : 'Sign In',
                            isLoading: isAuthLoading || isShiftLoading,
                            onPressed: () {
                              if (_credentialController.text.isNotEmpty &&
                                  _passwordController.text.isNotEmpty) {
                                context.read<AuthBloc>().add(
                                  AuthEvent.loginRequested(
                                    credential: _credentialController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Please fill in all fields.'),
                                  ),
                                );
                              }
                            },
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      'v1.0.0 - TAIYO POS System',
                      style: AppTextStyles.label.copyWith(fontSize: 10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
