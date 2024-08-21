import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_state.dart';

class OtpCubit extends Cubit<int> {
  late Timer timer;
  static int initialSeconds = 42;
  OtpCubit() : super(initialSeconds);

  void startTimer() {
    int seconds = state;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        emit(seconds);
      } else {
        timer.cancel();
      }
    });
  }

  void resetTimer() {
    timer.cancel();
    emit(initialSeconds);
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }
}
