import 'dart:io';
import 'package:avis_pos/data/model/responses/order_model/order_model.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';
import 'package:intl/intl.dart';

class PrinterService {
  // Singleton Pattern agar instance printer service tidak bocor di memori
  static final PrinterService _instance = PrinterService._internal();
  factory PrinterService() => _instance;
  PrinterService._internal();

  final _currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  // =========================================================================
  // 1. FUNGSI UTAMA PENCETAKAN (PUBLIC)
  // =========================================================================

  /// Test Print Koneksi Hardware
  Future<void> printTest(dynamic printer) async {
    final generator = await _getGenerator(printer);
    List<int> bytes = [];

    bytes += generator.text(
      'TEST PRINT BERHASIL!',
      styles: const PosStyles(
        align: PosAlign.center,
        bold: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    );
    bytes += generator.feed(1);
    bytes += generator.text(
      'Koneksi ke sistem POS berjalan lancar.',
      styles: const PosStyles(align: PosAlign.center),
    );
    bytes += generator.feed(3);
    bytes += generator.cut();

    await _connectAndPrint(printer, bytes);
  }

  /// Cetak Struk Kasir (Ditujukan ke Printer Kasir)
  Future<void> printReceipt(
    dynamic printer,
    OrderModel order, {
    double? amountPaid,
  }) async {
    final generator = await _getGenerator(printer);
    final bytes = _generateReceiptLayout(generator, order, amountPaid);
    await _connectAndPrint(printer, bytes);
  }

  /// Cetak Checker Dapur (Bisa ke Printer Kasir atau Dapur khusus)
  Future<void> printChecker(dynamic printer, OrderModel order) async {
    final generator = await _getGenerator(printer);
    final bytes = _generateCheckerLayout(generator, order);
    await _connectAndPrint(printer, bytes);
  }

  /// Cetak Stiker Label Cup (Ditujukan ke Printer Label khusus)
  Future<void> printCupLabel(dynamic printer, OrderModel order) async {
    final generator = await _getGenerator(printer);
    final bytes = _generateCupLabelLayout(generator, order);

    if (bytes.isNotEmpty) {
      await _connectAndPrint(printer, bytes);
    }
  }

  // =========================================================================
  // 2. HELPERS KONEKSI & GENERATOR
  // =========================================================================

  Future<Generator> _getGenerator(dynamic printer) async {
    final profile = await CapabilityProfile.load();
    // Default fallback ke 80mm jika tidak ada pengaturan kertas
    final paperSize = printer.paperWidth == '58mm'
        ? PaperSize.mm58
        : PaperSize.mm80;
    return Generator(paperSize, profile);
  }

  Future<void> _connectAndPrint(dynamic printer, List<int> bytes) async {
    final connectionType = printer.connectionType?.toLowerCase();

    if (connectionType == 'bluetooth') {
      if (printer.macAddress == null || printer.macAddress!.isEmpty)
        throw Exception('MAC Address kosong.');

      final bool isConnected = await PrintBluetoothThermal.connectionStatus;
      if (!isConnected) {
        final bool connectResult = await PrintBluetoothThermal.connect(
          macPrinterAddress: printer.macAddress!,
        );
        if (!connectResult)
          throw Exception(
            'Gagal terhubung ke Bluetooth Printer ${printer.name}.',
          );
      }

      final bool result = await PrintBluetoothThermal.writeBytes(bytes);
      if (!result)
        throw Exception(
          'Gagal mengirim data cetak ke Bluetooth ${printer.name}.',
        );
    } else if (connectionType == 'lan' || connectionType == 'wifi') {
      if (printer.ipAddress == null || printer.ipAddress!.isEmpty)
        throw Exception('IP Address kosong.');

      Socket? socket;
      try {
        // Timeout 3 detik agar aplikasi tidak hang jika jaringan putus
        socket = await Socket.connect(
          printer.ipAddress,
          9100,
          timeout: const Duration(seconds: 3),
        );
        socket.add(bytes);
        await socket.flush();
      } catch (e) {
        throw Exception(
          'Gagal terhubung ke IP ${printer.ipAddress} (${printer.name}). Periksa jaringan.',
        );
      } finally {
        socket?.destroy();
      }
    } else {
      throw Exception('Tipe koneksi tidak didukung.');
    }
  }

  // =========================================================================
  // 3. LAYOUT DESAIN (STRUK, CHECKER, STIKER)
  // =========================================================================

  /// Layout Struk Kasir (Pelanggan)
  List<int> _generateReceiptLayout(
    Generator generator,
    OrderModel order,
    double? amountPaid,
  ) {
    List<int> bytes = [];
    final dateStr = order.createdAt != null
        ? DateFormat('dd/MM/yyyy HH:mm').format(order.createdAt!)
        : DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());

    bytes += generator.text(
      'TOKO KOPI AVIS',
      styles: const PosStyles(
        align: PosAlign.center,
        bold: true,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    );
    bytes += generator.text(
      'Telp: 081234567890',
      styles: const PosStyles(align: PosAlign.center),
    );
    bytes += generator.feed(1);

    bytes += generator.text('No     : ${order.orderNumber}');
    bytes += generator.text('Tanggal: $dateStr');
    bytes += generator.text(
      'Tipe   : ${order.typeOrder} ${order.tableNumber != null ? "- Meja ${order.tableNumber}" : ""}',
    );
    bytes += generator.text('Tamu   : ${order.customerName ?? "Guest"}');
    bytes += generator.hr();

    for (var item in order.items ?? []) {
      bytes += generator.text(
        item.productName ?? 'Item',
        styles: const PosStyles(bold: true),
      );
      bytes += generator.row([
        PosColumn(text: '${item.quantity} ${item.uom}', width: 3),
        PosColumn(
          text: 'x ${_currencyFormat.format(item.pricePerUom)}',
          width: 4,
        ),
        PosColumn(
          text: _currencyFormat.format(item.totalPrice),
          width: 5,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
      if (item.addons != null && item.addons!.isNotEmpty) {
        for (var addon in item.addons!) {
          bytes += generator.row([
            PosColumn(text: '  + ${addon.name}', width: 7),
            PosColumn(
              text: _currencyFormat.format(addon.total),
              width: 5,
              styles: const PosStyles(align: PosAlign.right),
            ),
          ]);
        }
      }
    }
    bytes += generator.hr();
    bytes += generator.row([
      PosColumn(
        text: 'GRAND TOTAL',
        width: 6,
        styles: const PosStyles(bold: true),
      ),
      PosColumn(
        text: _currencyFormat.format(order.totalPrice),
        width: 6,
        styles: const PosStyles(bold: true, align: PosAlign.right),
      ),
    ]);

    // Pembayaran
    if (amountPaid != null && amountPaid > 0) {
      bytes += generator.hr();
      bytes += generator.row([
        PosColumn(text: 'Bayar', width: 6),
        PosColumn(
          text: _currencyFormat.format(amountPaid),
          width: 6,
          styles: const PosStyles(align: PosAlign.right),
        ),
      ]);
      final change = amountPaid - (order.totalPrice ?? 0);
      if (change > 0) {
        bytes += generator.row([
          PosColumn(text: 'Kembali', width: 6),
          PosColumn(
            text: _currencyFormat.format(change),
            width: 6,
            styles: const PosStyles(align: PosAlign.right),
          ),
        ]);
      }
    }

    bytes += generator.feed(3);
    bytes += generator.cut();
    return bytes;
  }

  /// Layout Checker Dapur (Tanpa Harga)
  List<int> _generateCheckerLayout(Generator generator, OrderModel order) {
    List<int> bytes = [];
    final dateStr = order.createdAt != null
        ? DateFormat('HH:mm').format(order.createdAt!)
        : DateFormat('HH:mm').format(DateTime.now());

    bytes += generator.text(
      '--- TIKET DAPUR ---',
      styles: const PosStyles(
        align: PosAlign.center,
        bold: true,
        width: PosTextSize.size2,
      ),
    );
    bytes += generator.feed(1);

    bytes += generator.text(
      'Order : ${order.orderNumber}',
      styles: const PosStyles(bold: true),
    );
    bytes += generator.text('Jam   : $dateStr');
    bytes += generator.text(
      'Tipe  : ${order.typeOrder}',
      styles: const PosStyles(bold: true),
    );
    if (order.tableNumber != null)
      bytes += generator.text(
        'Meja  : ${order.tableNumber}',
        styles: const PosStyles(
          bold: true,
          height: PosTextSize.size2,
          width: PosTextSize.size2,
        ),
      );
    bytes += generator.text('Tamu  : ${order.customerName ?? "Guest"}');
    bytes += generator.hr();

    for (var item in order.items ?? []) {
      bytes += generator.text(
        '[ ${item.quantity} ${item.uom} ] ${item.productName}',
        styles: const PosStyles(bold: true, height: PosTextSize.size2),
      );
      if (item.addons != null && item.addons!.isNotEmpty) {
        for (var addon in item.addons!) {
          bytes += generator.text('   + ${addon.quantity}x ${addon.name}');
        }
      }
      if (item.note != null && item.note!.isNotEmpty) {
        bytes += generator.text(
          '   Catatan: ${item.note}',
          styles: const PosStyles(reverse: true),
        );
      }
      bytes += generator.feed(1);
    }

    bytes += generator.hr();
    bytes += generator.feed(3);
    bytes += generator.cut();
    return bytes;
  }

  /// Layout Stiker Cup (Cetak 1 label untuk setiap 1 cup minuman dengan Nama Produk Dinamis)
  List<int> _generateCupLabelLayout(Generator generator, OrderModel order) {
    List<int> bytes = [];
    final dateStr = order.createdAt != null
        ? DateFormat('dd/MM HH:mm').format(order.createdAt!)
        : DateFormat('dd/MM HH:mm').format(DateTime.now());

    for (var item in order.items ?? []) {
      final int qty = (item.quantity ?? 1).toInt();

      for (int i = 1; i <= qty; i++) {
        // --- NAMA PRODUK DINAMIS SEBAGAI HEADER UTAMA ---
        bytes += generator.text(
          (item.productName ?? 'PRODUK').toUpperCase(),
          styles: const PosStyles(
            align: PosAlign.center,
            bold: true,
            height: PosTextSize.size2,
          ),
        );

        // --- INFO PELANGGAN & JAM ---
        bytes += generator.text(
          '${order.customerName ?? "Guest"} | $dateStr',
          styles: const PosStyles(align: PosAlign.center),
        );
        bytes += generator.hr();

        // --- DETAIL CUP & UOM ---
        bytes += generator.text(
          'Cup $i dari $qty (${item.uom})',
          styles: const PosStyles(bold: true),
        );

        // --- ADDONS / TOPPING ---
        if (item.addons != null && item.addons!.isNotEmpty) {
          for (var addon in item.addons!) {
            bytes += generator.text('+ ${addon.name}');
          }
        }

        // --- CATATAN ---
        if (item.note != null && item.note!.isNotEmpty) {
          bytes += generator.text('Note: ${item.note}');
        }

        // --- INFO KALORI ---
        if (item.calories != null && item.calories! > 0) {
          bytes += generator.feed(1);
          bytes += generator.text(
            '${item.calories} kcal',
            styles: const PosStyles(align: PosAlign.right, bold: true),
          );
        }

        bytes += generator.feed(2);
        bytes += generator.cut(); // Perintah potong per stiker continuous
      }
    }
    return bytes;
  }
}
