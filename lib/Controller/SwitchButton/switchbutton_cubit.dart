import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'switchbutton_state.dart';

class SwitchbuttonCubit extends Cubit<Map<String, bool>> {
  SwitchbuttonCubit()
      : super({
          "jobSearchAlert": false,
          "jobApplicationUpdate": false,
          "jobApplicationReminders": false,
          "jobYouMayBeInterestedIn": false,
          "jobSeekerUpdates": false,
          "showProfile": false,
          "allMessage": false,
          "messageNudges": false,
        });
  void toggleSwitch(String key) {
    emit({...state, key: !state[key]!});
  }
}
