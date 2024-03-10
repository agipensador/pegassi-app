import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/viewmodels/fragment_app_card_controller.dart';
import 'package:app_pgss/views/screens/screen_premium.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartTextsPremiumAdsenseAppCard extends GetView {
  final BuildContext context;
  final bool isTablet;
  final String? message;

  PartTextsPremiumAdsenseAppCard(
      {Key? key, required this.context, this.isTablet = false, this.message})
      : super(key: key);

  // final FipeTableController controllerFipeTable =
  //     Get.put(FipeTableController());

  final FragmentAppCardController controllerEditAppCard =
      Get.put(FragmentAppCardController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          children: [
            WidgetSpan(
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  Get.offAll(
                    () => ScreenPremium(),
                  );
                },
                child: Text(
                  'ASSINE O PREMIUM',
                  style: TextStyle(
                      color: AppColors.backgroundColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: isTablet ? 24 : 14),
                ),
              ),
            ),
            TextSpan(
                text: ' OU ',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: isTablet ? 24 : 14)),
            WidgetSpan(
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  // controllerEditAppCard.visualizeValueAdsenseOrPremium(
                  //     isTablet,
                  //     'PROPAGANDAS',
                  //     '1 Propaganda = 1 Acesso',
                  //     "Você tem ",
                  //     '${controllerFipeTable.valueAccessAd.value} ${controllerFipeTable.valueAccessAd.value == 1 ? 'Acesso' : 'Acessos'}',
                  //     controllerFipeTable.valueAccessAd >= 2
                  //         ? 'Ou veja propagandas para adquirir mais ACESSOS'
                  //         : 'Para ver estes dados você precisa de 2 ACESSOS',
                  //     false,
                  //     false);
                },
                child: Text(
                  'VEJA PROPAGANDAS ',
                  style: TextStyle(
                      color: AppColors.backgroundColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      fontSize: isTablet ? 24 : 14),
                ),
              ),
            ),
            TextSpan(
                text: message ?? 'PARA USAR ESTA FUNCIONALIDADE'.toString(),
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: isTablet ? 24 : 14)),
          ],
        ),
      ),
    );
  }
}
