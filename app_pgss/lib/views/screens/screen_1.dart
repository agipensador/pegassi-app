import 'package:app_pgss/viewmodels/connection_manager_controller.dart';
import 'package:app_pgss/viewmodels/home_controller.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/views/edits/edit_card_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class Tela1 extends GetView {
  Tela1({super.key});

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
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controllerManager.openLink(
                            'https://www.sympla.com.br/produtor/pgssevnts');
                      },
                      child: EditCardMenu(
                          imageUrl:
                              'https://files.tecnoblog.net/wp-content/uploads/2022/09/stable-diffusion-imagem.jpg',
                          text: 'SEJA UM\nASSOCIADO'),
                    ),
                    GestureDetector(
                      onTap: () {
                        controllerManager.openLink(
                            'https://www.youtube.com/watch?v=vT1AztU20Ys&pp=ygUOcGVnYXNzaSBhcnNlbmE%3D');
                      },
                      child: EditCardMenu(
                          imageUrl: 'https://i.stack.imgur.com/AAxpw.png',
                          text: 'wiki pegassi'),
                    )
                    //: SizedBox.shrink()
                  ],
                ),
              )),
            )

            // Column(
            //   children: [
            //     EditAppbar(
            //       iconLeft: IconButton(
            //         highlightColor: AppColors.primaryColor.withOpacity(0.1),
            //         splashColor: Colors.transparent,
            //         color: Colors.white,
            //         icon: const Icon(
            //           Icons.workspace_premium_outlined,
            //         ),
            //         onPressed: () {
            //           Get.offAll(
            //             () => ScreenPremium(),
            //           );
            //           // if (connectionManagerController.connectionType.value &&
            //           //     controllerManager.sharedPrefPremium() >= 2 &&
            //           //     !controllerManager.isPayAccount.value) {
            //           //   controllerManager.verifyQuantityPremium();
            //           // }
            //           // if (!controllerManager.isPayAccount.value) {
            //           //   controllerManager.addQuantityPremium();
            //           // }
            //         },
            //       ),
            //       title: 'a',
            //     ),
            //   ],
            // )
            ));
  }
}
