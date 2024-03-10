import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final ManagerController controllerManager = Get.put(ManagerController());

class PurchaseApi {
  static const _apiKey = 'goog_tcCnXCPAwpKnVDRKWXRikWAavXW';

  static Future init() async {
    final purchasesConfiguration = PurchasesConfiguration(_apiKey);
    await Purchases.configure(purchasesConfiguration);
  }

  static Future<List<Offering>> fetchOffers() async {
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;

      return current == null ? [] : [current];
    } on PlatformException {
      return [];
    }
  }

  static Future<bool> purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);
      controllerManager.functionLoaded();
      return true;
    } on PlatformException catch (e) {
      if (e.code == '6') {
        controllerManager.isPayAccount.value = true;
        controllerManager.functionLoaded();
        return true;
      }
      controllerManager.functionLoaded();
      return false;
    } catch (e) {
      controllerManager.functionLoaded();
      return false;
    }
  }
}
