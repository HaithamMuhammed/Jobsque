part of 'profile_cubit.dart';

class ProfileState {
  final String? profileImage;
  final String? profileName;

  ProfileState({
    this.profileImage,
    this.profileName,
  });

  ProfileState copyWith({
    String? profileImage,
    String? profileName,
  }) {
    return ProfileState(
      profileImage: profileImage ?? this.profileImage,
      profileName: profileName ?? this.profileName,
    );
  }
}
