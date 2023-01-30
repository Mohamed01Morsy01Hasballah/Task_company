
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Network/Remote/DioHelper.dart';
import '../../Shared/Network/endPoints.dart';
import '../../models/UserModel.dart';
import 'RegisterStates.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterinitialState());
  static RegisterCubit get(context)=>BlocProvider.of(context);
  bool secure=true;
  String? countryId;
 void ChangeCountryId(Id){
   countryId=Id;
   emit(changeCountryIdState());
 }

  void changeIcon(){
    secure=!secure;
    emit(RegisterchangeIconState());
  }
  UserModel? register;
  void RegisterData(
      {
        required String name,

        required String email,
        required String password,
        required String phone,
        required String confirmPass,

      }
      ){
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,

        data:
        {
          'name':name,
          'email':email,
          'password':password,
          'mobile':phone,
          'password_confirmation':confirmPass,

        }
    ).then((value) {

      register=UserModel.fromJson(value.data);
      print(register!.message);
      emit(RegisterSucessState(register!));
    }).catchError((error){
      print('error register ${error.toString()}');
      emit(RegisterErrorState());
    });//ahmed@hotmal.com
  }

}


