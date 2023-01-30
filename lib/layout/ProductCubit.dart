import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_company/Shared/Network/Remote/DioHelper.dart';
import 'package:task_company/Shared/Network/endPoints.dart';
import 'package:task_company/models/ProductModel.dart';
import 'package:task_company/models/ProductScreenModel.dart';
import 'ProductStates.dart';

class ProductCubit extends Cubit<ProductStates>{
  ProductCubit():super(InitialState());
  static ProductCubit get(context)=>BlocProvider.of(context);
  var  email;
  var  name;



  void GetDataUser(String em ,String na){
    email=em;
    name=na;
    emit(changeEmailState());
  }
  ProductModel? model;
  void GetHomeData(){
    emit(HomeLoadingState());
    DioHelper.postData(
        url:HOME,
        data: {
          'category_id':1
        }
    ).then((value){
      print('inside');
      model=ProductModel.fromJson(value.data);
     print(model!.message);
      emit(HomeSucessState());
    } ).catchError((error){
      emit(HomeErrorState());
      print('error home ${error}');
    });
  }
  ProductScreenModel? pmodel;
  void GetProductData(){
    emit(ProductLoadingState());
    DioHelper.postData(
        url:PRODUCT,
        data: {
          'product_id':9
        }
    ).then((value){
      pmodel=ProductScreenModel.fromJson(value.data);
      print(model!.message);
      emit(ProductSucessState());
    } ).catchError((error){
      emit(ProductErrorState());
      print('error product ${error}');
    });
  }
}