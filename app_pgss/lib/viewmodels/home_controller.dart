import 'dart:convert';
import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/resources/strings.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:store_redirect/store_redirect.dart';

class HomeController extends GetxController {
  TextEditingController textNumberEditController = TextEditingController();
  TextEditingController textNumberCatalogEditController =
      TextEditingController();
  final ManagerController controllerManager = Get.put(ManagerController());
  final scrollController = ScrollController();

  RxBool colorValidatorDropdown = false.obs;
  int countToVerifyModelSelected = 0;
  int countVerifyText = 0;
  RxBool visibilityCards = false.obs;
  String? itemSelectDrop;
  var itemsJson = [].obs;
  Rx<Color> colorHintTextFormField = Colors.grey.obs;
  Rx<Color> colorBorderTextFormField = Colors.black.obs;
  bool isExpandedDropBox = false;
  RxBool updatePreviewChecker = true.obs;
  RxBool isCatalog = false.obs;

  int? process(int val) => val > 0 ? val * 100 : null;

  // RxList<KeyModel> listKeys = <KeyModel>[].obs;
  // RxList<KeyModel> listKeysForDisplay = <KeyModel>[].obs;

  @override
  void onInit() async {
    // fetchNotes().then((value) {
    //   listKeys.addAll(value);
    //   listKeysForDisplay = listKeys;
    // });

    super.onInit();
  }

  // clearText() {
  //   listKeysForDisplay = listKeys;
  //   textNumberCatalogEditController.clear();
  //   update(['catalog']);
  // }

  // searchCatalog(String query) {
  //   listKeysForDisplay = listKeys
  //       .where((note) {
  //         var noteTitleGold = note.gold.toString().contains(query);
  //         var noteTitleDovale = note.dovale.toString().contains(query);
  //         var noteTitleJas = note.jas.toString().contains(query);
  //         var noteTitleLand = note.land.toString().contains(query);
  //         var noteTitleSilca = note.silca.toString().contains(query);
  //         var noteTitleTools = note.tools.toString().contains(query);
  //         var noteTitleRca = note.rca.toString().contains(query);
  //         var noteTitleJsa = note.jsa.toString().contains(query);
  //         var noteTitleIza = note.iza.toString().contains(query);
  //         return noteTitleGold ||
  //             noteTitleDovale ||
  //             noteTitleJas ||
  //             noteTitleSilca ||
  //             noteTitleLand ||
  //             noteTitleTools ||
  //             noteTitleRca ||
  //             noteTitleJsa ||
  //             noteTitleIza;
  //       })
  //       .toList()
  //       .obs;
  //   update(['catalog']);
  // }

  // Future<List<KeyModel>> fetchNotes() async {
  //   String? response = await rootBundle.loadString("assets/sample.json");
  //   Map data = await json.decode(response)['items'][0]['gold'];
  //
  //   var notes = <KeyModel>[].obs;
  //   for (var noteJson in data.values.toList()) {
  //     notes.add(KeyModel.fromJson(noteJson));
  //   }
  //   return notes;
  // }

  Future<void> redJson() async {
    String? response = await rootBundle.loadString("assets/sample.json");
    final data = await json.decode(response);

    itemsJson.value = data["items"];
  }

  checkUpdate() async {
    final newVersion = NewVersionPlus(androidId: Strings.lowercaseIdApp);
    try {
      final status = await newVersion.getVersionStatus();
      if (status!.canUpdate) {
        infoAlert(status, isUpdateVersion: true);
      }
    } catch (_) {
      controllerManager.connectionManagerController.connectionType.value =
          false;
    }
  }

  void infoAlert(status, {bool isUpdateVersion = false}) {
    Get.defaultDialog(
      title: isUpdateVersion ? 'ATUALIZAR' : 'ADAPTAÇÕES',
      middleText: isUpdateVersion
          ? 'Sua versão é a ${status.localVersion}.'
              '\nNós já atualizamos para a versão ${status.storeVersion}.'
              '\n\nClique em ATUALIZAR e direcionaremos você para PlayStore, '
              'para que possa atualizar seu aplicativo.'
          : ' Adaptações são outros modelos de chaves com o frizo semelhante ao pesquisado, '
              'podendo assim utilizar o modelo da adaptação no lugar do modelo desejado. '
              'Pesquisamos entre diversos chaveiros quais adaptações eles utilizam no seu '
              'cotidiano. Aceitamos sugestões de adaptação, para isto entre em contato '
              'através da Playstore.\n\n'
              'OBSERVAÇÕES:\n'
              '-Utilizamos o número dos modelos GOLD como padrão de adaptações.\n'
              '-O aplicativo não se responsabiliza por adaptações incorretas, apenas '
              'dispõem destas informações para ajudar os chaveiros.\n\n'
              '*É necessário fazer mais cortes na chave, além do corte da máquina.',
      cancel: isUpdateVersion
          ? TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: const Text(
                'MAIS TARDE',
                style: TextStyle(
                    color: AppColors.backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              onPressed: () {
                Get.back();
              },
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'OK',
                    style: TextStyle(
                        color: AppColors.backgroundColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
      confirm: isUpdateVersion
          ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'ATUALIZAR',
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  onPressed: redirectedAppPlaystore),
            )
          : const SizedBox.shrink(),
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: AppColors.primaryColor),
      middleTextStyle: const TextStyle(color: Colors.black),
      radius: 5,
    );
  }

  redirectedAppPlaystore() async {
    StoreRedirect.redirect(androidAppId: Strings.lowercaseIdApp);
  }

}
