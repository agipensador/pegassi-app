import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/viewmodels/feedback_controller.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PartFeedbackInitiation extends GetView {
  PartFeedbackInitiation({Key? key}) : super(key: key);

  final FeedbackController feedbackController = Get.put(FeedbackController());
  final ManagerController controllerManager = Get.put(ManagerController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              highlightColor: AppColors.primaryColor.withOpacity(0.1),
              splashColor: Colors.transparent,
              color: Colors.white,
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Get.close(1);
              },
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Sugestões',
                  textAlign: TextAlign.center,
                  style: AppStyles.title.copyWith(
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.grey.shade900.withOpacity(1.0),
                        offset: const Offset(1.0, 1.0),
                        blurRadius: 1.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Center(
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: [
                Text('PAGINNA FEDBACK INITIACAO')
                // EditCardDefault(
                //   onTapInkWell: () {
                //     feedbackController.setfeedbackContent(1);
                //   },
                //   widgetPartCardColumn: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       SvgPicture.asset(
                //         'assets/icons/adaptacoes_card.svg',
                //       ),
                //       Text(
                //         "ADAPTAÇÕES",
                //         style: AppStyles.title.copyWith(
                //             color: AppColors.primaryColor,
                //             fontSize: controllerManager.isTablet ? 24 : 16),
                //       ),
                //     ],
                //   ),
                // ),
                // EditCardDefault(
                //   onTapInkWell: () {
                //     feedbackController.setfeedbackContent(2);
                //   },
                //   widgetPartCardColumn: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       SvgPicture.asset(
                //         'assets/icons/logo_conversor.svg',
                //       ),
                //       Text(
                //         "CONVERSÕES",
                //         style: AppStyles.title.copyWith(
                //             color: AppColors.primaryColor,
                //             fontSize: controllerManager.isTablet ? 24 : 16),
                //       ),
                //     ],
                //   ),
                // ),
                // EditCardDefault(
                //   onTapInkWell: () {
                //     feedbackController.setfeedbackContent(3);
                //   },
                //   widgetPartCardColumn: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       SvgPicture.asset(
                //         'assets/icons/iconamoon_comment_duotone.svg',
                //       ),
                //       Text(
                //         "MELHORIAS",
                //         style: AppStyles.title.copyWith(
                //             color: AppColors.primaryColor,
                //             fontSize: controllerManager.isTablet ? 24 : 16),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
