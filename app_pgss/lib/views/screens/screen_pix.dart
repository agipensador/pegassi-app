import 'dart:io';
import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/strings.dart';
import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/viewmodels/premium_controller.dart';
import 'package:app_pgss/views/edits/edit_button_default.dart';
import 'package:app_pgss/views/screens/fragments/fragment_card_transfer_offline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenPix extends GetView {
  ScreenPix({Key? key}) : super(key: key);

  final ManagerController controllerManager = Get.put(ManagerController());
  final PremiumController premiumController = Get.put(PremiumController());

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    controllerManager.qrCodeExists.value =
        controllerManager.prefs.getBool('sharedQrCodeExists') ?? false;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black,
                AppColors.primaryColor,
                Colors.white,
              ],
            ),
          ),
          child: Obx(
            () => Scaffold(
              appBar: !controllerManager.isPayAccount.value
                  ? AppBar(
                      elevation: 0,
                      backgroundColor: Colors.transparent,
                      leading: const SizedBox.shrink(),
                      flexibleSpace: Container(
                        color: Colors.transparent,
                        child: Obx(
                          () => const FragmentCardTransferOffline(),
                        ),
                      ),
                    )
                  : const PreferredSize(
                      preferredSize: Size.fromHeight(0),
                      child: SizedBox.shrink(),
                    ),
              bottomNavigationBar: !premiumController
                      .controllerManager.isPayAccount.value
                  ? BottomAppBar(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        color: Colors.transparent,
                        child: Obx(
                          () => const FragmentCardTransferOffline(),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              backgroundColor: Colors.transparent,
              body: Column(
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
                            'QR CODE CHAVEIRO',
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
                    child: RawScrollbar(
                      thumbVisibility: true,
                      thumbColor: AppColors.primaryColor.withOpacity(.5),
                      radius: const Radius.circular(10),
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return GetX<ManagerController>(
                            builder: (controller) => SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight: constraint.maxHeight),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            controller.qrCodeExists.value
                                                ? controllerManager.isTablet
                                                    ? Strings.thisIsYourQrCode
                                                        .replaceAll('\n', ' ')
                                                    : Strings.thisIsYourQrCode
                                                : controllerManager.isTablet
                                                    ? Strings.generateYourQrCode
                                                        .replaceAll('\n', ' ')
                                                    : Strings
                                                        .generateYourQrCode,
                                            style: AppStyles.description
                                                .copyWith(
                                                    color:
                                                        Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: FittedBox(
                                            child: Text(
                                              'DISPONIBILIZAMOS ESTE SERVIÇO SEM COBRANÇAS',
                                              style: AppStyles.description
                                                  .copyWith(
                                                      color: Colors.grey,
                                                      fontSize:
                                                          controllerManager
                                                                  .isTablet
                                                              ? 14
                                                              : 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          side: const BorderSide(
                                            color: Colors.white,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: double.infinity,
                                              constraints: const BoxConstraints(
                                                  maxWidth: 700),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: Column(
                                                  children: [
                                                    controller
                                                            .qrCodeExists.value
                                                        ? Image.file(
                                                            File(
                                                              controller.prefs
                                                                  .getString(
                                                                      'sharedImagePathPix')
                                                                  .toString(),
                                                            ),
                                                          )
                                                        : Image.asset(
                                                            'assets/images/copy_qr_code_pix.png',
                                                            scale: 0.5,
                                                          ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          vertical: 8.0),
                                                      child: FittedBox(
                                                        child: Text(
                                                            controller
                                                                    .qrCodeExists
                                                                    .value
                                                                ? 'NA HORA DO PAGAMENTO POR PIX É SÓ O\nCLIENTE ESCANEAR O QR CODE PELO APP'
                                                                        '\nDE PAGAMENTO E DIGITAR O VALOR DO\nSERVIÇO QUE FOI REALIZADO'
                                                                    .toUpperCase()
                                                                : 'Para isso você deve acessar o SITE abaixo,\n'
                                                                    'preencher os dados obrigatórios,\n'
                                                                    'Gerar o QR CODE e depois volte no\n'
                                                                    'APP e clique em ’ADICIONAR QR CODE’',
                                                            style: AppStyles.subtitle.copyWith(
                                                                color: AppColors
                                                                    .backgroundColor,
                                                                fontSize:
                                                                    controllerManager
                                                                            .isTablet
                                                                        ? 20
                                                                        : 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                            maxLines: 4,
                                                            textAlign: TextAlign
                                                                .center,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                    ),
                                                    controller
                                                            .qrCodeExists.value
                                                        ? const SizedBox
                                                            .shrink()
                                                        : TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              tapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          8.0),
                                                              child: Text(
                                                                  'CLIQUE AQUI PARA VER O TUTORIAL DE\n'
                                                                  'COMO PREENCHER OS DADOS NO SITE',
                                                                  style: AppStyles
                                                                      .subtitle
                                                                      .copyWith(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              14),
                                                                  maxLines: 2,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis),
                                                            ),
                                                            onPressed: () {
                                                              // showDialog(
                                                              //   barrierDismissible:
                                                              //       true,
                                                              //   context:
                                                              //       context,
                                                              //   builder:
                                                              //       (context) {
                                                              //     return FragmentShowAlertDialog(
                                                              //       textTitleAlertDialog:
                                                              //           'TUTORIAL PARA GERAR QR CODE',
                                                              //       widgetColumnBody:
                                                              //           Column(
                                                              //         children: <Widget>[
                                                              //           Container(
                                                              //             child:
                                                              //                 Image.asset(
                                                              //               'assets/images/example_pix.png',
                                                              //               scale:
                                                              //                   1,
                                                              //             ),
                                                              //             decoration:
                                                              //                 BoxDecoration(
                                                              //               border:
                                                              //                   Border.all(width: 0.2),
                                                              //             ),
                                                              //           ),
                                                              //           controller.rowTwoTexts(
                                                              //               '1-',
                                                              //               'Selecione o tipo da Chave(Telefone, Email, CPF...);',
                                                              //               context),
                                                              //           const Divider(),
                                                              //           controller.rowTwoTexts(
                                                              //               '2-',
                                                              //               'Insira a chave PIX. EX:(11)99999-9999;',
                                                              //               context),
                                                              //           const Divider(),
                                                              //           controller.rowTwoTexts(
                                                              //               '3-',
                                                              //               'Digite o nome de quem receberá o PIX;',
                                                              //               context),
                                                              //           const Divider(),
                                                              //           controller.rowTwoTexts(
                                                              //               '4-',
                                                              //               'Digite a cidade que se localiza o chaveiro;',
                                                              //               context),
                                                              //           const Divider(),
                                                              //           controller.rowTwoTexts(
                                                              //               '5-',
                                                              //               'Deixe em branco para que o cliente digite o valor do serviço feito na hora da transação;',
                                                              //               context),
                                                              //           const Divider(),
                                                              //           controller.rowTwoTexts(
                                                              //               '6-',
                                                              //               'Digite o NOMEDOCHAVEIRO, sem espaço;',
                                                              //               context),
                                                              //           const Divider(),
                                                              //           controller.rowTwoTexts(
                                                              //               '7-',
                                                              //               'Clique em ’Gerar’;',
                                                              //               context),
                                                              //           const Divider(),
                                                              //           controller.rowTwoTexts(
                                                              //               '8-',
                                                              //               'Por úlimo, clique em ‘Baixar QrCode’;',
                                                              //               context),
                                                              //           const Divider(),
                                                              //           controller.rowTwoTexts(
                                                              //               '*',
                                                              //               'DEPOIS DE GERAR A IMAGEM VOLTE AQUI NO APP E ADICIONE O QR CODE JÁ GERADO',
                                                              //               context)
                                                              //         ],
                                                              //       ),
                                                              //     );
                                                              //   },
                                                              // );
                                                            },
                                                          ),
                                                    Visibility(
                                                      visible: !controller
                                                          .qrCodeExists.value,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: FittedBox(
                                                          child: TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              tapTargetSize:
                                                                  MaterialTapTargetSize
                                                                      .shrinkWrap,
                                                            ),
                                                            child: Text(
                                                              'ACESSAR O SITE E GERAR QR CODE',
                                                              style: AppStyles
                                                                  .subtitle
                                                                  .copyWith(
                                                                color: AppColors
                                                                    .primaryColor,
                                                                fontSize: 18,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                              maxLines: 1,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            onPressed: (){
                                                              controller
                                                                  .openLink('https://www.gerarpix.com.br/');
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: controller.qrCodeExists.value,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 18, vertical: 8),
                                        child: Flex(
                                          direction: Axis.horizontal,
                                          children: [
                                            Expanded(
                                              child: Text(
                                                  'CONFIRA NO ATO SE A TRANSFERÊNCIA ESTÁ REALMENTE SENDO FEITA PARA CONTA BANCÁRIA CORRETA!',
                                                  style: AppStyles.subtitle
                                                      .copyWith(
                                                    color: Colors.white,
                                                    fontSize: controllerManager
                                                            .isTablet
                                                        ? 20
                                                        : 14,
                                                    shadows: [
                                                      Shadow(
                                                        color: Colors
                                                            .grey.shade900
                                                            .withOpacity(1.0),
                                                        offset: const Offset(
                                                            1.0, 1.0),
                                                        blurRadius: 1.0,
                                                      ),
                                                    ],
                                                  ),
                                                  maxLines: 3,
                                                  textAlign: TextAlign.start,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: controller.qrCodeExists.value,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FittedBox(
                                          child: Text(
                                            controllerManager.isTablet
                                                ? Strings
                                                    .alertConversorNotPayErrors
                                                    .replaceAll('\n', ' ')
                                                : Strings
                                                    .alertConversorNotPayErrors,
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize:
                                                    controllerManager.isTablet
                                                        ? 20
                                                        : 16,
                                                fontWeight: FontWeight.bold),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: EditButtonDefault(
                                        verticalSpaceText: 10,
                                        icon: Icons.qr_code_sharp,
                                        textButton:
                                            controller.qrCodeExists.value
                                                ? 'GERAR NOVO QR CODE'
                                                : 'ADICIONAR QR CODE',
                                        onClick: () {
                                          if (controller.qrCodeExists.value) {
                                            controller.prefs
                                                .remove('sharedImagePathPix');
                                            controller.qrCodeExists.value =
                                                false;
                                            controller.prefs.setBool(
                                                'sharedQrCodeExists', false);
                                            controllerManager.showIntersticialScreens();
                                          } else {
                                            controller.pickImage();
                                          }
                                        },
                                      ),
                                    ),
                                    !premiumController.controllerManager
                                            .isPayAccount.value
                                        ? Obx(
                                            () => const SizedBox.shrink(),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
