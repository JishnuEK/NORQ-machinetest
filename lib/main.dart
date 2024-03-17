import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test16032024/local_storage/local_storage_cache.dart';
import 'package:test16032024/modules/cart/controller/cart_controller.dart';
import 'package:test16032024/modules/cart/model/cart.dart';
import 'package:test16032024/modules/login/controller/auth_controller.dart';
import 'package:test16032024/modules/login/model/userdata.dart';
import 'package:test16032024/routes/app_pages.dart';
import 'package:test16032024/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(CartAdapter());
  Hive.registerAdapter(UserDataAdapter());

  boxCart = await Hive.openBox<Cart>('cartBox');
  boxUser = await Hive.openBox<UserData>('UserBox');
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      initialBinding: AppBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.pages,
      theme: AppTheme().themeData(),
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController(), permanent: true);
    Get.put(AuthController(), permanent: true);
  }
}
