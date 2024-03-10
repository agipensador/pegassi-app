import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/viewmodels/premium_controller.dart';
import 'package:app_pgss/views/edits/edit_button_default.dart';
import 'package:app_pgss/views/screens/fragments/fragment_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenPremium extends GetView {
  ScreenPremium({Key? key}) : super(key: key);

  final PremiumController premiumController = Get.put(PremiumController());
  final ManagerController controllerManager = Get.put(ManagerController());

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    final isTablet = premiumController.controllerManager.isTablet;

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
            () => WillPopScope(
              onWillPop: () async {
                premiumController.controllerManager.currentPageIndex.value = 0;

                Get.offAll(FragmentBottomNavigation());

                return true;
              },
              child: Scaffold(
                appBar:AppBar(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        leading: const SizedBox.shrink(),
                        flexibleSpace: Container(
                          color: Colors.transparent,
                          child: Text('aas')
                          ),
                        ),
                bottomNavigationBar:  const SizedBox.shrink(),
                backgroundColor: Colors.transparent,
                body: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          highlightColor:
                              AppColors.primaryColor.withOpacity(0.1),
                          splashColor: Colors.transparent,
                          color: Colors.white,
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                          onPressed: () {
                            premiumController
                                .controllerManager.currentPageIndex.value = 0;
                            Get.offAll(FragmentBottomNavigation());
                          },
                        ),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.fitWidth,
                            child: Text(
                              'PREMIUM',
                              textAlign: TextAlign.center,
                              style: AppStyles.title.copyWith(
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color:
                                        Colors.grey.shade900.withOpacity(1.0),
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
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return SingleChildScrollView(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: constraint.maxHeight),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: premiumController
                                        .controllerManager.isPayAccount.value
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.spaceEvenly,
                                children: [
                                  Visibility(
                                    visible: !premiumController
                                        .controllerManager.isPayAccount.value,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      child: Visibility(
                                        child: Column(
                                          children: [
                                            FittedBox(
                                              child: Text(
                                                'ESTAMOS SEMPRE TRABALHANDO PARA\nMELHORAR O APLICATIVO, E AGORA\nVOCÊ PODE FAZER PARTE DISTO! ',
                                                style: AppStyles.description
                                                    .copyWith(
                                                        color: Colors
                                                            .white,
                                                        fontSize:
                                                            isTablet ? 24 : 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            const SizedBox(height: 24),
                                            FittedBox(
                                              child: Text(
                                                'NO PREMIUM VOCÊ TERÁ TODAS AS\nMELHORIAS EM PRIMEIRA MÃO E\nCONTEÚDOS EXCLUSIVOS PREMIUM.\n\nMAIS BARATO QUE UMA CÓPIA YALE!',
                                                style: AppStyles.description
                                                    .copyWith(
                                                        color: Colors
                                                            .white,
                                                        fontSize:
                                                            isTablet ? 24 : 14,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: Card(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: Container(
                                        width: double.infinity,
                                        constraints: isTablet
                                            ? const BoxConstraints(
                                                maxWidth: 700, minHeight: 600)
                                            : const BoxConstraints(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                        !premiumController
                                                                .controllerManager
                                                                .isPayAccount
                                                                .value
                                                            ? 'PREMIUM'
                                                            : 'OBA, VOCÊ JÁ É PREMIUM!',
                                                        style: AppStyles
                                                            .subtitle
                                                            .copyWith(
                                                                color: Colors
                                                                    .black87,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    isTablet
                                                                        ? 32
                                                                        : 20),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ),
                                              Visibility(
                                                visible: premiumController
                                                    .controllerManager
                                                    .isPayAccount
                                                    .value,
                                                child: Flexible(
                                                  child: FittedBox(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 24.0),
                                                      child: Text(
                                                          'SENDO PREMIUM VOCÊ TEM BENEFÍCIOS\nEXCLUSIVOS QUE SÓ O PREMIUM TEM!',
                                                          style: AppStyles
                                                              .title
                                                              .copyWith(
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  fontSize:
                                                                      isTablet
                                                                          ? 32
                                                                          : 24,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Visibility(
                                                visible: !premiumController
                                                    .controllerManager
                                                    .isPayAccount
                                                    .value,
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Flexible(
                                                        child: FittedBox(
                                                          child: Text(
                                                              'R\$ 4,99',
                                                              style: AppStyles.title.copyWith(
                                                                  color: AppColors
                                                                      .backgroundColor,
                                                                  fontSize:
                                                                      isTablet
                                                                          ? 50
                                                                          : 35,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        child: FittedBox(
                                                          child: Text(' /mês',
                                                              style: AppStyles.title.copyWith(
                                                                  color: AppColors
                                                                      .backgroundColor,
                                                                  fontSize:
                                                                      isTablet
                                                                          ? 32
                                                                          : 16),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(Icons.check,
                                                        size:
                                                            isTablet ? 32 : 20),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                        'ACESSO AO BANCO SEM INTERNET',
                                                        style: AppStyles
                                                            .subtitle
                                                            .copyWith(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    isTablet
                                                                        ? 30
                                                                        : 14),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(Icons.check,
                                                        size:
                                                            isTablet ? 30 : 20),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                        'CATÁLOGO DE CHAVES',
                                                        style: AppStyles
                                                            .subtitle
                                                            .copyWith(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    isTablet
                                                                        ? 30
                                                                        : 14),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Icon(Icons.check,
                                                        size:
                                                            isTablet ? 32 : 20),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                        'LIVRE DE PROPAGANDAS',
                                                        style: AppStyles
                                                            .subtitle
                                                            .copyWith(
                                                                color: Colors
                                                                    .black,
                                                                fontSize:
                                                                    isTablet
                                                                        ? 32
                                                                        : 14),
                                                        maxLines: 2,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0),
                                                child: FittedBox(
                                                  child: Text(
                                                      !premiumController
                                                              .controllerManager
                                                              .isPayAccount
                                                              .value
                                                          ? 'PRA ATIVAR O PREMIUM É SÓ CLICAR\n EM CONTINUAR E DEPOIS EM ASSINAR.'
                                                              '\nUTILIZAMOS O GOOGLE PARA\nGARANTIR MAIS SEGURANÇA😉'
                                                          : 'GRAÇAS AOS PREMIUNS CONSEGUIMOS\nMELHORAR O APP CADA VEZ MAIS!\n'
                                                              'EM BREVE NOVIDADES,\nVALEU!!!😉',
                                                      style: AppStyles.subtitle
                                                          .copyWith(
                                                              color: AppColors
                                                                  .backgroundColor,
                                                              fontSize: isTablet
                                                                  ? 26
                                                                  : 18),
                                                      maxLines: 4,
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                                ),
                                              ),
                                              !premiumController
                                                      .controllerManager
                                                      .isPayAccount
                                                      .value
                                                  ? EditButtonDefault(
                                                      verticalSpaceText: 8,
                                                      colorButton: AppColors
                                                          .primaryColor,
                                                      textButton: 'CONTINUAR',
                                                      onClick: () {
                                                        //TODO TESTE
                                                        premiumController
                                                            .controllerManager
                                                            .isPayAccount
                                                            .toggle();

                                                        premiumController
                                                            .controllerManager
                                                            .currentPageIndex
                                                            .value = 0;

                                                        // TODO FUNCIONANDO PLAYSTORE
                                                        // if (!premiumController
                                                        //     .controllerManager
                                                        //     .isPayAccount
                                                        //     .value) {
                                                        //   premiumController
                                                        //       .getFetchOffers();
                                                        // }
                                                      },
                                                    )
                                                  : Align(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: TextButton(
                                                          onPressed: () {
                                                            // //TODO TESTE
                                                            premiumController
                                                                .controllerManager
                                                                .isPayAccount
                                                                .toggle();

                                                            premiumController
                                                                .controllerManager
                                                                .currentPageIndex
                                                                .value = 0;

                                                            // TODO FUNCIONANDO PLAYSTORE

                                                            // premiumController
                                                            //     .controllerManager
                                                            //     .openLink(
                                                            //         'https://play.google.com/store/account/subscriptions?sku=pro.monthly.${Strings.lowercaseIdApp}');
                                                          },
                                                          child: Text(
                                                            'Mais informações na Play Store...',
                                                            style: AppStyles
                                                                .subtitle
                                                                .copyWith(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        isTablet
                                                                            ? 22
                                                                            : 14),
                                                          )),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  !premiumController
                                          .controllerManager.isPayAccount.value
                                      ? Obx(
                                          () => const SizedBox.shrink(),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FragmentCardTransferOffline {
  const FragmentCardTransferOffline();
}
