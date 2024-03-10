import 'dart:async';
import 'dart:io';
import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/strings.dart';
import 'package:app_pgss/resources/theme/app_style.dart';
import 'package:app_pgss/viewmodels/connection_manager_controller.dart';
import 'package:app_pgss/views/edits/edit_button_default.dart';
import 'package:app_pgss/views/screens/fragments/fragment_modal_bottom_sheet.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class ManagerController extends GetxController {
  final ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  final screenshotController = ScreenshotController();

  final ConnectionManagerController controllerNetwork =
      Get.find<ConnectionManagerController>();

  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  late SharedPreferences prefs;

  RxBool isPayAccount = false.obs;
  RxBool qrCodeExists = false.obs;
  RxBool copyPix = false.obs;
  RxBool isLoaded = false.obs;
  RxBool appSharedWhats = false.obs;
  bool isTablet = false;
  bool isSmallScreen = false;

  int quantity = 0;
  int quantityBottomSheet = 0;
  int quantitySugestions = 0;
  int quantityChangePage = 0;
  int quantityPremium = 0;

  int valueAppVersion = 0;
  int sharedAppVersion = 0;

  RxInt currentPageIndex = 0.obs;
  RxInt activeIndexDots = 0.obs;

  final pathImages = [
    'assets/images/page_imc.jpg',
    'assets/images/page_pomodoro.jpg'
  ];

  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    qrCodeExists.value = prefs.getBool('sharedQrCodeExists') ?? false;
    appSharedWhats.value = prefs.getBool('appSharedWhats') ?? false;
    quantity = prefs.getInt('quantityConversions') ?? 0;
    quantityBottomSheet = prefs.getInt('quantityBottomSheet') ?? 0;
    quantitySugestions = prefs.getInt('quantitySugestions') ?? 0;
    quantityChangePage = prefs.getInt('quantityChangePage') ?? 0;
    quantityPremium = prefs.getInt('quantityPremium') ?? 0;
    sharedAppVersion = prefs.getInt('sharedAppVersion') ?? 0;

    // loadInterstitialAd();
    super.onInit();
  }

  getValueAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    var valueStoreVersion = version.replaceAll('.', '');
    valueAppVersion = int.parse(valueStoreVersion);
  }

  functionLoaded() {
    isLoaded.toggle();
  }

  void pageChanged(int index) async {
    currentPageIndex.value = index;
    if(index== 0){
      if (connectionManagerController.connectionType.value &&
          sharedPrefGetChangePage() >= 3 &&
          !isPayAccount.value) {
        verifyQuantityChangePage();
      }
      if (!isPayAccount.value) {
        addQuantityChangePage();
      }
    }

    if (appSharedWhats.value == false && index == 0) {
      shareWhatsApp();
    }
  }

  void bottomTapped(int index) async {
    currentPageIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  Future<void> openMenuModal() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;

    Get.bottomSheet(
      FragmentModalBottomSheet(version: version),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }

  // launchURL(String path) async {
  //   if (path == Strings.lowercaseGoogleLens) {
  //     bool? isInstalled =
  //         await DeviceApps.isAppInstalled(Strings.lowercaseIdGoogleLens);
  //     if (isInstalled != false) {
  //       DeviceApps.openApp(Strings.lowercaseIdGoogleLens);
  //     } else {
  //       StoreRedirect.redirect(androidAppId: Strings.lowercaseIdGoogleLens);
  //     }
  //   } else {
  //     StoreRedirect.redirect(androidAppId: Strings.lowercaseIdApp);
  //   }
  // }

  redirectedAppPlaystore({int? index}) {
    if (index == null) {
      StoreRedirect.redirect(androidAppId: Strings.lowercaseIdApp);
    } else {
      var openLinkPlaystore = [
        Strings.lowercaseIdAppIMC,
        Strings.lowercaseIdAppPomodoro
      ];

      return StoreRedirect.redirect(androidAppId: openLinkPlaystore[index]);
    }
  }

  int sharedPrefGetQuantity() {
    quantity = prefs.getInt('quantityConversions') ?? 0;
    return quantity;
  }

  Future<bool> addQuantityConversions() {
    sharedPrefGetQuantity();
    var value = prefs.setInt('quantityConversions', quantity + 1);
    return value;
  }

  verifyQuantityConversions() {
    quantity = 0;
    prefs.setInt('quantityConversions', quantity);
    // showIntersitialAd();
  }


  int sharedPrefGetAdBottomSheet() {
    quantityBottomSheet = prefs.getInt('quantityBottomSheet') ?? 0;
    return quantityBottomSheet;
  }

  Future<bool> addQuantityAdBottomSheet() {
    sharedPrefGetAdBottomSheet();
    var value = prefs.setInt('quantityBottomSheet', quantityBottomSheet + 1);
    return value;
  }

  verifyQuantityAdBottomSheet() {
    quantityBottomSheet = 0;
    prefs.setInt('quantityBottomSheet', quantityBottomSheet);
    showIntersticialScreens();
  }


  int sharedPrefGetSugestions() {
    quantitySugestions = prefs.getInt('quantitySugestions') ?? 0;
    return quantitySugestions;
  }

  Future<bool> addQuantityAdSugestions() {
    sharedPrefGetSugestions();
    var value = prefs.setInt('quantitySugestions', quantitySugestions + 1);
    return value;
  }

  verifyQuantitySugestions() {
    quantitySugestions = 0;
    prefs.setInt('quantitySugestions', quantitySugestions);
    showIntersticialScreens();
  }

  int sharedPrefGetChangePage() {
    quantityChangePage = prefs.getInt('quantityChangePage') ?? 0;
    return quantityChangePage;
  }

  Future<bool> addQuantityChangePage() {
    sharedPrefGetChangePage();
    var value = prefs.setInt('quantityChangePage', quantityChangePage + 1);
    return value;
  }

  verifyQuantityChangePage() {
    quantityChangePage = 0;
    prefs.setInt('quantityChangePage', quantityChangePage);
    showIntersticialScreens();
  }

  int sharedPrefPremium() {
    quantityPremium = prefs.getInt('quantityPremium') ?? 0;
    return quantityPremium;
  }

  Future<bool> addQuantityPremium() {
    sharedPrefPremium();
    var value = prefs.setInt('quantityPremium', quantityPremium + 1);
    return value;
  }

  verifyQuantityPremium() {
    quantityPremium = 0;
    prefs.setInt('quantityPremium', quantityPremium);
    showIntersticialScreens();
  }

  // void loadInterstitialAd() {
  //   InterstitialAd.load(
  //     adUnitId: AdHelper.interstitialAdUnitId,
  //     request: const AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (ad) {
  //         ad.fullScreenContentCallback =
  //             FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
  //           ad.dispose();
  //         }, onAdFailedToShowFullScreenContent: (ad, error) {
  //           loadInterstitialAd();
  //           ad.dispose();
  //         }, onAdShowedFullScreenContent: (ad) {
  //           ad.dispose();
  //         });
  //         _interstitialAd = ad;
  //         loadInterstitialAd();
  //       },
  //       onAdFailedToLoad: (err) {
  //         _interstitialAd = null;
  //         loadInterstitialAd();
  //       },
  //     ),
  //   );
  // }
  //
  // void showIntersitialAd() async{
  //   await _interstitialAd?.show();
  // }

  openLink(String path) async {
    final Uri url = Uri.parse(path);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      createGetSnackbar(title: 'OPS!', subtitle: 'NÃO FOI POSSÍVEL CONECTAR');
    }
  }

  Future<void> share() async {
    await FlutterShare.share(
      title: 'App do Chaveiro',
      text: 'App do Chaveiro!',
      linkUrl: Strings.linkAccessApp,
    );
  }

  Future<dynamic> saveAndShare(
      {bool isSharedCatalog = false,
      String? itemDrop,
      String? itemNumber}) async {
    await screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then(
      (Uint8List? image) async {
        if (image != null) {
          Directory directory = await getApplicationDocumentsDirectory();
          File imagePath = await File('${directory.path}/image.png').create();
          await imagePath.writeAsBytes(image);

          /// Share Plugin
          await Share.shareXFiles([XFile(imagePath.path)],
              text: isSharedCatalog
                  ? 'Para ver mais acesse: ${Strings.linkAccessApp}'
                  : 'Resultado da Conversão\nMARCA: $itemDrop - $itemNumber\n\nPara mais conversões acesse: ${Strings.linkAccessApp}');
        }
      },
    );
  }

  Future pickImage() async {
    try {
      final XFile? image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);
      if (image == null) return;

      qrCodeExists.value = true;
      prefs.setBool('sharedQrCodeExists', true);

      prefs.setString('sharedImagePathPix', image.path);
    } on PlatformException catch (_) {
      createGetSnackbar(title: 'OPS!', subtitle: 'Erro com a imagem!');
    }
  }

  showIntersticialScreens(){
    if (!isPayAccount.value &&
        connectionManagerController.connectionType.value)  {
      // showIntersitialAd();
    }
  }

  Widget rowTwoTexts(String txt1, String txt2, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Text(txt1,
                style: AppStyles.title.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: isTabletVerify(context) == true ? 18 : 14,
                    fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
          ),
          Expanded(
            flex: 10,
            child: Text(
              txt2,
              style: TextStyle(
                  fontSize: isTabletVerify(context) == true ? 20 : 14),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

  createGetSnackbar({String? title, String? subtitle}) {
    Get.snackbar(title ?? '', '',
        messageText: Text(
          subtitle ?? '',
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.primaryColor,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP);
  }

  bool? isTabletVerify(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    isTablet = shortestSide > 600;
    return isTablet;
  }

  bool? isSmallScreenVerify(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    isSmallScreen = shortestSide <= 360;
    return isSmallScreen;
  }

  sendEmail({String? title, String? message}) async {
    final Email email = Email(
      body: message ?? '',
      subject: title ?? '',
      recipients: [Strings.emailPegassi],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }

  shareWhatsApp() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.defaultDialog(
          barrierDismissible: true,
          title: 'COMPARTILHE O APP',
          titleStyle: AppStyles.title.copyWith(
            color: AppColors.primaryColor,
          ),
          titlePadding: const EdgeInsets.only(top: 8),
          cancelTextColor: Colors.black87,
          cancel: EditButtonDefault(
            verticalSpaceText: isTablet ? 10 : 16,
            icon: Icons.phone_rounded,
            colorButton: Colors.green,
            textButton: 'COMPARTILHE O APLICATIVO',
            onClick: () {
              share();
              appSharedWhats.value = true;
              prefs.setBool('appSharedWhats', true);
            },
          ),
          content: Column(
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text:
                            "COMPARTILHE O APP COM SEUS AMIGOS\n\n"
                            "VOCÊ PODE FAZER ISSO MAIS TARDE NO MENU ",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: isTablet ? 18 : 12)),
                    WidgetSpan(
                      child: Icon(Icons.more_vert, size: isTablet ? 24 : 14),
                    ),
                  ],
                ),
              ),
              TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Get.back();
                    appSharedWhats.value = true;
                    prefs.setBool('appSharedWhats', true);
                    showIntersticialScreens();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(
                      'NÃO VISUALIZAR NOVAMENTE',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: isTablet ? 16 : 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )),
            ],
          ));
    });
  }

}
