import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/viewmodels/feedback_controller.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/views/edits/edit_button_default.dart';
import 'package:app_pgss/views/widgets/height.dart';
import 'package:app_pgss/views/widgets/width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PartFeedbackSuggestionsImprovements extends GetView {
  PartFeedbackSuggestionsImprovements({Key? key}) : super(key: key);

  final ManagerController controllerManager = Get.put(ManagerController());
  final FeedbackController feedbackController = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    controllerManager.isTabletVerify(context);
    final isTablet = controllerManager.isTablet;
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
                feedbackController.setfeedbackContent(0);
              },
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Melhorias',
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
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/iconamoon_comment_duotone.svg',
                      color: Colors.white,
                    ),
                    const Width(8),
                    Flexible(
                      child: Text(
                        'Quais melhorias você gostaria de ver no APP DO CHAVEIRO? ',
                        style: AppStyles.title.copyWith(
                            color: Colors.white,
                            fontSize: controllerManager.isTablet ? 20 : 16),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                const Height(8),
                // EditCardDefault(
                //   widgetPartCardColumn: Column(
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       const Height(8),
                Text(
                  'Digite ideias de coisas novas ou melhorias para o APP. Você também pode avisar por aqui caso algo esteja errado😀',
                  style: AppStyles.title.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: controllerManager.isTablet ? 24 : 16),
                ),
                // const Height(8),
                // TextField(
                //   controller: feedbackController.improvementText,
                //   cursorColor: Colors.black,
                //   minLines: isTablet ? 5 : 3,
                //   maxLines: 12,
                //   decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(12.0),
                //           borderSide:
                //               const BorderSide(color: Colors.grey)),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(12.0),
                //         borderSide:
                //             const BorderSide(color: Colors.grey),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(12.0),
                //         borderSide:
                //             const BorderSide(color: Colors.black),
                //       ),
                //       hintText: 'Digite aqui...',
                //       hintStyle:
                //           TextStyle(fontSize: isTablet ? 18 : 16)),
                // ),
                // const Height(8),
                // EditButtonDefault(
                //   verticalSpaceText: 16,
                //   colorButton: AppColors.primaryColor,
                //   textButton: 'ENVIAR SUGESTÃO',
                //   onClick: () {
                //     if (feedbackController.improvementText.text.length <
                //         5) {
                //       controllerManager.createGetSnackbar(
                //           title: 'OPS',
                //           subtitle: 'Preencha o campo corretamente!');
                //     } else {
                //       feedbackController.setfeedbackContent(0);
                //       controllerManager.createGetSnackbar(
                //           title: 'LEMBRETE',
                //           subtitle: 'CLIQUE EM ENVIAR NO EMAIL');
                //       controllerManager.sendEmail(
                //           title:
                //               'SUGESTÃO DE MELHORIA PARA O APP DO CHAVEIRO',
                //           message:
                //               feedbackController.improvementText.text);
                //       feedbackController.improvementText.clear();
                //     }
                //   },
                // ),
              ],
            ),
          ),
        ))
      ],
    );
  }
}
