import 'package:avis_pos/core/components/buttons.dart';
import 'package:avis_pos/core/components/form_fields.dart';
import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/auth/pages/login_page.dart';
import 'package:avis_pos/presentation/shift/bloc/shift/shift_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CloseShiftPage extends StatefulWidget {
  const CloseShiftPage({super.key});

  @override
  State<CloseShiftPage> createState() => _CloseShiftPageState();
}

class _CloseShiftPageState extends State<CloseShiftPage> {
  final TextEditingController _actualAmountController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  double _actualCash = 0;

  final currencyFormatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  @override
  void initState() {
    super.initState();
    print('🚨 >>> CLOSE SHIFT PAGE INIT STATE TERPANGGIL!');
    print(StackTrace.current.toString());

    // Defer the ancestor visit until after initState completes, avoiding framework errors
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('🌳 >>> WIDGET TREE ANCESTORS OF CLOSESHIFTPAGE:');
      try {
        int depth = 0;
        context.visitAncestorElements((element) {
          print('    [$depth] ${element.widget.runtimeType}');
          depth++;
          // Batasi maksimal kedalaman agar log tidak terlalu panjang
          if (depth > 1000) return false;
          return true; // continue traversing
        });
      } catch (e) {
        print('Error reading ancestors: $e');
      }
    });
    // Tarik ringkasan shift saat halaman dibuka
    context.read<ShiftBloc>().add(const ShiftEvent.fetchSummary());

    // Listener untuk menghitung uang secara real-time saat kasir mengetik
    _actualAmountController.addListener(() {
      final text = _actualAmountController.text.replaceAll(
        RegExp(r'[^0-9]'),
        '',
      );
      setState(() {
        _actualCash = text.isNotEmpty ? double.parse(text) : 0;
      });
    });
  }

  @override
  void dispose() {
    _actualAmountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  void _submit() {
    context.read<ShiftBloc>().add(
      ShiftEvent.close(_actualCash, _noteController.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Tutup Kasir (Close Shift)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: BlocConsumer<ShiftBloc, ShiftState>(
        listener: (context, state) {
          state.maybeWhen(
            closed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Shift closed successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
              // Kick user kembali ke halaman Login setelah shift tutup
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
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
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            summaryLoaded: (summary) {
              final double expectedCash = summary.expectedCash ?? 0.0;
              final double cashSales = summary.cashSales ?? 0.0;
              final double cardSales = summary.cardSales ?? 0.0;
              final double openingAmount = summary.openingAmount ?? 0.0;
              final double pointsRedeemed = summary.totalPointsRedeemed ?? 0.0;
              final int transactions = summary.totalTransactions ?? 0;

              // Kalkulasi Selisih
              final double difference = _actualCash - expectedCash;

              return Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: 550,
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 20,
                        ),
                      ],
                      border: Border.all(color: AppColors.stroke),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Todays Sales Summary',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade50,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.stroke),
                          ),
                          child: Column(
                            children: [
                              _buildSummaryRow(
                                'Total Transactions',
                                '$transactions Struk',
                                isBold: true,
                              ),
                              const Divider(height: 24),
                              _buildSummaryRow(
                                'Cash Sales',
                                currencyFormatter.format(cashSales),
                              ),
                              _buildSummaryRow(
                                'Non-Cash Sales (EDC/QRIS)',
                                currencyFormatter.format(cardSales),
                              ),
                              if (pointsRedeemed > 0)
                                _buildSummaryRow(
                                  'Member Points Redeemed',
                                  '- ${currencyFormatter.format(pointsRedeemed)}',
                                  color: Colors.orange,
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // UANG FISIK (LACI KASIR) ---
                        const Text(
                          'Cash Drawer Calculation',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),

                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: AppColors.primary),
                          ),
                          child: Column(
                            children: [
                              _buildSummaryRow(
                                'Opening Capital',
                                currencyFormatter.format(openingAmount),
                              ),
                              _buildSummaryRow(
                                'Cash Sales (Cash)',
                                '+ ${currencyFormatter.format(cashSales)}',
                              ),
                              const Divider(
                                height: 24,
                                color: AppColors.primary,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Expected Cash in Drawer',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    currencyFormatter.format(expectedCash),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryDark,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),

                        // INPUT ACTUAL CASH & SELISIH
                        TextFormField(
                          controller: _actualAmountController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [_CurrencyFormatter()],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            labelText: 'Actual Cash (Count in Drawer)',
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
                        const SizedBox(height: 16),

                        // Selisih Real-time
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: difference < 0
                                ? Colors.red.shade50
                                : (difference > 0
                                      ? Colors.blue.shade50
                                      : Colors.green.shade50),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: difference < 0
                                  ? Colors.red.shade200
                                  : (difference > 0
                                        ? Colors.blue.shade200
                                        : Colors.green.shade200),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                difference < 0
                                    ? 'Cash Shortage (Minus)'
                                    : (difference > 0
                                          ? 'Cash Overage (Plus)'
                                          : 'Cash Balance (Pas)'),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: difference < 0
                                      ? Colors.red.shade700
                                      : (difference > 0
                                            ? Colors.blue.shade700
                                            : Colors.green.shade700),
                                ),
                              ),
                              Text(
                                currencyFormatter.format(difference),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: difference < 0
                                      ? Colors.red.shade700
                                      : (difference > 0
                                            ? Colors.blue.shade700
                                            : Colors.green.shade700),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),

                        AppTextField(
                          label: 'Note (Required if there is a difference)',
                          hint:
                              'Example: Short 5000 because used to pay for delivery',
                          controller: _noteController,
                        ),

                        const SizedBox(height: 32),
                        AppButton(
                          label: 'Confirm Close Shift',
                          onPressed: () {
                            if (difference != 0 &&
                                _noteController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Note is required if there is a difference',
                                  ),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }
                            _submit();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            orElse: () =>
                const Center(child: Text('Failed to load shift summary')),
          );
        },
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isBold = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              fontSize: 14,
              color: color ?? AppColors.textPrimary,
            ),
          ),
        ],
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
