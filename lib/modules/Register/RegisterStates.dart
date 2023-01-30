

import '../../models/UserModel.dart';

abstract class RegisterStates{}
class RegisterinitialState extends RegisterStates{}
class RegisterchangeIconState extends RegisterStates{}
class changeCountryIdState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}
class RegisterSucessState extends RegisterStates{
  final UserModel model;
  RegisterSucessState(this.model);
}
class RegisterErrorState extends RegisterStates{}
class CountrySucessState extends RegisterStates{}
class CountryErrorState extends RegisterStates{}