import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/member/bloc/member/member_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberRegisterDialog extends StatefulWidget {
  const MemberRegisterDialog({super.key});

  @override
  State<MemberRegisterDialog> createState() => _MemberRegisterDialogState();
}

class _MemberRegisterDialogState extends State<MemberRegisterDialog> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MemberBloc, MemberState>(
      listener: (context, state) {
        state.maybeWhen(
          success: (msg) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg), backgroundColor: Colors.green),
            );
            Navigator.pop(context, true); // Return true menandakan sukses
          },
          error: (msg) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(msg), backgroundColor: Colors.red),
            );
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        bool isLoading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Daftar Member Baru',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            width: 400,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(
                    label: 'Nama Lengkap *',
                    controller: _nameController,
                    hint: 'Contoh: Budi Santoso',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    label: 'Nomor WhatsApp *',
                    controller: _phoneController,
                    hint: 'Contoh: 08123456789',
                    keyboardType: TextInputType.phone,
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    label: 'Email (Opsional)',
                    controller: _emailController,
                    hint: 'Contoh: budi@email.com',
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: isLoading ? null : () => Navigator.pop(context, false),
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      if (_formKey.currentState!.validate() &&
                          _nameController.text.isNotEmpty &&
                          _phoneController.text.isNotEmpty) {
                        context.read<MemberBloc>().add(
                          MemberEvent.registerMember({
                            'name': _nameController.text,
                            'phone': _phoneController.text,
                            'email': _emailController.text,
                          }),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Nama dan Nomor HP wajib diisi!'),
                          ),
                        );
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                isLoading ? 'Menyimpan...' : 'Simpan Member',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
