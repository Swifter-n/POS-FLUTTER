import 'package:avis_pos/data/model/payloads/cart_item_payload/cart_item_payload.dart';
import 'package:avis_pos/data/model/payloads/open_bill_payload/open_bill_payload.dart';
import 'package:avis_pos/data/model/responses/order_model/order_model.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'open_bill_event.dart';
part 'open_bill_state.dart';
part 'open_bill_bloc.freezed.dart';

class OpenBillBloc extends Bloc<OpenBillEvent, OpenBillState> {
  final IPosRepository _repository;

  OpenBillBloc(this._repository) : super(const OpenBillState.initial()) {
    on<_FetchOpenBills>(_onFetchOpenBills);
    on<_CreateOpenBill>(_onCreateOpenBill);
    on<_AddItemToBill>(_onAddItemToBill);
    on<_RemoveItemFromBill>(_onRemoveItemFromBill); // Handler Baru
    on<_PayBill>(_onPayBill);
    on<_CancelBill>(_onCancelBill);
    on<_SelectBill>(_onSelectBill);
    on<_ToggleUsePoints>(_onToggleUsePoints);
    on<_IgnorePromo>(_onIgnorePromo);
    on<_ResetIgnored>(_onResetIgnored);
  }

  Future<void> _onFetchOpenBills(
    _FetchOpenBills event,
    Emitter<OpenBillState> emit,
  ) async {
    emit(const OpenBillState.loading());
    final result = await _repository.getOpenOrders();
    result.fold(
      (failure) => emit(
        OpenBillState.error(failure.message ?? 'Gagal mengambil data tagihan'),
      ),
      (orders) => emit(OpenBillState.loaded(orders: orders)),
    );
  }

  Future<void> _onCreateOpenBill(
    _CreateOpenBill event,
    Emitter<OpenBillState> emit,
  ) async {
    emit(const OpenBillState.loading());
    final result = await _repository.openBill(event.payload);
    result.fold(
      (failure) => emit(
        OpenBillState.error(failure.message ?? 'Gagal membuat tagihan baru'),
      ),
      (order) {
        emit(const OpenBillState.success('Berhasil membuka meja baru'));
        add(const OpenBillEvent.fetchOpenBills());
      },
    );
  }

  Future<void> _onAddItemToBill(
    _AddItemToBill event,
    Emitter<OpenBillState> emit,
  ) async {
    emit(const OpenBillState.loading());
    final result = await _repository.addItemToOrder(event.orderId, event.item);
    result.fold(
      (failure) => emit(
        OpenBillState.error(failure.message ?? 'Gagal menambah pesanan'),
      ),
      (updatedOrder) {
        emit(
          const OpenBillState.success('Pesanan tambahan berhasil dimasukkan'),
        );
        add(const OpenBillEvent.fetchOpenBills());
        emit(OpenBillState.loaded(selectedOrder: updatedOrder));
      },
    );
  }

  // --- HANDLER BARU: Menghapus Item dari Open Bill ---
  Future<void> _onRemoveItemFromBill(
    _RemoveItemFromBill event,
    Emitter<OpenBillState> emit,
  ) async {
    emit(const OpenBillState.loading());
    final result = await _repository.removeItemFromOrder(event.itemId);
    result.fold(
      (failure) =>
          emit(OpenBillState.error(failure.message ?? 'Gagal menghapus item')),
      (updatedOrder) {
        emit(const OpenBillState.success('Item berhasil dihapus'));
        add(const OpenBillEvent.fetchOpenBills());
        emit(OpenBillState.loaded(selectedOrder: updatedOrder));
      },
    );
  }

  Future<void> _onPayBill(_PayBill event, Emitter<OpenBillState> emit) async {
    emit(const OpenBillState.loading());
    final result = await _repository.payOrder(event.orderId, event.paymentData);
    result.fold(
      (failure) => emit(
        OpenBillState.error(failure.message ?? 'Gagal memproses pembayaran'),
      ),
      (order) {
        emit(
          const OpenBillState.success(
            'Pembayaran berhasil! Meja telah dikosongkan.',
          ),
        );
        add(const OpenBillEvent.fetchOpenBills());
      },
    );
  }

  Future<void> _onCancelBill(
    _CancelBill event,
    Emitter<OpenBillState> emit,
  ) async {
    emit(const OpenBillState.loading());
    final result = await _repository.cancelOrder(event.orderId);
    result.fold(
      (failure) => emit(
        OpenBillState.error(failure.message ?? 'Gagal membatalkan tagihan'),
      ),
      (_) {
        emit(
          const OpenBillState.success(
            'Tagihan dibatalkan. Meja kembali tersedia.',
          ),
        );
        add(const OpenBillEvent.fetchOpenBills());
      },
    );
  }

  void _onSelectBill(_SelectBill event, Emitter<OpenBillState> emit) {
    state.maybeWhen(
      loaded: (orders, _, usePoints, ignoredRules) {
        emit(
          OpenBillState.loaded(
            orders: orders,
            selectedOrder: event.bill,
            usePoints: usePoints,
            ignoredRules: ignoredRules,
          ),
        );
      },
      orElse: () {},
    );
  }

  // --- PERBAIKAN: Kalkulasi Poin kini Hit API Recalculate agar Total di UI berubah! ---
  Future<void> _onToggleUsePoints(
    _ToggleUsePoints event,
    Emitter<OpenBillState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (orders, selectedOrder, _, ignoredRules) async {
        if (selectedOrder == null) return;

        emit(const OpenBillState.loading());
        final payload = {
          'use_points': event.use,
          'ignored_rules': ignoredRules,
        };

        final result = await _repository.recalculateOrder(
          selectedOrder.id,
          payload,
        );

        result.fold(
          (failure) {
            emit(
              OpenBillState.error(
                failure.message ?? 'Gagal menghitung ulang poin',
              ),
            );
            // Revert state jika gagal
            emit(
              OpenBillState.loaded(
                orders: orders,
                selectedOrder: selectedOrder,
                usePoints: !event.use,
                ignoredRules: ignoredRules,
              ),
            );
          },
          (updatedOrder) {
            emit(
              OpenBillState.loaded(
                orders: orders,
                selectedOrder: updatedOrder,
                usePoints: event.use,
                ignoredRules: ignoredRules,
              ),
            );
          },
        );
      },
      orElse: () async {},
    );
  }

  // Jika promo diabaikan, hitung ulang juga
  Future<void> _onIgnorePromo(
    _IgnorePromo event,
    Emitter<OpenBillState> emit,
  ) async {
    await state.maybeWhen(
      loaded: (orders, selectedOrder, usePoints, ignoredRules) async {
        if (selectedOrder == null) return;

        final newList = List<String>.from(ignoredRules);
        if (newList.contains(event.ruleName)) {
          newList.remove(event.ruleName);
        } else {
          newList.add(event.ruleName);
        }

        emit(const OpenBillState.loading());
        final payload = {'use_points': usePoints, 'ignored_rules': newList};
        final result = await _repository.recalculateOrder(
          selectedOrder.id,
          payload,
        );

        result.fold(
          (failure) {
            emit(OpenBillState.error('Gagal menghitung ulang promo'));
            emit(
              OpenBillState.loaded(
                orders: orders,
                selectedOrder: selectedOrder,
                usePoints: usePoints,
                ignoredRules: ignoredRules,
              ),
            );
          },
          (updatedOrder) {
            emit(
              OpenBillState.loaded(
                orders: orders,
                selectedOrder: updatedOrder,
                usePoints: usePoints,
                ignoredRules: newList,
              ),
            );
          },
        );
      },
      orElse: () async {},
    );
  }

  void _onResetIgnored(_ResetIgnored event, Emitter<OpenBillState> emit) {
    state.maybeWhen(
      loaded: (orders, selectedOrder, usePoints, _) {
        emit(
          OpenBillState.loaded(
            orders: orders,
            selectedOrder: selectedOrder,
            usePoints: usePoints,
            ignoredRules: [],
          ),
        );
      },
      orElse: () {},
    );
  }
}
