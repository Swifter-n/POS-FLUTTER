import 'dart:convert';
import 'package:avis_pos/core/constants/variables.dart';
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
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class IPosRemoteDataSource {
  Future<UserModel> getProfile();
  Future<SettingsModel> getPosSettings();
  Future<List<CategoryModel>> getCategories();
  Future<List<ProductModel>> getProducts({int? categoryId});
  Future<List<DiscountRuleModel>> getPromos();

  Future<ShiftModel> getShiftStatus();
  Future<ShiftModel> openShift(double openingAmount);
  Future<ShiftModel> getShiftSummary();
  Future<ShiftModel> closeShift(double closingAmount, String? note);

  Future<OrderModel> storeQuickCheckout(QuickCheckoutPayload payload);
  Future<OrderModel> storeOpenBill(OpenBillPayload payload);
  Future<List<OrderModel>> getOpenOrders();
  Future<OrderModel> getOrderDetail(int orderId);
  Future<OrderModel> addItemToOrder(int orderId, CartItemPayload item);

  // --- TAMBAHAN ENDPOINT BARU ---
  Future<OrderModel> removeItemFromOrder(int itemId);
  Future<OrderModel> recalculateOrder(
    int orderId,
    Map<String, dynamic> payload,
  );
  Future<Map<String, dynamic>> checkPromo(Map<String, dynamic> payload);
  // ------------------------------

  Future<OrderModel> payOrder(int orderId, Map<String, dynamic> paymentData);
  Future<void> cancelOrder(int orderId);

  Future<MemberModel> checkMember(String code);
  Future<MemberModel> registerMember(Map<String, dynamic> data);
  Future<MemberModel> updateMember(
    int id,
    Map<String, dynamic> data,
  ); // --- TAMBAHAN BARU
  Future<List<MemberModel>> getMembers({String? search});

  Future<List<RewardModel>> getRewardCatalog();
  Future<Map<String, dynamic>> redeemReward(int rewardId, int memberId);

  Future<List<InventoryModel>> getInventory({String? search});
  Future<List<StockCountTaskModel>> getStockCountTasks();
  Future<List<StockCountItemModel>> getStockCountItems(int taskId);
  Future<void> updateStockCountItem(int itemId, double qty, bool isZero);
  Future<void> submitStockCount(int taskId);

  Future<List<TableModel>> getTables();
  Future<void> clearTable(int tableId);
  Future<void> saveTablePositions(List<Map<String, dynamic>> payload);
  Future<TableModel> createTable(Map<String, dynamic> data);
  Future<TableModel> updateTable(int id, Map<String, dynamic> data);
  Future<void> deleteTable(int id);

  Future<List<ReservationModel>> getReservations();
  Future<ReservationModel> storeReservation(Map<String, dynamic> data);
  Future<void> updateReservationStatus(int id, String status);

  Future<PrinterSettingsModel> getPrinterSettings();
}

class PosRemoteDataSourceImpl implements IPosRemoteDataSource {
  final http.Client client;
  PosRemoteDataSourceImpl({required this.client});

  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  @override
  Future<UserModel> getProfile() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}user/profile',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200)
      return UserModel.fromJson(json.decode(response.body)['data']);
    throw Exception('Gagal memuat profil');
  }

  @override
  Future<SettingsModel> getPosSettings() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/settings',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200)
      return SettingsModel.fromJson(json.decode(response.body));
    throw Exception('Gagal memuat pengaturan POS');
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/categories',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => CategoryModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat kategori');
  }

  @override
  Future<List<ProductModel>> getProducts({int? categoryId}) async {
    final query = categoryId != null ? '?category_id=$categoryId' : '';
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/products$query',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => ProductModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat produk');
  }

  @override
  Future<List<DiscountRuleModel>> getPromos() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/promos',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => DiscountRuleModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat promo');
  }

  @override
  Future<ShiftModel> getShiftStatus() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/shift/status',
    );
    final response = await client.get(url, headers: await _getHeaders());
    final body = json.decode(response.body);
    if (response.statusCode == 200 && body['status'] == 'open')
      return ShiftModel.fromJson(body['data']);
    throw Exception(body['message'] ?? 'Shift belum dibuka');
  }

  @override
  Future<ShiftModel> openShift(double openingAmount) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/shift/open',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode({'opening_amount': openingAmount}),
    );
    final body = json.decode(response.body);
    if (response.statusCode == 200) return ShiftModel.fromJson(body['data']);
    throw Exception(body['message'] ?? 'Gagal membuka shift');
  }

  @override
  Future<ShiftModel> getShiftSummary() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/shift/summary',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200)
      return ShiftModel.fromJson(json.decode(response.body)['data']);
    throw Exception('Gagal memuat ringkasan shift');
  }

  @override
  Future<ShiftModel> closeShift(double closingAmount, String? note) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/shift/close',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode({
        'closing_amount': closingAmount,
        'closing_note': note,
      }),
    );
    if (response.statusCode == 200)
      return ShiftModel.fromJson(json.decode(response.body)['data']);
    throw Exception('Gagal menutup shift');
  }

  @override
  Future<OrderModel> storeQuickCheckout(QuickCheckoutPayload payload) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/quick-checkout',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode(payload.toJson()),
    );
    final body = json.decode(response.body);
    if (response.statusCode == 201) return OrderModel.fromJson(body['data']);
    throw Exception(body['message'] ?? 'Gagal Quick Checkout');
  }

  @override
  Future<OrderModel> storeOpenBill(OpenBillPayload payload) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/orders/open-bill',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode(payload.toJson()),
    );
    final body = json.decode(response.body);
    if (response.statusCode == 201) return OrderModel.fromJson(body['data']);
    throw Exception(body['message'] ?? 'Gagal membuat Open Bill');
  }

  @override
  Future<List<OrderModel>> getOpenOrders() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/orders/open',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => OrderModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat daftar pesanan terbuka');
  }

  @override
  Future<OrderModel> getOrderDetail(int orderId) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/orders/$orderId',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200)
      return OrderModel.fromJson(json.decode(response.body)['data']);
    throw Exception('Gagal memuat detail pesanan');
  }

  @override
  Future<OrderModel> addItemToOrder(int orderId, CartItemPayload item) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/orders/$orderId/add-item',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode(item.toJson()),
    );
    if (response.statusCode == 200)
      return OrderModel.fromJson(json.decode(response.body)['data']);
    throw Exception('Gagal menambah item');
  }

  // --- IMPLEMENTASI FUNGSI BARU ---

  @override
  Future<OrderModel> removeItemFromOrder(int itemId) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/orders/items/$itemId',
    );
    final response = await client.delete(url, headers: await _getHeaders());
    final body = json.decode(response.body);
    if (response.statusCode == 200) return OrderModel.fromJson(body['data']);
    throw Exception(body['message'] ?? 'Gagal menghapus item');
  }

  @override
  Future<OrderModel> recalculateOrder(
    int orderId,
    Map<String, dynamic> payload,
  ) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/orders/$orderId/recalculate',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode(payload),
    );
    final body = json.decode(response.body);
    if (response.statusCode == 200) return OrderModel.fromJson(body['data']);
    throw Exception(body['message'] ?? 'Gagal menghitung ulang tagihan');
  }

  @override
  Future<Map<String, dynamic>> checkPromo(Map<String, dynamic> payload) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/check-promo',
    );

    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode(payload),
    );
    final body = json.decode(response.body);
    if (response.statusCode == 200) return body;
    throw Exception(body['message'] ?? 'Gagal mengecek promo');
  }

  @override
  Future<MemberModel> updateMember(int id, Map<String, dynamic> data) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/members/$id',
    );
    final response = await client.put(
      url,
      headers: await _getHeaders(),
      body: json.encode(data),
    );
    final body = json.decode(response.body);
    if (response.statusCode == 200) return MemberModel.fromJson(body['data']);
    throw Exception(body['message'] ?? 'Gagal memperbarui data member');
  }

  // --------------------------------

  @override
  Future<OrderModel> payOrder(
    int orderId,
    Map<String, dynamic> paymentData,
  ) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/orders/$orderId/pay',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode(paymentData),
    );
    final body = json.decode(response.body);
    if (response.statusCode == 200) return OrderModel.fromJson(body['data']);
    throw Exception(body['message'] ?? 'Pembayaran gagal');
  }

  @override
  Future<void> cancelOrder(int orderId) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/orders/$orderId/cancel',
    );
    final response = await client.post(url, headers: await _getHeaders());
    if (response.statusCode != 200)
      throw Exception('Gagal membatalkan pesanan');
  }

  @override
  Future<MemberModel> checkMember(String code) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/members/check?code=$code',
    );
    final response = await client.get(url, headers: await _getHeaders());
    final body = json.decode(response.body);
    if (response.statusCode == 200) return MemberModel.fromJson(body['data']);
    throw Exception(body['message'] ?? 'Member tidak ditemukan');
  }

  @override
  Future<MemberModel> registerMember(Map<String, dynamic> data) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/members/register',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode(data),
    );
    if (response.statusCode == 201)
      return MemberModel.fromJson(json.decode(response.body)['data']);
    throw Exception('Gagal mendaftar member');
  }

  @override
  Future<List<MemberModel>> getMembers({String? search}) async {
    final query = search != null ? '?search=$search' : '';
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/members$query',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => MemberModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat member');
  }

  @override
  Future<List<RewardModel>> getRewardCatalog() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/rewards',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => RewardModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat katalog hadiah');
  }

  @override
  Future<Map<String, dynamic>> redeemReward(int rewardId, int memberId) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/rewards/redeem',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode({'reward_id': rewardId, 'member_id': memberId}),
    );
    if (response.statusCode == 200) return json.decode(response.body);
    throw Exception('Gagal klaim hadiah');
  }

  @override
  Future<List<InventoryModel>> getInventory({String? search}) async {
    final query = search != null ? '?search=$search' : '';
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/inventory$query',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => InventoryModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat stok');
  }

  @override
  Future<List<StockCountTaskModel>> getStockCountTasks() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/stock-counts',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => StockCountTaskModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat tugas opname');
  }

  @override
  Future<List<StockCountItemModel>> getStockCountItems(int taskId) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/stock-counts/$taskId',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data']['items'];
      return data.map((e) => StockCountItemModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat item opname');
  }

  @override
  Future<void> updateStockCountItem(int itemId, double qty, bool isZero) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/stock-counts/items/$itemId',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode({'qty': qty, 'is_zero_count': isZero}),
    );
    if (response.statusCode != 200)
      throw Exception('Gagal memperbarui hasil hitungan');
  }

  @override
  Future<void> submitStockCount(int taskId) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/stock-counts/$taskId/submit',
    );
    final response = await client.post(url, headers: await _getHeaders());
    if (response.statusCode != 200)
      throw Exception(
        json.decode(response.body)['message'] ?? 'Gagal submit opname',
      );
  }

  @override
  Future<List<TableModel>> getTables() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/tables',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => TableModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat data meja');
  }

  @override
  Future<void> clearTable(int tableId) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/tables/$tableId/clear',
    );
    final response = await client.post(url, headers: await _getHeaders());
    if (response.statusCode != 200) throw Exception('Gagal mengosongkan meja');
  }

  @override
  Future<void> saveTablePositions(List<Map<String, dynamic>> payload) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/tables/positions',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode({'positions': payload}),
    );
    if (response.statusCode != 200)
      throw Exception('Gagal menyimpan posisi meja');
  }

  @override
  Future<TableModel> createTable(Map<String, dynamic> data) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/tables',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode(data),
    );
    if (response.statusCode == 201)
      return TableModel.fromJson(json.decode(response.body)['data']);
    throw Exception('Gagal membuat meja baru');
  }

  @override
  Future<TableModel> updateTable(int id, Map<String, dynamic> data) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/tables/$id',
    );
    final response = await client.put(
      url,
      headers: await _getHeaders(),
      body: json.encode(data),
    );
    if (response.statusCode == 200)
      return TableModel.fromJson(json.decode(response.body)['data']);
    throw Exception('Gagal memperbarui meja');
  }

  @override
  Future<void> deleteTable(int id) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/tables/$id',
    );
    final response = await client.delete(url, headers: await _getHeaders());
    if (response.statusCode != 200) throw Exception('Gagal menghapus meja');
  }

  @override
  Future<List<ReservationModel>> getReservations() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/reservations',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200) {
      final List data = json.decode(response.body)['data'];
      return data.map((e) => ReservationModel.fromJson(e)).toList();
    }
    throw Exception('Gagal memuat reservasi');
  }

  @override
  Future<ReservationModel> storeReservation(Map<String, dynamic> data) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/reservations',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode(data),
    );
    if (response.statusCode == 201)
      return ReservationModel.fromJson(json.decode(response.body)['data']);
    throw Exception('Gagal membuat reservasi');
  }

  @override
  Future<void> updateReservationStatus(int id, String status) async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/reservations/$id/status',
    );
    final response = await client.post(
      url,
      headers: await _getHeaders(),
      body: json.encode({'status': status}),
    );
    if (response.statusCode != 200)
      throw Exception('Gagal update status reservasi');
  }

  @override
  Future<PrinterSettingsModel> getPrinterSettings() async {
    final url = Uri.parse(
      '${Variables.baseUrl}${Variables.apiVersion}pos/printers',
    );
    final response = await client.get(url, headers: await _getHeaders());
    if (response.statusCode == 200)
      return PrinterSettingsModel.fromJson(json.decode(response.body));
    throw Exception('Gagal memuat pengaturan printer');
  }
}
