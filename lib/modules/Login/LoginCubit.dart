import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Network/Remote/DioHelper.dart';
import '../../Shared/Network/endPoints.dart';
import '../../models/UserModel.dart';
import 'LoginState.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(initialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  bool secure=true;
  void changeIcon(){
    secure=!secure;
    emit(changeIconState());
  }
  UserModel? login;
  void LoginData(
  {

   required String email,
    required String password
}
      ){
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,

        data:
        {
          'mobile':email,

          'password':password,

        }
    ).then((value) {

   login=UserModel.fromJson(value.data);
   print(login!.message);
   emit(LoginSucessState(login!));
    }).catchError((error){
          print('error ${error.toString()}');
          emit(LoginErrorState());
    });
  }
}


