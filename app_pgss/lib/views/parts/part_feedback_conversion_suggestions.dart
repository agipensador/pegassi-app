import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/viewmodels/feedback_controller.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/views/widgets/height.dart';
import 'package:app_pgss/views/widgets/width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PartFeedbackConversionSuggestions extends GetView {
  PartFeedbackConversionSuggestions({Key? key}) : super(key: key);
  final ManagerController controllerManager = Get.put(ManagerController());
  final FeedbackController feedbackController = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    controllerManager.isTabletVerify(context);

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
                feedbackController.selectedRadio = RxInt(-1);
                feedbackController.setfeedbackContent(0);
              },
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  'Conversões',
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
                        'assets/icons/logo_conversor.svg',
                        color: Colors.white,
                      ),
                      const Width(8),
                      Flexible(
                        child: Text(
                          'Conversões são marcas e números diferentes, mas feitas para mesma fechadura. Ex: GOLD 848 e RCA 5484.',
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
                  //       Text(
                  //         'PREENCHA AS CONVERSÕES ABAIXO',
                  //         style: AppStyles.title.copyWith(
                  //             color: AppColors.primaryColor,
                  //             fontSize: controllerManager.isTablet ? 24 : 16),
                  //       ),
                  //       const Height(8),
                  //       Padding(
                  //         padding: const EdgeInsets.all(8.0),
                  //         child: Column(
                  //           children: [
                  //             genericRow(
                  //                 'DOVALE',
                  //                 feedbackController.dovaleKeySuggested,
                  //                 TextInputType.number),
                  //             const Height(8),
                  //             genericRow(
                  //                 'GOLD',
                  //                 feedbackController.goldKeySuggested,
                  //                 TextInputType.number),
                  //             const Height(8),
                  //             genericRow(
                  //                 'IZA',
                  //                 feedbackController.izaKeySuggested,
                  //                 TextInputType.visiblePassword),
                  //             const Height(8),
                  //             genericRow(
                  //                 'JAS',
                  //                 feedbackController.jasKeySuggested,
                  //                 TextInputType.number),
                  //             const Height(8),
                  //             genericRow(
                  //                 'JSA',
                  //                 feedbackController.jsaKeySuggested,
                  //                 TextInputType.visiblePassword),
                  //             const Height(8),
                  //             genericRow(
                  //                 'LAND',
                  //                 feedbackController.landKeySuggested,
                  //                 TextInputType.visiblePassword),
                  //             const Height(8),
                  //             genericRow(
                  //                 'RCA',
                  //                 feedbackController.rcaKeySuggested,
                  //                 TextInputType.number),
                  //             const Height(8),
                  //             genericRow(
                  //                 'SILCA',
                  //                 feedbackController.silcaKeySuggested,
                  //                 TextInputType.visiblePassword),
                  //             const Height(8),
                  //             genericRow(
                  //                 'TOOLS',
                  //                 feedbackController.toolsKeySuggested,
                  //                 TextInputType.number),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         padding: const EdgeInsets.all(10.0),
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           border: Border.all(),
                  //           boxShadow: const [
                  //             BoxShadow(
                  //               offset: Offset(3, 3),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Text(
                  //             '*Caso não saiba o número ou o modelo não possua conversão, deixe sem preencher.',
                  //             style: AppStyles.hint.copyWith(
                  //                 fontSize:
                  //                     controllerManager.isTablet ? 20 : 16)),
                  //       ),
                  //       const Divider(color: Colors.black87, height: 26),
                  //       Text(
                  //         'SELECIONE A CATEGORIA:',
                  //         style: AppStyles.title.copyWith(
                  //             color: AppColors.primaryColor,
                  //             fontSize: controllerManager.isTablet ? 24 : 16),
                  //       ),
                  //       Obx(
                  //         () => Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             rowCategories(0, 'TETRA'),
                  //             rowCategories(1, 'YALE'),
                  //             rowCategories(2, 'AUTOMOTIVA'),
                  //           ],
                  //         ),
                  //       ),
                  //       EditButtonDefault(
                  //         verticalSpaceText: 16,
                  //         colorButton: AppColors.primaryColor,
                  //         textButton: 'ENVIAR SUGESTÃO',
                  //         onClick: () {
                  //           if ((feedbackController.dovaleKeySuggested.text.isEmpty &&
                  //                   feedbackController
                  //                       .goldKeySuggested.text.isEmpty &&
                  //                   feedbackController
                  //                       .izaKeySuggested.text.isEmpty &&
                  //                   feedbackController
                  //                       .jasKeySuggested.text.isEmpty &&
                  //                   feedbackController
                  //                       .jsaKeySuggested.text.isEmpty &&
                  //                   feedbackController
                  //                       .landKeySuggested.text.isEmpty &&
                  //                   feedbackController
                  //                       .rcaKeySuggested.text.isEmpty &&
                  //                   feedbackController
                  //                       .silcaKeySuggested.text.isEmpty &&
                  //                   feedbackController
                  //                       .toolsKeySuggested.text.isEmpty) ||
                  //               feedbackController.selectedRadio.value < 0) {
                  //             controllerManager.createGetSnackbar(
                  //                 title: 'OPS',
                  //                 subtitle:
                  //                     'Preencha os campos vazios e não esqueça de selecionar uma categoria!');
                  //           } else {
                  //             String? value1 = feedbackController
                  //                     .dovaleKeySuggested.text.isNotEmpty
                  //                 ? 'DOVALE: ${feedbackController.dovaleKeySuggested.text}'
                  //                 : '';
                  //             String? value2 = feedbackController
                  //                     .goldKeySuggested.text.isNotEmpty
                  //                 ? '\nGOLD: ${feedbackController.goldKeySuggested.text}'
                  //                 : '';
                  //             String? value3 = feedbackController
                  //                     .izaKeySuggested.text.isNotEmpty
                  //                 ? '\nIZA: ${feedbackController.izaKeySuggested.text}'
                  //                 : '';
                  //             String? value4 = feedbackController
                  //                     .jasKeySuggested.text.isNotEmpty
                  //                 ? '\nJAS: ${feedbackController.jasKeySuggested.text}'
                  //                 : '';
                  //             String? value5 = feedbackController
                  //                     .jsaKeySuggested.text.isNotEmpty
                  //                 ? '\nJSA: ${feedbackController.jsaKeySuggested.text}'
                  //                 : '';
                  //             String? value6 = feedbackController
                  //                     .landKeySuggested.text.isNotEmpty
                  //                 ? '\nLAND: ${feedbackController.landKeySuggested.text}'
                  //                 : '';
                  //             String? value7 = feedbackController
                  //                     .rcaKeySuggested.text.isNotEmpty
                  //                 ? '\nRCA: ${feedbackController.rcaKeySuggested.text}'
                  //                 : '';
                  //             String? value8 = feedbackController
                  //                     .silcaKeySuggested.text.isNotEmpty
                  //                 ? '\nSILCA: ${feedbackController.silcaKeySuggested.text}'
                  //                 : '';
                  //             String? value9 = feedbackController
                  //                     .toolsKeySuggested.text.isNotEmpty
                  //                 ? '\nTOOLS: ${feedbackController.toolsKeySuggested.text}'
                  //                 : '';
                  //
                  //             String? concatenatedValues =
                  //                 'Categoria: ${feedbackController.keyCategory}\n\n$value1$value2$value3$value4$value5$value6$value7$value8$value9';
                  //
                  //             feedbackController.setfeedbackContent(0);
                  //             controllerManager.createGetSnackbar(
                  //                 title: 'LEMBRETE',
                  //                 subtitle: 'CLIQUE EM ENVIAR NO EMAIL');
                  //             controllerManager.sendEmail(
                  //                 title:
                  //                     'SUGESTÃO DE CONVERSÃO PARA O APP DO CHAVEIRO',
                  //                 message: concatenatedValues);
                  //
                  //             feedbackController.selectedRadio.value = -1;
                  //
                  //             feedbackController.dovaleKeySuggested.clear();
                  //             feedbackController.goldKeySuggested.clear();
                  //             feedbackController.izaKeySuggested.clear();
                  //             feedbackController.jasKeySuggested.clear();
                  //             feedbackController.jsaKeySuggested.clear();
                  //             feedbackController.landKeySuggested.clear();
                  //             feedbackController.rcaKeySuggested.clear();
                  //             feedbackController.silcaKeySuggested.clear();
                  //             feedbackController.toolsKeySuggested.clear();
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

  Widget genericRow(String textBrand, TextEditingController controllerBrand,
      TextInputType? keyboardType) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            textBrand,
            style: AppStyles.title.copyWith(color: Colors.black, fontSize: 16),
          ),
        ),
        Expanded(
          child: IntrinsicWidth(
            child: TextField(
              controller: controllerBrand,
              maxLength: 7,
              cursorColor: Colors.black,
              keyboardType: keyboardType,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                counterText: '',
                isDense: true,
                fillColor: Colors.grey.shade200,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                hintText: 'Digite o valor',
                hintStyle: AppStyles.hint,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget rowCategories(int valueRadio, String category) {
    return Row(
      children: [
        Radio(
            activeColor: Colors.black,
            value: valueRadio,
            visualDensity:
                const VisualDensity(horizontal: VisualDensity.minimumDensity),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            groupValue: feedbackController.selectedRadio.value,
            onChanged: (int? value) {
              feedbackController.setSelectedRadio(value);
              feedbackController.keyCategory = category;
            }),
        Text(
          category,
          style: AppStyles.title.copyWith(color: Colors.black, fontSize: 16),
        )
      ],
    );
  }
}
