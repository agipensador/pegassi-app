import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/strings.dart';
import 'package:app_pgss/viewmodels/fragment_app_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartVisualiseAppCard extends GetView {
  final BuildContext? context;
  final bool? isTablet;

  const PartVisualiseAppCard({super.key, this.context, this.isTablet});

  @override
  Widget build(BuildContext context) {
    final FragmentAppCardController controllerEditAppCard =
        Get.put(FragmentAppCardController());

    return TextButton(
        child: const Chip(
            padding: EdgeInsets.symmetric(horizontal: 8),
            backgroundColor: Colors.white,
            label: Text(
              Strings.visualizeValuesKeys,
              style: TextStyle(color: AppColors.primaryColor),
            )),
        onPressed: () {
          // controllerEditAppCard.visualizeValueAdsenseOrPremium(
          //     isTablet ?? false,
          //     'VISUALIZAR',
          //     'Visualize estes dados'
          //         ' sendo PREMIUM.',
          //     'Ou assistindo propagandas.\n\n 1 PROPAGANDA\n=\n1 ACCESSO',
          //     '\n\nPara ver detalhes da FIPE são necessários 2 Acessos.',
          //     '',
          //     true,
          //     true);
        });
  }
}
