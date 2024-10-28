class ProfileScreenState {
  bool isNameReadOnly;
  bool isWidgetVisible;
  ProfileScreenState({required this.isNameReadOnly, required this.isWidgetVisible});

  ProfileScreenState copyWith({bool? isReadOnly, bool? isVisible}) => ProfileScreenState(
        isNameReadOnly: isReadOnly ?? this.isNameReadOnly,
        isWidgetVisible: isVisible ?? this.isWidgetVisible,

      );
}
