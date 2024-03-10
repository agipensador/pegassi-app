import 'package:app_pgss/resources/app_colors.dart';
import 'package:app_pgss/viewmodels/feedback_controller.dart';
import 'package:app_pgss/viewmodels/manager_controller.dart';
import 'package:app_pgss/views/parts/part_feedback_adaptation_suggestions.dart';
import 'package:app_pgss/views/parts/part_feedback_conversion_suggestions.dart';
import 'package:app_pgss/views/parts/part_feedback_initiation.dart';
import 'package:app_pgss/views/parts/part_feedback_suggestions_improvements.dart';
import 'package:app_pgss/views/screens/fragments/fragment_card_transfer_offline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenFeedback extends GetView {
  ScreenFeedback({Key? key}) : super(key: key);

  final ManagerController controllerManager = Get.put(ManagerController());
  final FeedbackController feedbackController = Get.put(FeedbackController());

  @override
  Widget build(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    return WillPopScope(
      onWillPop: () async {
        if (!feedbackController.feedbackContent[0].value) {
          feedbackController.adaptationBaseModel.clear();
          feedbackController.adaptationModels.clear();
          feedbackController.setfeedbackContent(0);
          return false;
        } else {
          feedbackController.adaptationBaseModel.clear();
          feedbackController.adaptationModels.clear();
          return true;
        }
      },
      child: SafeArea(
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
                bottomNavigationBar:
                    !feedbackController.controllerManager.isPayAccount.value
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
                body: Obx(() {
                  if (feedbackController.feedbackContent[0].value) {
                    return PartFeedbackInitiation();
                  } else if (feedbackController.feedbackContent[1].value) {
                    return PartFeedbackAdaptationSuggestions();
                  } else if (feedbackController.feedbackContent[2].value) {
                    return PartFeedbackConversionSuggestions();
                  } else if (feedbackController.feedbackContent[3].value) {
                    return PartFeedbackSuggestionsImprovements();
                  }
                  return PartFeedbackInitiation();
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
