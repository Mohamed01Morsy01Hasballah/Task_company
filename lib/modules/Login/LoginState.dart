
import '../../models/UserModel.dart';

abstract class LoginStates{}
class initialState extends LoginStates{}
class changeIconState extends LoginStates{}
class LoginLoadingState extends LoginStates{}
class LoginSucessState extends LoginStates{
 final UserModel model;
  LoginSucessState(this.model);
}
class LoginErrorState extends LoginStates{}