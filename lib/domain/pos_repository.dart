import 'package:avis_pos/core/failures/failure.dart';
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

abstract class IPosRepository {
  Future<Either<Failure, UserModel>> getProfile();
  Future<Either<Failure, SettingsModel>> getPosSettings();
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<ProductModel>>> getProducts({int? categoryId});
  Future<Either<Failure, List<DiscountRuleModel>>> getPromos();
  Future<Either<Failure, ShiftModel>> getShiftStatus();
  Future<Either<Failure, ShiftModel>> openShift(double openingAmount);
  Future<Either<Failure, ShiftModel>> getShiftSummary();
  Future<Either<Failure, ShiftModel>> closeShift(
    double closingAmount,
    String? note,
  );

  Future<Either<Failure, OrderModel>> processQuickCheckout(
    QuickCheckoutPayload payload,
  );
  Future<Either<Failure, OrderModel>> openBill(OpenBillPayload payload);
  Future<Either<Failure, List<OrderModel>>> getOpenOrders();
  Future<Either<Failure, OrderModel>> getOrderDetail(int orderId);
  Future<Either<Failure, OrderModel>> addItemToOrder(
    int orderId,
    CartItemPayload item,
  );

  // --- FUNGSI TAMBAHAN BARU ---
  Future<Either<Failure, OrderModel>> removeItemFromOrder(int itemId);
  Future<Either<Failure, OrderModel>> recalculateOrder(
    int orderId,
    Map<String, dynamic> payload,
  );
  Future<Either<Failure, Map<String, dynamic>>> checkPromo(
    Map<String, dynamic> payload,
  );
  Future<Either<Failure, MemberModel>> updateMember(
    int id,
    Map<String, dynamic> data,
  );
  // ----------------------------

  Future<Either<Failure, OrderModel>> payOrder(
    int orderId,
    Map<String, dynamic> paymentData,
  );
  Future<Either<Failure, Unit>> cancelOrder(int orderId);
  Future<Either<Failure, Unit>> cancelOrderWithReason(
    int orderId,
    String? reason,
  );

  Future<Either<Failure, MemberModel>> checkMember(String code);
  Future<Either<Failure, MemberModel>> registerMember(
    Map<String, dynamic> data,
  );
  Future<Either<Failure, List<MemberModel>>> getMembers({String? search});
  Future<Either<Failure, List<RewardModel>>> getRewardCatalog();
  Future<Either<Failure, Map<String, dynamic>>> redeemReward(
    int rewardId,
    int memberId,
  );

  Future<Either<Failure, List<InventoryModel>>> getInventory({String? search});
  Future<Either<Failure, List<StockCountTaskModel>>> getStockCountTasks();
  Future<Either<Failure, List<StockCountItemModel>>> getStockCountItems(
    int taskId,
  );
  Future<Either<Failure, Unit>> updateStockCountItem(
    int itemId,
    double qty,
    bool isZero,
  );
  Future<Either<Failure, Unit>> submitStockCount(int taskId);

  Future<Either<Failure, List<TableModel>>> getTables();
  Future<Either<Failure, Unit>> saveTablePositions(
    List<Map<String, dynamic>> payload,
  );
  Future<Either<Failure, TableModel>> createTable(Map<String, dynamic> data);
  Future<Either<Failure, TableModel>> updateTable(
    int id,
    Map<String, dynamic> data,
  );
  Future<Either<Failure, Unit>> deleteTable(int id);
  Future<Either<Failure, Unit>> clearTable(int tableId);
  Future<Either<Failure, Unit>> transferTable(
    int orderId,
    String targetTableCode,
  );
  Future<Either<Failure, Unit>> checkInTable(int tableId);
  Future<Either<Failure, List<ReservationModel>>> getReservations();
  Future<Either<Failure, ReservationModel>> storeReservation(
    Map<String, dynamic> data,
  );
  Future<Either<Failure, Unit>> updateReservationStatus(int id, String status);
  Future<Either<Failure, PrinterSettingsModel>> getPrinterSettings();
}
