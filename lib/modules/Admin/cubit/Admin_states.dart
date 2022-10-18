abstract class AdminStates {}

class AdminInitialState extends AdminStates {}

class AdminaddTawsyaLoadingState extends AdminStates {}

class AdminaddTawsyaSuccessState extends AdminStates {}

class AdminaddTawsyaErrorState extends AdminStates {}



class SignUPSuccessState extends AdminStates {
}

class SignUPErrorState extends AdminStates {
  final String error;
  SignUPErrorState(this.error);
}

class LoginIsAsycCallSuccessState extends AdminStates {}

class AddUserToDataBaseSuccessState extends AdminStates {}

class AddUserToDataBaseErrorState extends AdminStates {}


class UserLoginLoadingState extends AdminStates {}