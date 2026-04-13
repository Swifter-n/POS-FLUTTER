import 'package:avis_pos/data/model/payloads/cart_item_payload/cart_item_payload.dart';
import 'package:avis_pos/data/model/payloads/quick_checkout_payload/quick_checkout_payload.dart';
import 'package:avis_pos/data/model/responses/order_model/order_model.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final IPosRepository _repository;

  CartBloc(this._repository) : super(const CartState.initial()) {
    on<_Started>(_onStarted);
    on<_AddItem>(_onAddItem);
    on<_RemoveItem>(_onRemoveItem);
    on<_UpdateQuantity>(_onUpdateQuantity);
    on<_ClearCart>(_onClearCart);
    on<_Checkout>(_onCheckout);
    on<_IgnorePromo>(_onIgnorePromo);

    // ✅ DAFTARKAN EVENT SET CONTEXT
    on<_SetContext>(_onSetContext);
  }

  void _onStarted(_Started event, Emitter<CartState> emit) {
    emit(const CartState.loaded());
  }

  // ✅ LOGIKA SET CONTEXT
  void _onSetContext(_SetContext event, Emitter<CartState> emit) {
    // Saat kasir mengklik "Tambah Pesanan" dari Denah Meja,
    // keranjang dikosongkan (agar tidak kecampur belanjaan orang lain)
    // dan konteks meja disematkan.
    emit(
      CartState.loaded(
        tableNumber: event.tableNumber,
        activeOrder: event.activeOrder,
      ),
    );
  }

  Future<void> _onAddItem(_AddItem event, Emitter<CartState> emit) async {
    List<CartItemPayload> updatedItems = [];
    List<String> currentIgnored = [];
    String? currentTable;
    OrderModel? currentOrder;

    state.maybeWhen(
      loaded:
          (
            items,
            subtotal,
            discount,
            tax,
            appliedPromos,
            ignoredRules,
            tableNumber,
            activeOrder,
          ) {
            currentIgnored = ignoredRules;
            currentTable = tableNumber;
            currentOrder = activeOrder;

            updatedItems = List.from(items);
            final existingIndex = updatedItems.indexWhere(
              (item) =>
                  item.productId == event.item.productId &&
                  item.uom == event.item.uom &&
                  _isSameAddons(item.addons ?? [], event.item.addons ?? []) &&
                  item.note == event.item.note,
            );

            if (existingIndex >= 0) {
              final existingItem = updatedItems[existingIndex];
              updatedItems[existingIndex] = existingItem.copyWith(
                quantity: existingItem.quantity + event.item.quantity,
              );
            } else {
              updatedItems.add(event.item);
            }
          },
      orElse: () {
        updatedItems.add(event.item);
      },
    );

    final newState = await _calculateCartState(
      updatedItems,
      ignoredRules: currentIgnored,
      tableNumber: currentTable,
      activeOrder: currentOrder,
    );

    if (!emit.isDone) emit(newState);
  }

  Future<void> _onRemoveItem(_RemoveItem event, Emitter<CartState> emit) async {
    List<CartItemPayload> updatedItems = [];
    List<String> currentIgnored = [];
    String? currentTable;
    OrderModel? currentOrder;

    state.maybeWhen(
      loaded:
          (
            items,
            subtotal,
            discount,
            tax,
            appliedPromos,
            ignoredRules,
            tableNumber,
            activeOrder,
          ) {
            currentIgnored = ignoredRules;
            currentTable = tableNumber;
            currentOrder = activeOrder;

            updatedItems = items
                .where(
                  (item) =>
                      !(item.productId == event.productId &&
                          item.uom == event.uom),
                )
                .toList();
          },
      orElse: () {},
    );

    final newState = await _calculateCartState(
      updatedItems,
      ignoredRules: currentIgnored,
      tableNumber: currentTable,
      activeOrder: currentOrder,
    );
    if (!emit.isDone) emit(newState);
  }

  Future<void> _onUpdateQuantity(
    _UpdateQuantity event,
    Emitter<CartState> emit,
  ) async {
    List<CartItemPayload> updatedItems = [];
    List<String> currentIgnored = [];
    String? currentTable;
    OrderModel? currentOrder;

    state.maybeWhen(
      loaded:
          (
            items,
            subtotal,
            discount,
            tax,
            appliedPromos,
            ignoredRules,
            tableNumber,
            activeOrder,
          ) {
            currentIgnored = ignoredRules;
            currentTable = tableNumber;
            currentOrder = activeOrder;

            for (var item in items) {
              if (item.productId == event.productId && item.uom == event.uom) {
                if (event.quantity > 0) {
                  updatedItems.add(item.copyWith(quantity: event.quantity));
                }
              } else {
                updatedItems.add(item);
              }
            }
          },
      orElse: () {},
    );

    final newState = await _calculateCartState(
      updatedItems,
      ignoredRules: currentIgnored,
      tableNumber: currentTable,
      activeOrder: currentOrder,
    );
    if (!emit.isDone) emit(newState);
  }

  void _onClearCart(_ClearCart event, Emitter<CartState> emit) {
    // Reset seluruh state ke kondisi default yang suci (tanpa konteks)
    emit(const CartState.loaded());
  }

  Future<void> _onCheckout(_Checkout event, Emitter<CartState> emit) async {
    final currentState = state;
    emit(const CartState.loading());

    final result = await _repository.processQuickCheckout(event.payload);

    if (!emit.isDone) {
      result.fold(
        (failure) {
          emit(
            CartState.error(failure.message ?? 'Gagal memproses pembayaran'),
          );
          if (currentState is _Loaded) emit(currentState);
        },
        (order) {
          emit(CartState.checkoutSuccess(order));
          // Reset cart setelah sukses bayar
          emit(const CartState.loaded());
        },
      );
    }
  }

  Future<void> _onIgnorePromo(
    _IgnorePromo event,
    Emitter<CartState> emit,
  ) async {
    await state.maybeWhen(
      loaded:
          (
            items,
            subtotal,
            discount,
            tax,
            appliedPromos,
            ignoredRules,
            tableNumber,
            activeOrder,
          ) async {
            final newList = List<String>.from(ignoredRules);
            if (newList.contains(event.ruleName)) {
              newList.remove(event.ruleName);
            } else {
              newList.add(event.ruleName);
            }

            final newState = await _calculateCartState(
              items,
              ignoredRules: newList,
              tableNumber: tableNumber,
              activeOrder: activeOrder,
            );
            if (!emit.isDone) emit(newState);
          },
      orElse: () async {},
    );
  }

  // ✅ HELPER: Membawa tableNumber dan activeOrder setiap kali di-kalkulasi
  Future<CartState> _calculateCartState(
    List<CartItemPayload> items, {
    List<String> ignoredRules = const [],
    String? tableNumber,
    OrderModel? activeOrder,
  }) async {
    double subtotal = 0;

    for (var item in items) {
      double itemTotal = item.price;
      if (item.addons != null) {
        for (var addon in item.addons!) {
          itemTotal += (addon.price ?? 0) * addon.quantity;
        }
      }
      subtotal += (itemTotal * item.quantity);
    }

    double discount = 0;
    List<String> appliedRules = [];

    if (items.isNotEmpty) {
      try {
        final payload = {
          'items': items.map((item) => item.toJson()).toList(),
          'sub_total': subtotal,
          'promo_code_input': null,
          'member_id': null,
          'use_points': false,
          'ignored_rules': ignoredRules,
        };

        final result = await _repository.checkPromo(payload);

        result.fold((failure) => print('PROMO API ERROR: ${failure.message}'), (
          responseMap,
        ) {
          final rawDiscount = responseMap['total_discount'];
          discount = double.tryParse(rawDiscount?.toString() ?? '0') ?? 0;

          if (responseMap['applied_rules'] != null) {
            final rulesList = responseMap['applied_rules'] as List;
            appliedRules = rulesList.map((rule) {
              if (rule is Map)
                return rule['name']?.toString() ??
                    rule['type']?.toString() ??
                    'PROMO';
              return rule.toString();
            }).toList();
          }
        });
      } catch (e) {
        print('PROMO PARSING ERROR: $e');
      }
    }

    double tax = (subtotal - discount) * 0.10;

    return CartState.loaded(
      items: items,
      subtotal: subtotal,
      discount: discount,
      tax: tax,
      appliedPromos: appliedRules,
      ignoredRules: ignoredRules,
      tableNumber: tableNumber, // ✅ Konteks tetap hidup
      activeOrder: activeOrder, // ✅ Konteks tetap hidup
    );
  }

  bool _isSameAddons(List<dynamic> addons1, List<dynamic> addons2) {
    if (addons1.length != addons2.length) return false;
    final ids1 = addons1.map((a) => a.addonId).toList()..sort();
    final ids2 = addons2.map((a) => a.addonId).toList()..sort();
    for (int i = 0; i < ids1.length; i++) {
      if (ids1[i] != ids2[i]) return false;
    }
    return true;
  }
}
