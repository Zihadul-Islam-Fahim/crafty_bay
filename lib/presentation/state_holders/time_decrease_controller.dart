import 'dart:async';
import 'package:get/get.dart';

class TimeDecreaseController extends GetxController {
  int currentSeconds = 120;
  bool timeOver = false;
  Timer? timer;

  decreaseSeconds(int secondsToDecrease) async {
    if (currentSeconds > 0) {
      timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) {
          currentSeconds--;
          update();
          if (currentSeconds == 0) {
            timer.cancel();
            timeOver = true;
            update();
          }
        },
      );
    }
  }
}
