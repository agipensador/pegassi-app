import 'package:app_pgss/viewmodels/purchase_api.dart';
import 'package:app_pgss/views/screens/screen_premium.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FragmentCardTransferOffline extends GetView {
  final bool? isPagePremium;
  const FragmentCardTransferOffline({Key? key, this.isPagePremium = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Image.asset(
        'assets/images/banner_pix.png',
        fit: BoxFit.fill,
        height: kBottomNavigationBarHeight,
      ),
      onTap: () {
        if (isPagePremium == false) {
          Get.to(
            () => ScreenPremium(),
          );
        }
        controllerManager.createGetSnackbar(
            title: 'Verfique a Internet!',
            subtitle: 'E clique em CONTINUAR para ser PREMIUM');
      },
    );
  }
}
