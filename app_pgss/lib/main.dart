import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/viewmodels/premium_controller.dart';
import 'package:app_pgss/viewmodels/purchase_api.dart';
import 'package:app_pgss/views/screens/fragments/fragment_bottom_navigation.dart';
import 'package:app_pgss/views/screens/screen_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  final ManagerController controllerManager = Get.put(ManagerController());
  final PremiumController premiumController = Get.put(PremiumController());

  await initApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(await initializeApp(controllerManager, premiumController));
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PurchaseApi.init();
}

Future<Widget> initializeApp(
  ManagerController controllerManager,
  PremiumController premiumController,
) async {
  await controllerManager.getValueAppVersion();
  premiumController.initializePurchase();
  return GetMaterialApp(
      title: 'App do Chaveiro',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      // darkTheme: ThemeData(
      //   textTheme: GoogleFonts.questrialTextTheme(
      //     ThemeData.dark().textTheme,
      //   ),
      // ),
      home: FragmentBottomNavigation());
}
