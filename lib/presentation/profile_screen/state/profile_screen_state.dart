class ProfileScreenState {
  bool loading;
  String name;
  String dateOfBirth;
  ProfileScreenState(
      {
      required this.name,
      required this.dateOfBirth,
      required this.loading});

  ProfileScreenState copyWith(
          {bool? isReadOnly,
          bool? isVisible,
          String? usrname,
          String? birthdate, bool? isLoading}) =>
      ProfileScreenState(
        loading: isLoading ?? this.loading,
        name: usrname ?? this.name,
        dateOfBirth: birthdate ?? this.dateOfBirth,
      );
}
