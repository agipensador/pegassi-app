import 'dart:async';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ConnectionManagerController extends GetxController {
  final InternetConnectionChecker _connectivity = InternetConnectionChecker()
    ..isHostReachable(
      AddressCheckOptions(
        hostname:
            'https://www.google.com.br',
      ),
    );

  late StreamSubscription _streamSubscription;
  RxBool connectionType = false.obs;

  @override
  void onInit() {
    super.onInit();
    _streamSubscription = _connectivity.onStatusChange.listen(_updateState);
  }

  _updateState(InternetConnectionStatus result) async {
    switch (result) {
      case InternetConnectionStatus.connected:
        connectionType.value = true;
        break;
      case InternetConnectionStatus.disconnected:
        connectionType.value = false;
        break;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
