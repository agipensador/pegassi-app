import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/viewmodels/feedback_controller.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/views/widgets/height.dart';
import 'package:app_pgss/views/widgets/width.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PartFeedbackAdaptationSuggestions extends GetView {
  PartFeedbackAdaptationSuggestions({Key? key}) : super(key: key);

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
                feedbackController.adaptationBaseModel.clear();
                feedbackController.adaptationModels.clear();
              },
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Adaptações',
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
              padding: const EdgeInsets.all(6),
              child: Column(
                children: [
                  Text('PARTE FEED SUGESTOES')
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SvgPicture.asset(
                  //       'assets/icons/adaptacoes_card.svg',
                  //       color: Colors.white,
                  //     ),
                  //     const Width(8),
                  //     Flexible(
                  //       child: Text(
                  //         'Adaptações são modelos de chaves diferentes, que funcionam para mesma fechadura. Ex: GOLD 1071 e GOLD 848.',
                  //         style: AppStyles.title.copyWith(
                  //             color: Colors.white,
                  //             fontSize: controllerManager.isTablet ? 20 : 16),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // const Height(8),
                  // EditCardDefault(
                  //   widgetPartCardColumn: Column(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       const Height(8),
                  //       Text(
                  //         'DIGITE O NÚMERO GOLD DO MODELO E DEPOIS DIGITE O NÚMERO GOLD DA ADAPTAÇÃO',
                  //         style: AppStyles.title.copyWith(
                  //             color: AppColors.primaryColor,
                  //             fontSize: controllerManager.isTablet ? 24 : 16),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //       const Height(16),
                  //       FragmentSimpleTextField(
                  //         textEditingController:
                  //             feedbackController.adaptationBaseModel,
                  //         keyboardType: TextInputType.number,
                  //         inputFormatter: [
                  //           FilteringTextInputFormatter.allow(
                  //             RegExp(r'[0-9]'),
                  //           ),
                  //         ],
                  //         hintText: 'DIGITE O NÚMERO DO MODELO (EX: 1071)',
                  //         isTablet: isTablet,
                  //         maxLenghtNumbers: 5,
                  //       ),
                  //       const Height(8),
                  //       FragmentSimpleTextField(
                  //         textEditingController:
                  //             feedbackController.adaptationModels,
                  //         keyboardType: TextInputType.number,
                  //         inputFormatter: [
                  //           FilteringTextInputFormatter.allow(
                  //             RegExp(r'[0-9, ]'),
                  //           ),
                  //         ],
                  //         isTablet: isTablet,
                  //         hintText:
                  //             'DIGITE O NÚMERO DA ADAPTAÇÃO GOLD (EX: 848)',
                  //       ),
                  //       const Height(8),
                  //       Container(
                  //         padding: const EdgeInsets.all(10.0),
                  //         margin: const EdgeInsets.symmetric(
                  //             horizontal: 10, vertical: 10),
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           border: Border.all(),
                  //           boxShadow: const [
                  //             BoxShadow(
                  //               offset: Offset(3, 3),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Column(
                  //           children: [
                  //             Text(
                  //               'Caso tenha mais de um modelo de adaptação separe com vírgula. Exemplo: 848, 652...',
                  //               style: AppStyles.title.copyWith(
                  //                 color: Colors.black,
                  //                 fontSize:
                  //                     controllerManager.isTablet ? 24 : 16,
                  //               ),
                  //               textAlign: TextAlign.center,
                  //             ),
                  //             const Height(8),
                  //             Text(
                  //               '* Utilizamos o padrão GOLD para adaptações. Caso a adaptação NÃO seja número GOLD, será desconsiderada.',
                  //               style: AppStyles.title.copyWith(
                  //                 color: Colors.red,
                  //                 fontSize:
                  //                     controllerManager.isTablet ? 24 : 16,
                  //               ),
                  //               textAlign: TextAlign.center,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       const Height(8),
                  //       EditButtonDefault(
                  //         verticalSpaceText: 16,
                  //         colorButton: AppColors.primaryColor,
                  //         textButton: 'ENVIAR SUGESTÃO',
                  //         onClick: () {
                  //           if (feedbackController
                  //                   .adaptationBaseModel.text.isEmpty ||
                  //               feedbackController
                  //                   .adaptationModels.text.isEmpty) {
                  //             controllerManager.createGetSnackbar(
                  //                 title: 'OPS',
                  //                 subtitle: 'Preencha os campos vazios!');
                  //           } else {
                  //             feedbackController.setfeedbackContent(0);
                  //             controllerManager.createGetSnackbar(
                  //                 title: 'LEMBRETE',
                  //                 subtitle: 'CLIQUE EM ENVIAR NO EMAIL');
                  //             controllerManager.sendEmail(
                  //                 title:
                  //                     'SUGESTÃO DE ADAPTAÇÃO PARA O APP DO CHAVEIRO',
                  //                 message: feedbackController
                  //                         .adaptationModels.text
                  //                         .contains(',')
                  //                     ? 'MODELO GOLD: ${feedbackController.adaptationBaseModel.text}\n'
                  //                         'ADAPTA COM OS MODELOS GOLD: ${feedbackController.adaptationModels.text}'
                  //                     : 'MODELO GOLD: ${feedbackController.adaptationBaseModel.text}\n'
                  //                         'ADAPTA COM O MODELO GOLD: ${feedbackController.adaptationModels.text}');
                  //
                  //             feedbackController.adaptationBaseModel.clear();
                  //             feedbackController.adaptationModels.clear();
                  //           }
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
