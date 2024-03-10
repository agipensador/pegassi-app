import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {

  final ManagerController controllerManager = Get.put(ManagerController());

  RxInt selectedRadio = RxInt(-1);
  String keyCategory = '';
  final TextEditingController adaptationBaseModel = TextEditingController();
  final TextEditingController adaptationModels = TextEditingController();
  final TextEditingController improvementText = TextEditingController();
  final TextEditingController dovaleKeySuggested = TextEditingController();
  final TextEditingController goldKeySuggested = TextEditingController();
  final TextEditingController izaKeySuggested = TextEditingController();
  final TextEditingController jasKeySuggested = TextEditingController();
  final TextEditingController jsaKeySuggested = TextEditingController();
  final TextEditingController landKeySuggested = TextEditingController();
  final TextEditingController rcaKeySuggested = TextEditingController();
  final TextEditingController silcaKeySuggested = TextEditingController();
  final TextEditingController toolsKeySuggested = TextEditingController();

  final feedbackContent = List<RxBool>.generate(4, (index) => (index == 0).obs);

  void setfeedbackContent(int index) {
    for (int i = 0; i < feedbackContent.length; i++) {
      feedbackContent[i].value = (i == index);
    }
  }

  void setSelectedRadio(int? value) {
    selectedRadio.value = value ?? 0;
  }

  // openAdaptationSuggestionsModal(String? keyModels, String? numberModels) {
  //   Get.bottomSheet(
  //     FragmentAdaptationSuggestionsModal(keyModels, numberModels),
  //     backgroundColor: Colors.transparent,
  //     isScrollControlled: true,
  //   );
  // }
}
