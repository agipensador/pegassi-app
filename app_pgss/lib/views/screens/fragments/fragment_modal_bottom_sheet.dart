import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/strings.dart';
import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/viewmodels/home_controller.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/views/edits/edit_button_default.dart';
import 'package:app_pgss/views/screens/fragments/fragment_card_pix.dart';
import 'package:app_pgss/views/screens/screen_feedback.dart';
import 'package:app_pgss/views/screens/screen_pix.dart';
import 'package:app_pgss/views/widgets/height.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'fragment_card_transfer_offline.dart';

class FragmentModalBottomSheet extends GetView {
  final String version;

  FragmentModalBottomSheet({Key? key, required this.version}) : super(key: key);

  final ManagerController controllerManager = Get.put(ManagerController());
  final HomeController homecontroller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controllerManager.isTabletVerify(context);
    final isTablet = controllerManager.isTablet;

    // final carouselController = CarouselController();
    controllerManager.qrCodeExists.value =
        controllerManager.prefs.getBool('sharedQrCodeExists') ?? false;

    controllerManager.copyPix.value = false;

    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(
              top: MediaQueryData.fromView(View.of(context)).padding.top,
            ),
          ),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Colors.white,
              ),
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    height: 6,
                    width: 100,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // BOTAO PIX CHAVEIRO/QR CODE
                          EditButtonDefault(
                            icon: Icons.pix,
                            verticalSpaceText: isTablet ? 10 : 8,
                            textButton: controllerManager.qrCodeExists.value
                                ? 'QR CODE/PIX DO CHAVEIRO'
                                : isTablet
                                    ? Strings.buttonCreateQrCodePix
                                        .replaceAll('\n', ' ')
                                    : Strings.buttonCreateQrCodePix,
                            onClick: () {
                              controllerManager.showIntersticialScreens();
                              Get.off(() => ScreenPix());
                            },
                          ),

                          // BOTAO GOOGLE LENS
                          // EditButtonDefault(
                          //   textSvg: 'assets/icons/icon_googlelens.svg',
                          //   verticalSpaceText: isTablet ? 10 : 8,
                          //   textButton: isTablet
                          //       ? Strings.buttonSearchKeyGoogleLens
                          //           .replaceAll('\n', ' ')
                          //       : Strings.buttonSearchKeyGoogleLens,
                          //   onClick: () {
                          //     controllerManager
                          //         .launchURL(Strings.lowercaseGoogleLens);
                          //     FocusManager.instance.primaryFocus?.unfocus();
                          //   },
                          // ),
                          // BOTAO SUGESTÕES
                          EditButtonDefault(
                            icon: Icons.feedback_outlined,
                            verticalSpaceText: isTablet ? 10 : 8,
                            textButton: isTablet
                                ? Strings.buttonFeedback.replaceAll('\n', ' ')
                                : Strings.buttonFeedback,
                            onClick: () {
                              Get.off(() => ScreenFeedback());
                              if (controllerManager.connectionManagerController
                                      .connectionType.value &&
                                  controllerManager.sharedPrefGetSugestions() >=
                                      4 &&
                                  !controllerManager.isPayAccount.value) {
                                controllerManager.verifyQuantitySugestions();
                              }
                              if (!controllerManager.isPayAccount.value) {
                                controllerManager.addQuantityAdSugestions();
                              }
                            },
                          ),

                          // BOTAO PLAYSTORE
                          EditButtonDefault(
                            verticalSpaceText: 10,
                            icon: Ionicons.logo_google_playstore,
                            textButton: isTablet
                                ? Strings.buttonCommentPlaystore
                                    .replaceAll('\n', '')
                                : Strings.buttonCommentPlaystore,
                            onClick: () {
                              // controllerManager
                              //     .launchURL(Strings.lowercasePlayStore);
                              // FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),

                          // BOTAO COMPARTILHAR APP
                          EditButtonDefault(
                            verticalSpaceText: isTablet ? 10 : 16,
                            icon: Icons.share,
                            textButton: 'COMPARTILHE O APLICATIVO',
                            onClick: controllerManager.share,
                          ),

                          // BOTAO PIX DESENVOLVEDOR
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: FragmentCardPix(),
                          ),

                          const Flexible(child: Height(12)),
                          // Column(
                          //   mainAxisSize: MainAxisSize.max,
                          //   children: [
                          //     Text(
                          //       isTablet
                          //           ? Strings.buttonOthersAppsCarousel
                          //               .replaceAll('\n', ' ')
                          //           : Strings.buttonOthersAppsCarousel,
                          //       textAlign: TextAlign.center,
                          //       style: const TextStyle(
                          //           color: AppColors.primaryColor,
                          //           fontSize: 16,
                          //           fontWeight: FontWeight.bold),
                          //     ),
                          //     const Height(8),
                          //     CarouselSlider.builder(
                          //       carouselController: carouselController,
                          //       itemCount: controllerManager.pathImages.length,
                          //       options: CarouselOptions(
                          //           viewportFraction: isTablet ? 0.4 : 0.6,
                          //           height: isTablet ? 500 : 250,
                          //           enableInfiniteScroll: false,
                          //           enlargeCenterPage: true,
                          //           autoPlay: true,
                          //           enlargeStrategy:
                          //               CenterPageEnlargeStrategy.height,
                          //           onPageChanged: (index, reason) =>
                          //               controllerManager
                          //                   .activeIndexDots.value = index),
                          //       itemBuilder: (context, index, realIndex) {
                          //         return GestureDetector(
                          //           onTap: () => controllerManager
                          //               .redirectedAppPlaystore(index: index),
                          //           child: Card(
                          //             elevation: 4,
                          //             child: Container(
                          //               decoration: const BoxDecoration(
                          //                 borderRadius: BorderRadius.all(
                          //                   Radius.circular(8),
                          //                 ),
                          //                 color: Colors.grey,
                          //               ),
                          //               width:
                          //                   MediaQuery.of(context).size.width *
                          //                       0.5,
                          //               child: ClipRRect(
                          //                 borderRadius:
                          //                     BorderRadius.circular(8.0),
                          //                 child: Image.asset(
                          //                   controllerManager.pathImages[index],
                          //                   fit: BoxFit.fill,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //         );
                          //       },
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(top: 8.0),
                          //       child: AnimatedSmoothIndicator(
                          //         onDotClicked: (index) {
                          //           carouselController.animateToPage(
                          //             index,
                          //             duration:
                          //                 const Duration(milliseconds: 500),
                          //           );
                          //         },
                          //         activeIndex:
                          //             controllerManager.activeIndexDots.value,
                          //         count: controllerManager.pathImages.length,
                          //         effect: const JumpingDotEffect(
                          //             activeDotColor: AppColors.primaryColor,
                          //             dotColor: AppColors.grey,
                          //             dotHeight: 10,
                          //             dotWidth: 10),
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: FittedBox(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    child: Text(
                                      'Desenvolvido por ',
                                      style: AppStyles.title.copyWith(
                                          color: AppColors.backgroundColor,
                                          fontSize: 24),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Image.asset(
                                  'assets/images/kadcorp_preto.png',
                                  height: 20,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  controllerManager.showIntersticialScreens();
                                  controllerManager.openLink(
                                      'https://kadcorp.blogspot.com/2023/03/conversor-de-chaves-politica-de.html');
                                },
                                child: Text(
                                  'TERMOS DE USO',
                                  style: AppStyles.version.copyWith(
                                    color: Colors.black87,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                              Text(
                                'VERSÃO: $version',
                                style: AppStyles.version
                                    .copyWith(color: AppColors.backgroundColor),
                              ),
                            ],
                          ),
                          const Flexible(child: Height(8)),
                          Obx(() => !controllerManager.isPayAccount.value
                              ? const FragmentCardTransferOffline()
                              : const SizedBox.shrink()),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
