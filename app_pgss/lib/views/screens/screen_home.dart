import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/strings.dart';
import 'package:app_pgss/viewmodels/connection_manager_controller.dart';
import 'package:app_pgss/viewmodels/home_controller.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/views/edits/edit_appbar.dart';
import 'package:app_pgss/views/screens/screen_premium.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class ScreenHome extends GetView {
  ScreenHome({Key? key}) : super(key: key);

  final HomeController homeController = Get.put(HomeController());
  final ManagerController controllerManager = Get.put(ManagerController());
  final ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());
  final screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    final ConnectionManagerController _controller =
        Get.find<ConnectionManagerController>();

    FocusScopeNode currentFocus = FocusScope.of(context);

    homeController.controllerManager.isTabletVerify(context);
    final isTablet = homeController.controllerManager.isTablet;

    if (_controller.connectionType.value == true) {
      if (homeController.updatePreviewChecker.value == true) {
        homeController.checkUpdate();
        homeController.updatePreviewChecker.value = false;
      }
    }

    return SafeArea(
        child: GestureDetector(
            onTap: () {
              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Column(
              children: [
                EditAppbar(
                  iconLeft: IconButton(
                    highlightColor: AppColors.primaryColor.withOpacity(0.1),
                    splashColor: Colors.transparent,
                    color: Colors.white,
                    icon: const Icon(
                      Icons.workspace_premium_outlined,
                    ),
                    onPressed: () {
                      Get.offAll(
                        () => ScreenPremium(),
                      );
                      // if (connectionManagerController.connectionType.value &&
                      //     controllerManager.sharedPrefPremium() >= 2 &&
                      //     !controllerManager.isPayAccount.value) {
                      //   controllerManager.verifyQuantityPremium();
                      // }
                      // if (!controllerManager.isPayAccount.value) {
                      //   controllerManager.addQuantityPremium();
                      // }
                    },
                  ),
                  title: '',
                ),
              ],
            )));
  }
}
