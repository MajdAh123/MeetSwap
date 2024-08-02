import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarChatingController extends GetxController
    with SingleGetTickerProviderMixin {
  RxBool showReply = false.obs;
  RxBool isMeReply = false.obs;
  RxString replyText = "".obs;
  var textDirection = TextDirection.ltr.obs;
  var messageTextEditing = TextEditingController().obs;
  var isRecording = false.obs;
  var isstartRecording = false.obs;
  var animationValue = 0.0.obs;
  var recordingDuration = Duration().obs;
  Timer? _timer;
  void startRecording() {
    isRecording.value = true;
    _startAnimation();
    _startTimer();
  }

  void stopRecording() {
    isRecording.value = false;
    _timer?.cancel();
    // recordingDuration.value = Duration.zero;
  }

  void _startAnimation() {
    Future.doWhile(() async {
      if (isRecording.value) {
        await Future.delayed(Duration(milliseconds: 16));
        animationValue.value += 0.2;
        return true;
      }
      return false;
    });
  }

  void deleteRecord() {
    isRecording.value = false;
    isstartRecording.value = false;
    recordingDuration.value = Duration.zero;
    Future.delayed(Duration(milliseconds: 15))
        .then((value) => animationValue.value = 0.00);
  }

  void _startTimer() {
    recordingDuration.value = Duration.zero;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      recordingDuration.value = Duration(seconds: timer.tick);
    });
  }

  @override
  void onInit() {
    super.onInit();
    messageTextEditing.value.addListener(_handleInputChange);
  }

  void _handleInputChange() {
    final text = messageTextEditing.value.text;
    if (text.isNotEmpty && _isArabic(text)) {
      textDirection.value = TextDirection.rtl;
    } else {
      textDirection.value = TextDirection.ltr;
    }
  }

  bool _isArabic(String text) {
    return RegExp(r'^[\u0600-\u06FF]').hasMatch(text);
  }

  @override
  void onClose() {
    messageTextEditing.value.removeListener(_handleInputChange);
    messageTextEditing.value.dispose();
    stopRecording();
    super.onClose();
  }
}
