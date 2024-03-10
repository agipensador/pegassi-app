import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/views/widgets/width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditButtonDefault extends GetView {
  final Color colorButton;
  final IconData? icon;
  final String textSvg;
  final Color colorIcon;
  final String textButton;
  final Color colorTextButton;
  final double verticalSpaceText;
  final VoidCallback? onClick;

  EditButtonDefault(
      {Key? key,
      this.colorButton = AppColors.primaryColor,
      this.icon,
      this.textSvg = '',
      this.colorIcon = Colors.white,
      this.verticalSpaceText = 8,
      this.textButton = '',
      this.colorTextButton = Colors.white,
      this.onClick})
      : super(key: key);

  final ManagerController controllerManager = Get.put(ManagerController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: SizedBox(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 2,
              backgroundColor: colorButton,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          onPressed: onClick,
          child: Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: controllerManager.isLoaded.value == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        icon != null
                            ? Icon(
                                icon,
                                color: colorIcon,
                              )
                            : const SizedBox(),
                        textSvg.isNotEmpty
                            ? SvgPicture.asset(
                                textSvg,
                                height: 24,
                                width: 24,
                              )
                            : const SizedBox(),
                        icon != null && textSvg.isNotEmpty
                            ? const SizedBox(
                                width: 12,
                              )
                            : const SizedBox(),
                        const Width(8),
                        Expanded(
                          child: FittedBox(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: verticalSpaceText),
                              child: Text(
                                textButton,
                                style: AppStyles.version
                                    .copyWith(color: colorTextButton),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : const CircularProgressIndicator(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
