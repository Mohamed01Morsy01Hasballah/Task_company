import 'package:dio/dio.dart';

class DioHelper{
  static  Dio? dio;
  static init(){
    dio=Dio(
        BaseOptions(
          baseUrl: 'https://digitalvision-eg.com/sto0re03/api',
          receiveDataWhenStatusError: true,
        )
    );
  }
  static Future<Response>  getData({
    required String url,
    Map<String,dynamic>? query,

  })async{

    return await   dio!.get(
        url,
        queryParameters: query
    );
  }
  static  Future<Response>  postData(
      {
        required String url,
        Map<String ,dynamic >? query,
        required Map<String,dynamic>? data,


      }
      )async{
    return await  dio!.post(
        url,
        data: data,
        queryParameters: query
    );

  }

  static  Future<Response>  PutData(
      {
        required String url,
        required Map<String ,dynamic > data,
        Map<String,dynamic>? query,
        String? lang='en',
        String? token,

      }
      )async{
    dio!.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'',


    };
    return await  dio!.put(
        url,
        data: data,
        queryParameters: query
    );

  }
}