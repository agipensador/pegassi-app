import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/strings.dart';
import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/views/widgets/height.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class FragmentCardPix extends GetView<ManagerController> {
  const FragmentCardPix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.copyPix.value = false;
    return Obx(
      () => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: SizedBox(
          child: Card(
            margin: EdgeInsets.zero,
            color: controller.copyPix.value == true
                ? Colors.white
                : AppColors.primaryColor,
            elevation: 2,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: InkWell(
              splashColor: Colors.white.withOpacity(.5),
              borderRadius: BorderRadius.circular(30),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: controller.isTabletVerify(context) == true
                        ? 20
                        : 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Ionicons.accessibility_sharp,
                          color: controller.copyPix.value == true
                              ? AppColors.primaryColor
                              : Colors.white,
                        ),
                        // const Width(8),
                        Expanded(
                          child: controller.copyPix.value != true
                              ? Text(
                                  controller.isTabletVerify(context) == true
                                      ? Strings.buttonPixDevelopmentApp
                                          .replaceAll('\n', ' ')
                                      : Strings.buttonPixDevelopmentApp,
                                  style: AppStyles.subtitle.copyWith(
                                      color: Colors.white,
                                      fontSize: controller.isTabletVerify(
                                                  context) ==
                                              true
                                          ? 20
                                          : 13),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2, right: 18),
                                  child: Text(
                                    'PIX COPIADO',
                                    style: AppStyles.error.copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: controller.isTabletVerify(
                                                    context) ==
                                                true
                                            ? 20
                                            : 14),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: controller.copyPix.value == true,
                      child: Column(
                        children: [
                          const Height(10),
                          Text(
                            'Titular: KadCorp',
                            style: AppStyles.hint.copyWith(
                                color: AppColors.backgroundColor,
                                fontSize:
                                    controller.isTabletVerify(context) ==
                                            true
                                        ? 24
                                        : 14),
                          ),
                          const Height(10),
                          FittedBox(
                            child: Text(
                              'Chave Pix (CNPJ): 48.238.582/0001-75',
                              style: AppStyles.hint.copyWith(
                                  color: AppColors.backgroundColor,
                                  fontSize:
                                      controller.isTabletVerify(context) ==
                                              true
                                          ? 20
                                          : 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                onTap: () async {
                  controller.copyPix.value = true;
                  await Clipboard.setData(
                      const ClipboardData(text: Strings.pixNumber));
                  controller.createGetSnackbar(title: 'Pix copiado', subtitle: 'Agora é só fazer o pix de qualquer valor pelo seu App do banco');

                }
            ),
          ),
        ),
      ),
    );
  }
}
