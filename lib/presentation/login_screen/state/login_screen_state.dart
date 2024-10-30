class LoginScreenState {
  bool isObscure;
  bool loading;
  LoginScreenState({required this.isObscure, required this.loading});

  LoginScreenState copyWith({bool? isHidden, bool? isLoading}) =>
      LoginScreenState(
        isObscure: isHidden ?? this.isObscure,
        loading: isLoading ?? this.loading,
      );
}
