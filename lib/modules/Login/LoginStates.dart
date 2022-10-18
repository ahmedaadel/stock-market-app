
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

class LoginIsAsycCallSuccessState extends LoginStates {}

class AddUserToDataBaseSuccessState extends LoginStates {}

class AddUserToDataBaseErrorState extends LoginStates {}


class UserLoginLoadingState extends LoginStates {}


/////// old cubit states

class BottomNavBarState extends LoginStates {}

class SignOutSuccessState extends LoginStates {}

class SignOutErrorState extends LoginStates {}
