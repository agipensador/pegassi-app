import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FragmentButtonOpenShowModal extends GetView {
  FragmentButtonOpenShowModal({Key? key}) : super(key: key);

  final ManagerController controllerManager = Get.put(ManagerController());

  @override
  Widget build(BuildContext context) {
    return IconButton(
        highlightColor: AppColors.primaryColor.withOpacity(0.1),
        splashColor: Colors.transparent,
        color: Colors.white,
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          controllerManager.openMenuModal();
          if (controllerManager
                  .connectionManagerController.connectionType.value &&
              controllerManager.sharedPrefGetAdBottomSheet() >= 3 &&
              !controllerManager.isPayAccount.value) {
            controllerManager.verifyQuantityAdBottomSheet();
          }
          if (!controllerManager.isPayAccount.value) {
            controllerManager.addQuantityAdBottomSheet();
          }

        });
  }
}
