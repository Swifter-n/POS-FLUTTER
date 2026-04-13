import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/settings/bloc/printer/printer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrinterSettingsPage extends StatefulWidget {
  const PrinterSettingsPage({super.key});

  @override
  State<PrinterSettingsPage> createState() => _PrinterSettingsPageState();
}

class _PrinterSettingsPageState extends State<PrinterSettingsPage> {
  @override
  void initState() {
    super.initState();
    // Tarik data printer saat halaman dibuka
    context.read<PrinterBloc>().add(const PrinterEvent.fetchSettings());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Pengaturan Printer',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => context.read<PrinterBloc>().add(
              const PrinterEvent.fetchSettings(),
            ),
            tooltip: 'Refresh Printer',
          ),
        ],
      ),
      body: BlocBuilder<PrinterBloc, PrinterState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
            error: (msg) => Center(
              child: Text(msg, style: const TextStyle(color: Colors.red)),
            ),
            loaded: (printerData) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<PrinterBloc>().add(
                    const PrinterEvent.fetchSettings(),
                  );
                },
                child: ListView(
                  padding: const EdgeInsets.all(24.0),
                  children: [
                    // --- SECTION 1: PRINTER DEFAULT (KASIR) ---
                    const Text(
                      'Printer Utama (Struk/Kasir)',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (printerData.defaultPrinter != null)
                      _buildPrinterCard(
                        printerData.defaultPrinter,
                        isDefault: true,
                      )
                    else
                      _buildEmptyCard(
                        'Belum ada printer default yang diset dari Backoffice.',
                      ),

                    const SizedBox(height: 32),

                    // --- SECTION 2: SEMUA PRINTER DI OUTLET ---
                    const Text(
                      'Semua Printer di Outlet Ini',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (printerData.allPrinters != null &&
                        printerData.allPrinters!.isNotEmpty)
                      ...printerData.allPrinters!
                          .map(
                            (printer) => Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: _buildPrinterCard(
                                printer,
                                isDefault:
                                    printer.id ==
                                    printerData.defaultPrinter?.id,
                              ),
                            ),
                          )
                          .toList()
                    else
                      _buildEmptyCard(
                        'Tidak ada printer yang terdaftar untuk outlet ini.',
                      ),
                  ],
                ),
              );
            },
            orElse: () => const Center(child: Text('Memuat data...')),
          );
        },
      ),
    );
  }

  // --- WIDGET: KARTU PRINTER ---
  Widget _buildPrinterCard(dynamic printer, {bool isDefault = false}) {
    // Menentukan Icon berdasarkan Connection Type (lan / bluetooth / usb)
    IconData typeIcon = Icons.print;
    String typeLabel = 'Unknown';
    Color typeColor = Colors.grey;

    if (printer.connectionType?.toLowerCase() == 'bluetooth') {
      typeIcon = Icons.bluetooth;
      typeLabel = 'Bluetooth';
      typeColor = Colors.blue;
    } else if (printer.connectionType?.toLowerCase() == 'lan' ||
        printer.connectionType?.toLowerCase() == 'wifi') {
      typeIcon = Icons.wifi;
      typeLabel = 'Network (LAN/WiFi)';
      typeColor = Colors.green;
    } else if (printer.connectionType?.toLowerCase() == 'usb') {
      typeIcon = Icons.usb;
      typeLabel = 'USB Cable';
      typeColor = Colors.orange;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDefault ? AppColors.primary : AppColors.stroke,
          width: isDefault ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Printer
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: typeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(typeIcon, size: 32, color: typeColor),
          ),
          const SizedBox(width: 16),

          // Informasi Printer
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        printer.name ?? 'Printer Tanpa Nama',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    if (isDefault)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'DEFAULT',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 8),

                // Detail Alamat (MAC atau IP)
                Row(
                  children: [
                    const Icon(
                      Icons.settings_ethernet,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      printer.connectionType?.toLowerCase() == 'bluetooth'
                          ? 'MAC: ${printer.macAddress ?? "-"}'
                          : 'IP: ${printer.ipAddress ?? "-"}',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                // Kertas Width
                Row(
                  children: [
                    const Icon(
                      Icons.receipt_long,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Kertas: ${printer.paperWidth ?? "80mm"}',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Tombol Test Print
          Column(
            children: [
              OutlinedButton.icon(
                onPressed: () {
                  context.read<PrinterBloc>().add(
                    PrinterEvent.testPrint(printer),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Mengirim perintah Test Print...'),
                    ),
                  );
                },
                icon: const Icon(Icons.print, size: 16),
                label: const Text('Test'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCard(String message) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.grey.shade300,
          style: BorderStyle.solid,
        ),
      ),
      child: Column(
        children: [
          Icon(Icons.print_disabled, size: 48, color: Colors.grey.shade400),
          const SizedBox(height: 12),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}
