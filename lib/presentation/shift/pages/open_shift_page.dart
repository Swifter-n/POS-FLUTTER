import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/pages/homepage.dart';
import 'package:avis_pos/presentation/shift/bloc/shift/shift_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OpenShiftPage extends StatefulWidget {
  const OpenShiftPage({super.key});

  @override
  State<OpenShiftPage> createState() => _OpenShiftPageState();
}

class _OpenShiftPageState extends State<OpenShiftPage> {
  final TextEditingController _amountController = TextEditingController();

  final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _submit() {
    final amountText = _amountController.text.replaceAll(RegExp(r'[^0-9]'), '');
    final openingAmount = double.tryParse(amountText) ?? 0.0;

    context.read<ShiftBloc>().add(ShiftEvent.open(openingAmount));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          width: 450,
          padding: const EdgeInsets.all(40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            border: Border.all(color: AppColors.stroke),
          ),
          child: BlocConsumer<ShiftBloc, ShiftState>(
            listener: (context, state) {
              state.maybeWhen(
                opened: (shift) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Shift started, Good luck with your assignment.',
                      ),
                      backgroundColor: AppColors.primary,
                    ),
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const Homepage()),
                    (route) => false,
                  );
                },
                error: (msg) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(msg), backgroundColor: Colors.red),
                ),
                orElse: () {},
              );
            },
            builder: (context, state) {
              bool isLoading = false;
              state.maybeWhen(loading: () => isLoading = true, orElse: () {});

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.point_of_sale,
                      size: 56,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 24),

                  const Text(
                    'Open Shift',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Please enter the amount of cash in the cash drawer as the initial capital.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),

                  TextFormField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [_CurrencyFormatter()],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Initial Capital',
                      hintText: 'Rp 0',
                      prefixIcon: const Icon(
                        Icons.payments,
                        color: AppColors.primary,
                        size: 28,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 16,
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: AppButton(
                      label: isLoading ? 'Opening...' : 'OPEN SHIFT NOW',
                      onPressed: isLoading ? () {} : _submit,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _CurrencyFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) return newValue;
    final intValue = int.tryParse(
      newValue.text.replaceAll(RegExp(r'[^0-9]'), ''),
    );
    if (intValue == null) return oldValue;
    final newString = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    ).format(intValue);
    return TextEditingValue(
      text: newString,
      selection: TextSelection.collapsed(offset: newString.length),
    );
  }
}
