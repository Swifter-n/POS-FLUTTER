import 'package:avis_pos/presentation/member/bloc/member/member_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberCheckDialog extends StatefulWidget {
  const MemberCheckDialog({super.key});

  @override
  State<MemberCheckDialog> createState() => _MemberCheckDialogState();
}

class _MemberCheckDialogState extends State<MemberCheckDialog> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MemberBloc, MemberState>(
      listener: (context, state) {
        state.maybeWhen(
          memberFound: (memberFromApi) {
            // Jika ketemu, kembalikan object member-nya ke halaman yang memanggil dialog ini
            Navigator.pop(context, memberFromApi);
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
            'Cari / Scan Member',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'Scan Barcode atau ketik No. HP',
                  prefixIcon: Icon(Icons.qr_code_scanner),
                ),
                autofocus: true,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    context.read<MemberBloc>().add(
                      MemberEvent.checkMember(value),
                    );
                  }
                },
              ),
              if (isLoading)
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      if (_searchController.text.isNotEmpty) {
                        context.read<MemberBloc>().add(
                          MemberEvent.checkMember(_searchController.text),
                        );
                      }
                    },
              child: Text(isLoading ? 'Mencari...' : 'Cek Member'),
            ),
          ],
        );
      },
    );
  }
}
