
abstract class LoginStates {}

class InitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
}

class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

class LoginVisabilityState extends LoginStates {}


class SignUPSuccessState extends LoginStates {
}

class SignUPErrorState extends LoginStates {
  final String error;
  SignUPErrorState(this.error);
}

class LoginIsAsycCallSuccessState extends LoginStates {
}

