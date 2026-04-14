import 'package:avis_pos/core/failures/failure.dart';
import 'package:avis_pos/data/datasources/pos_remote_datasource.dart';
import 'package:avis_pos/domain/pos_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:avis_pos/data/model/payloads/quick_checkout_payload/quick_checkout_payload.dart';
import 'package:avis_pos/data/model/payloads/open_bill_payload/open_bill_payload.dart';
import 'package:avis_pos/data/model/payloads/cart_item_payload/cart_item_payload.dart';
import 'package:avis_pos/data/model/responses/category/category_model.dart';
import 'package:avis_pos/data/model/responses/discount_rule_model/discount_rule_model.dart';
import 'package:avis_pos/data/model/responses/inventory_model/inventory_model.dart';
import 'package:avis_pos/data/model/responses/member_model/member_model.dart';
import 'package:avis_pos/data/model/responses/order_model/order_model.dart';
import 'package:avis_pos/data/model/responses/product/product_model.dart';
import 'package:avis_pos/data/model/responses/reservation_model/reservation_model.dart';
import 'package:avis_pos/data/model/responses/reward_model.dart/reward_model.dart';
import 'package:avis_pos/data/model/responses/shift_model/shift_model.dart';
import 'package:avis_pos/data/model/responses/stock_count_model/stock_count_task_model.dart';
import 'package:avis_pos/data/model/responses/stock_count_model/stock_count_item_model.dart';
import 'package:avis_pos/data/model/responses/table_model/table_model.dart';
import 'package:avis_pos/data/model/responses/settings_model/settings_model.dart';
import 'package:avis_pos/data/model/responses/printer_settings_model/printer_settings_model.dart';
import 'package:avis_pos/data/model/responses/user_model.dart';

class PosRepositoryImpl implements IPosRepository {
  final IPosRemoteDataSource remoteDataSource;

  PosRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, UserModel>> getProfile() async {
    try {
      final result = await remoteDataSource.getProfile();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SettingsModel>> getPosSettings() async {
    try {
      final result = await remoteDataSource.getPosSettings();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      final result = await remoteDataSource.getCategories();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> getProducts({
    int? categoryId,
  }) async {
    try {
      final result = await remoteDataSource.getProducts(categoryId: categoryId);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DiscountRuleModel>>> getPromos() async {
    try {
      final result = await remoteDataSource.getPromos();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShiftModel>> getShiftStatus() async {
    try {
      final result = await remoteDataSource.getShiftStatus();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShiftModel>> openShift(double openingAmount) async {
    try {
      final result = await remoteDataSource.openShift(openingAmount);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShiftModel>> getShiftSummary() async {
    try {
      final result = await remoteDataSource.getShiftSummary();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ShiftModel>> closeShift(
    double closingAmount,
    String? note,
  ) async {
    try {
      final result = await remoteDataSource.closeShift(closingAmount, note);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderModel>> processQuickCheckout(
    QuickCheckoutPayload payload,
  ) async {
    try {
      final result = await remoteDataSource.storeQuickCheckout(payload);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderModel>> openBill(OpenBillPayload payload) async {
    try {
      final result = await remoteDataSource.storeOpenBill(payload);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getOpenOrders() async {
    try {
      final result = await remoteDataSource.getOpenOrders();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderModel>> getOrderDetail(int orderId) async {
    try {
      final result = await remoteDataSource.getOrderDetail(orderId);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderModel>> addItemToOrder(
    int orderId,
    CartItemPayload item,
  ) async {
    try {
      final result = await remoteDataSource.addItemToOrder(orderId, item);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  // --- IMPLEMENTASI FUNGSI BARU ---

  @override
  Future<Either<Failure, OrderModel>> removeItemFromOrder(int itemId) async {
    try {
      final result = await remoteDataSource.removeItemFromOrder(itemId);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderModel>> recalculateOrder(
    int orderId,
    Map<String, dynamic> payload,
  ) async {
    try {
      final result = await remoteDataSource.recalculateOrder(orderId, payload);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> checkPromo(
    Map<String, dynamic> payload,
  ) async {
    try {
      final result = await remoteDataSource.checkPromo(payload);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MemberModel>> updateMember(
    int id,
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await remoteDataSource.updateMember(id, data);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  // --------------------------------

  @override
  Future<Either<Failure, OrderModel>> payOrder(
    int orderId,
    Map<String, dynamic> paymentData,
  ) async {
    try {
      final result = await remoteDataSource.payOrder(orderId, paymentData);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> cancelOrder(int orderId) async {
    try {
      await remoteDataSource.cancelOrder(orderId);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MemberModel>> checkMember(String code) async {
    try {
      final result = await remoteDataSource.checkMember(code);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, MemberModel>> registerMember(
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await remoteDataSource.registerMember(data);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MemberModel>>> getMembers({
    String? search,
  }) async {
    try {
      final result = await remoteDataSource.getMembers(search: search);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<RewardModel>>> getRewardCatalog() async {
    try {
      final result = await remoteDataSource.getRewardCatalog();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> redeemReward(
    int rewardId,
    int memberId,
  ) async {
    try {
      final result = await remoteDataSource.redeemReward(rewardId, memberId);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<InventoryModel>>> getInventory({
    String? search,
  }) async {
    try {
      final result = await remoteDataSource.getInventory(search: search);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StockCountTaskModel>>>
  getStockCountTasks() async {
    try {
      final result = await remoteDataSource.getStockCountTasks();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StockCountItemModel>>> getStockCountItems(
    int taskId,
  ) async {
    try {
      final result = await remoteDataSource.getStockCountItems(taskId);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateStockCountItem(
    int itemId,
    double qty,
    bool isZero,
  ) async {
    try {
      await remoteDataSource.updateStockCountItem(itemId, qty, isZero);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> submitStockCount(int taskId) async {
    try {
      await remoteDataSource.submitStockCount(taskId);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TableModel>>> getTables() async {
    try {
      final result = await remoteDataSource.getTables();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearTable(int tableId) async {
    try {
      await remoteDataSource.clearTable(tableId);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> saveTablePositions(
    List<Map<String, dynamic>> payload,
  ) async {
    try {
      await remoteDataSource.saveTablePositions(payload);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TableModel>> createTable(
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await remoteDataSource.createTable(data);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TableModel>> updateTable(
    int id,
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await remoteDataSource.updateTable(id, data);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTable(int id) async {
    try {
      await remoteDataSource.deleteTable(id);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> transferTable(
    int orderId,
    String targetTableCode,
  ) async {
    try {
      await remoteDataSource.transferTable(orderId, targetTableCode);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> cancelOrderWithReason(
    int orderId,
    String? reason,
  ) async {
    final result = await remoteDataSource.cancelOrderWithReason(
      orderId,
      reason,
    );
    return result.fold(
      (error) => Left(Failure.apiError(message: error)),
      (_) => const Right(unit),
    );
  }

  @override
  Future<Either<Failure, List<ReservationModel>>> getReservations() async {
    try {
      final result = await remoteDataSource.getReservations();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReservationModel>> storeReservation(
    Map<String, dynamic> data,
  ) async {
    try {
      final result = await remoteDataSource.storeReservation(data);
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateReservationStatus(
    int id,
    String status,
  ) async {
    try {
      await remoteDataSource.updateReservationStatus(id, status);
      return const Right(unit);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, PrinterSettingsModel>> getPrinterSettings() async {
    try {
      final result = await remoteDataSource.getPrinterSettings();
      return Right(result);
    } catch (e) {
      return Left(Failure.apiError(message: e.toString()));
    }
  }
}
