class ProfileScreenState {
  bool isNameReadOnly;
  bool isWidgetVisible;
  bool loading;
  String name;
  String dateOfBirth;
  ProfileScreenState(
      {required this.isNameReadOnly,
      required this.isWidgetVisible,
      required this.name,
      required this.dateOfBirth,
      required this.loading});

  ProfileScreenState copyWith(
          {bool? isReadOnly,
          bool? isVisible,
          String? usrname,
          String? birthdate, bool? isLoading}) =>
      ProfileScreenState(
        isNameReadOnly: isReadOnly ?? this.isNameReadOnly,
        loading: isLoading ?? this.loading,
        isWidgetVisible: isVisible ?? this.isWidgetVisible,
        name: usrname ?? this.name,
        dateOfBirth: birthdate ?? this.dateOfBirth,
      );
}
