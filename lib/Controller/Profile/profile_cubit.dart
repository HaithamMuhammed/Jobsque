import 'package:bloc/bloc.dart';
import 'package:jobsque_flutter/Model/Services/ProfileApiServices.dart';
import 'package:jobsque_flutter/shared_Preferences/sharedPreferencesHelper.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final Cache cache;

  ProfileCubit(this.cache) : super(ProfileState()) {
    _loadProfileData();
  }
  Future<void> _loadProfileData() async {
    await cache.cacheInitialization();
    final name = cache.getString('userName');
    final imagePath = cache.getString('profileImage');
    emit(state.copyWith(
      profileName: name,
      profileImage: imagePath,
    ));
  }

  void updateProfileImage(String imagePath) async {
    // Save the image path to shared preferences
    await cache.setString('profileImage', imagePath);
    emit(state.copyWith(profileImage: imagePath));
  }

  void updateProfileName(String name) async {
    // Save the user's name to shared preferences
    await cache.setString('userName', name);
    emit(state.copyWith(profileName: name));
  }
}
