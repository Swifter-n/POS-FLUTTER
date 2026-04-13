import 'package:avis_pos/core/constants/colors.dart';
import 'package:avis_pos/presentation/home/bloc/category/category_bloc.dart';
import 'package:avis_pos/presentation/home/bloc/product/product_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryHorizontalList extends StatefulWidget {
  const CategoryHorizontalList({super.key});

  @override
  State<CategoryHorizontalList> createState() => _CategoryHorizontalListState();
}

class _CategoryHorizontalListState extends State<CategoryHorizontalList> {
  int? _selectedCategoryId;

  void _onCategoryTapped(int? categoryId) {
    setState(() {
      _selectedCategoryId = categoryId;
    });

    if (categoryId == null) {
      context.read<ProductBloc>().add(const ProductEvent.fetch());
    } else {
      context.read<ProductBloc>().add(ProductEvent.fetchByCategory(categoryId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80, // Tinggi yang pas untuk menu horizontal
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(
              child: Text(message, style: const TextStyle(color: Colors.red)),
            ),
            loaded: (categories) {
              return ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                children: [
                  // Tombol "Semua Kategori"
                  _buildCategoryItem(
                    context: context,
                    id: null,
                    name: 'Semua Kategori',
                    iconUrl: null,
                    isSelected: _selectedCategoryId == null,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: VerticalDivider(
                      color: AppColors.stroke,
                      thickness: 1,
                    ),
                  ),
                  // List Kategori dari API
                  ...categories.map(
                    (category) => _buildCategoryItem(
                      context: context,
                      id: category.id,
                      name: category.name,
                      iconUrl: category.icon,
                      isSelected: _selectedCategoryId == category.id,
                    ),
                  ),
                ],
              );
            },
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }

  Widget _buildCategoryItem({
    required BuildContext context,
    required int? id,
    required String name,
    required String? iconUrl,
    required bool isSelected,
  }) {
    return InkWell(
      onTap: () => _onCategoryTapped(id),
      borderRadius: BorderRadius.circular(24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.grey.shade300,
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [],
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (iconUrl != null && iconUrl.isNotEmpty) ...[
              CachedNetworkImage(
                imageUrl: iconUrl,
                width: 24,
                height: 24,
                color: isSelected ? Colors.white : AppColors.primary,
                errorWidget: (context, url, error) => Icon(
                  Icons.fastfood,
                  size: 20,
                  color: isSelected ? Colors.white : AppColors.primary,
                ),
              ),
              const SizedBox(width: 8),
            ] else ...[
              Icon(
                Icons.grid_view_rounded,
                size: 20,
                color: isSelected ? Colors.white : AppColors.primary,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: isSelected ? Colors.white : Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
