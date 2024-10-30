class RegistrationScreenState {
  bool loading;
  bool passwordObscure;
  bool confirmPasswordObscure;
  RegistrationScreenState(
      {required this.passwordObscure,
      required this.confirmPasswordObscure,
      required this.loading});

  RegistrationScreenState copyWith(
          {bool? passHidden, bool? confirmPassHidden, bool? isLoading}) =>
      RegistrationScreenState(
        passwordObscure: passHidden ?? this.passwordObscure,
        confirmPasswordObscure:
            confirmPassHidden ?? this.confirmPasswordObscure,
        loading: isLoading ?? this.loading,
      );
}
