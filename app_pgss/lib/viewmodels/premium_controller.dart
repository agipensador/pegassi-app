import 'package:app_pgss/model/entitlement.dart';
import 'package:app_pgss/viewmodels/connection_manager_controller.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/viewmodels/purchase_api.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PremiumController extends GetxController {
  final ManagerController controllerManager = Get.put(ManagerController());
  final ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  final statusEntitlemnet = Entitlement.free.obs;

  Future initializePurchase() async {
    Purchases.addCustomerInfoUpdateListener((customerInfo) async {
      updatePurchaseStatus();
    });
  }

  Future signatureVerification() async {
    try {
      CustomerInfo customerInfo = await Purchases.restorePurchases();

      final entitlements = customerInfo.entitlements.active.values.toList();

      statusEntitlemnet.value =
          entitlements.isEmpty ? Entitlement.free : Entitlement.premium;
      statusEntitlemnet.value != Entitlement.premium
          ? controllerManager.isPayAccount.value = false
          : controllerManager.isPayAccount.value = true;
    } on PlatformException catch (_) {
      verifyNetOrSignature();
    }
  }

  Future updatePurchaseStatus() async {
    final purchaserInfo = await Purchases.getCustomerInfo();

    final entitlements = purchaserInfo.entitlements.active.values.toList();

    statusEntitlemnet.value =
        entitlements.isEmpty ? Entitlement.free : Entitlement.premium;

    statusEntitlemnet.value != Entitlement.premium
        ? controllerManager.isPayAccount.value = false
        : controllerManager.isPayAccount.value = true;
  }

  Future getFetchOffers() async {
    controllerManager.functionLoaded();
    final offerings = await PurchaseApi.fetchOffers();

    if (offerings.isEmpty) {
      verifyNetOrSignature();
      controllerManager.functionLoaded();
    } else {
      final packages = offerings
          .map((offer) => offer.availablePackages)
          .expand((pair) => pair)
          .toList();

      Package package = packages.first;

      PurchaseApi.purchasePackage(package);
    }
  }

  verifyNetOrSignature() {
    controllerManager.createGetSnackbar(
        title: 'OPS!',
        subtitle: !connectionManagerController.connectionType.value
            ? 'Verifique a Internet!'
            : 'Nenhum plano de assinatura foi encontrado!');
  }
}
