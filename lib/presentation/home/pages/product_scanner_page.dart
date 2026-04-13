import 'package:avis_pos/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ProductScannerPage extends StatefulWidget {
  const ProductScannerPage({super.key});

  @override
  State<ProductScannerPage> createState() => _ProductScannerPageState();
}

class _ProductScannerPageState extends State<ProductScannerPage> {
  final MobileScannerController controller = MobileScannerController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Barcode Produk'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        actions: [
          ValueListenableBuilder<MobileScannerState>(
            valueListenable: controller,
            builder: (context, state, child) {
              final torchState = state.torchState;
              switch (torchState) {
                case TorchState.on:
                  return IconButton(
                    icon: const Icon(Icons.flash_on, color: AppColors.tertiary),
                    onPressed: () => controller.toggleTorch(),
                  );
                case TorchState.off:
                case TorchState.unavailable:
                case TorchState.auto:
                  return IconButton(
                    icon: const Icon(Icons.flash_off, color: Colors.grey),
                    onPressed: torchState == TorchState.unavailable
                        ? null
                        : () => controller.toggleTorch(),
                  );
              }
            },
          ),
          ValueListenableBuilder<MobileScannerState>(
            valueListenable: controller,
            builder: (context, state, child) {
              final facing = state.cameraDirection;
              switch (facing) {
                case CameraFacing.front:
                  return IconButton(
                    icon: const Icon(Icons.camera_front),
                    onPressed: () => controller.switchCamera(),
                  );
                case CameraFacing.back:
                case CameraFacing.external:
                case CameraFacing.unknown:
                  return IconButton(
                    icon: const Icon(Icons.camera_rear),
                    onPressed: () => controller.switchCamera(),
                  );
              }
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          MobileScanner(
            controller: controller,
            onDetect: (capture) {
              final List<Barcode> barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                if (barcode.rawValue != null) {
                  final String code = barcode.rawValue!;
                  // Kembalikan code barcode ke halaman pemanggil (MobileProductView/Cart)
                  Navigator.pop(context, code);
                  break;
                }
              }
            },
          ),
          // Overlay UI Scanner
          Center(
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 4),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
          const Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Text(
              'Arahkan kamera ke barcode produk',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 4, color: Colors.black)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
