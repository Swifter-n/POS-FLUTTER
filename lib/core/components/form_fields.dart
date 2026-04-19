import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String? hint; // Changed to optional to support initialValue
  final TextEditingController? controller; // Changed to optional
  final bool isPassword;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final bool readOnly;
  final int? maxLines;
  final String? initialValue;
  final ValueChanged<String>? onChanged;
  final TextSelectionControls? selectionControls;
  final EditableTextContextMenuBuilder? contextMenuBuilder;
  final VoidCallback? onTap;

  const AppTextField({
    super.key,
    required this.label,
    this.hint,
    this.controller,
    this.isPassword = false,
    this.prefixIcon,
    this.keyboardType,
    this.readOnly = false,
    this.maxLines = 1,
    this.initialValue,
    this.onChanged,
    this.selectionControls,
    this.contextMenuBuilder,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: AppTextStyles.label.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
        ],
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          keyboardType: keyboardType,
          readOnly: readOnly,
          maxLines: maxLines,
          initialValue: initialValue,
          onChanged: onChanged,
          selectionControls: selectionControls,
          contextMenuBuilder: contextMenuBuilder,
          onTap: onTap,
          style: AppTextStyles.body,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: AppColors.background,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
