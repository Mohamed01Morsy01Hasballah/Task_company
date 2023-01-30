import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_company/Shared/Network/Remote/DioHelper.dart';
import 'package:task_company/layout/ProductCubit.dart';
import 'package:task_company/modules/InitialScreen.dart';
import 'package:task_company/modules/Login/LoginCubit.dart';
import 'package:task_company/modules/Login/LoginScreen.dart';
import 'package:task_company/modules/Register/RegisterCubit.dart';
import 'package:task_company/modules/Register/RegisterScreen.dart';

import 'layout/Product.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();


  await DioHelper.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(
            create: (context)=>LoginCubit()
        ),
        BlocProvider(
            create: (context)=>RegisterCubit()
        ),
        BlocProvider(
            create: (context)=>ProductCubit()..GetHomeData()..GetProductData()
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: Colors.white,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                ),

                iconTheme:IconThemeData(
                    color: Colors.black
                ) ,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarBrightness: Brightness.light
                )
            ),

        ),
       home:InitialScreen(),
      ),
    );
  }
}


