import 'package:avis_pos/presentation/auth/bloc/auth/auth_bloc.dart';
import 'package:avis_pos/presentation/home/pages/homepage.dart';
import 'package:avis_pos/presentation/shift/bloc/shift/shift_bloc.dart';
import 'package:avis_pos/presentation/shift/pages/open_shift_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/core/constants/text_styles.dart';
import 'package:avis_pos/presentation/auth/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // 1. TRIGGER PENGECEKAN AUTH SAAT APLIKASI DIBUKA
    // Beri jeda 1 detik agar logo aplikasi terlihat, lalu tembak API
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        context.read<AuthBloc>().add(const AuthEvent.checkAuthStatus());
      }
    });
  }

  void _showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Row(
          children: [
            Icon(Icons.wifi_off_rounded, color: AppColors.red),
            SizedBox(width: 10),
            Text('Tidak Ada Internet'),
          ],
        ),
        content: const Text(
          'Pastikan perangkat Anda terhubung ke internet untuk masuk ke sistem TAIYO POS.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Coba cek auth lagi
              context.read<AuthBloc>().add(const AuthEvent.checkAuthStatus());
            },
            child: const Text(
              'Coba Lagi',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: MultiBlocListener(
        listeners: [
          // --- LISTENER 1: CEK TOKEN / LOGIN ---
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                authenticated: (user) {
                  // 2. JIKA TOKEN VALID, JANGAN LANGSUNG KE HOMEPAGE
                  // Cek dulu apakah kasir sudah buka laci (Open Shift) hari ini
                  context.read<ShiftBloc>().add(const ShiftEvent.checkStatus());
                },
                unauthenticated: (message) {
                  if (message.toLowerCase().contains('network') ||
                      message.toLowerCase().contains('connection') ||
                      message.toLowerCase().contains('socket')) {
                    _showNoInternetDialog(context);
                  } else {
                    // Jika token expire / belum login, lempar ke halaman Login
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginPage()),
                    );
                  }
                },
                orElse: () {},
              );
            },
          ),

          // --- LISTENER 2: CEK STATUS LACI KASIR (SHIFT) ---
          BlocListener<ShiftBloc, ShiftState>(
            listener: (context, state) {
              state.maybeWhen(
                opened: (shift) {
                  // Jika laci sudah dibuka, masuk ke Homepage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const Homepage()),
                  );
                },
                closed: () {
                  // Jika laci belum dibuka, paksa kasir ke Open Shift Page
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const OpenShiftPage()),
                  );
                },
                error: (message) {
                  // Jika gagal ngecek API shift, amannya arahkan ke Open Shift
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Icon(
                  Icons.coffee_rounded,
                  size: 80,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'TAIYO POS',
                style: AppTextStyles.headline.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 50),

              // Indikator Loading
              const CircularProgressIndicator(color: AppColors.tertiary),
            ],
          ),
        ),
      ),
    );
  }
}
