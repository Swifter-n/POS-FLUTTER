import 'package:avis_pos/core/bloc/observer.dart';
import 'package:avis_pos/data/repositories/auth_repository.dart';
import 'package:avis_pos/data/repositories/pos_repository.dart';
import 'package:avis_pos/presentation/auth/bloc/auth/auth_bloc.dart';
import 'package:avis_pos/presentation/auth/pages/splash_page.dart';
import 'package:avis_pos/presentation/home/bloc/cart/cart_bloc.dart';
import 'package:avis_pos/presentation/home/bloc/category/category_bloc.dart';
import 'package:avis_pos/presentation/home/bloc/product/product_bloc.dart';
import 'package:avis_pos/presentation/home/bloc/promo/promo_bloc.dart';
import 'package:avis_pos/presentation/home/bloc/settings/settings_bloc.dart';
import 'package:avis_pos/presentation/inventory/bloc/inventory/inventory_bloc.dart';
import 'package:avis_pos/presentation/member/bloc/member/member_bloc.dart';
import 'package:avis_pos/presentation/open_bill/bloc/open_bill/open_bill_bloc.dart';
import 'package:avis_pos/presentation/reservation/bloc/reservation/reservation_bloc.dart';
import 'package:avis_pos/presentation/reward/bloc/reward/reward_bloc.dart';
import 'package:avis_pos/presentation/settings/bloc/printer/printer_bloc.dart';
import 'package:avis_pos/presentation/settings/bloc/table/table_bloc.dart';
import 'package:avis_pos/presentation/shift/bloc/shift/shift_bloc.dart';
import 'package:avis_pos/presentation/stock_count/bloc/stock_count/stock_count_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:avis_pos/data/datasources/auth_remote_datasource.dart';
import 'package:avis_pos/data/datasources/pos_remote_datasource.dart';

// class AppRouteObserver extends NavigatorObserver {
//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     print(
//       '🧭 >>> NAVIGATOR PUSHED: ${route.settings.name} | Type: ${route.runtimeType}',
//     );
//     if (route is MaterialPageRoute) {
//       print('📜 >>> STACKTRACE FOR MATERIALPAGEROUTE PUSH:');
//       print(StackTrace.current.toString());
//     }
//     super.didPush(route, previousRoute);
//   }
// }

void main() {
  // 1. Inisialisasi Binding Flutter & Observer
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();

  // 2. Inisialisasi Data Sources
  final authRemoteDataSource = AuthRemoteDataSourceImpl(client: http.Client());
  final posRemoteDataSource = PosRemoteDataSourceImpl(client: http.Client());

  // 3. Inisialisasi Repositories
  final authRepository = AuthRepositoryImpl(
    remoteDataSource: authRemoteDataSource,
  );
  final posRepository = PosRepositoryImpl(
    remoteDataSource: posRemoteDataSource,
  );

  runApp(MyApp(authRepository: authRepository, posRepository: posRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepositoryImpl authRepository;
  final PosRepositoryImpl posRepository;

  const MyApp({
    super.key,
    required this.authRepository,
    required this.posRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepositoryImpl>.value(value: authRepository),
        RepositoryProvider<PosRepositoryImpl>.value(value: posRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          // DAFTAR SEMUA BLOC TANPA PEMANGGILAN API (.add) PREMATUR
          BlocProvider(create: (_) => AuthBloc(authRepository)),
          BlocProvider(create: (_) => ShiftBloc(posRepository)),
          BlocProvider(create: (_) => CategoryBloc(posRepository)),
          BlocProvider(create: (_) => ProductBloc(posRepository)),
          BlocProvider(create: (_) => CartBloc(posRepository)),
          BlocProvider(create: (_) => MemberBloc(posRepository)),
          BlocProvider(create: (_) => RewardBloc(posRepository)),
          BlocProvider(create: (_) => TableBloc(posRepository)),
          BlocProvider(create: (_) => OpenBillBloc(posRepository)),
          BlocProvider(create: (_) => PrinterBloc(posRepository)),
          BlocProvider(create: (_) => InventoryBloc(posRepository)),
          BlocProvider(create: (_) => StockCountBloc(posRepository)),
          BlocProvider(create: (_) => PromoBloc(posRepository)),
          BlocProvider(create: (_) => ReservationBloc(posRepository)),
          BlocProvider(create: (_) => SettingsBloc(posRepository)),
        ],
        child: MaterialApp(
          title: 'TAIYO POS',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.teal),
          // navigatorObservers: [AppRouteObserver()],
          home: const SplashPage(),
        ),
      ),
    );
  }
}
