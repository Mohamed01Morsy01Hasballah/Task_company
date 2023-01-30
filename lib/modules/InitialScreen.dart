import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_company/Shared/Component.dart';
import 'package:task_company/layout/ProductCubit.dart';
import 'package:task_company/layout/ProductStates.dart';
import 'package:task_company/models/ProductModel.dart';
import 'package:task_company/modules/Register/RegisterScreen.dart';

import 'Login/LoginScreen.dart';

class InitialScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ProductCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        navigateFininsh(context: context,Widget: RegisterScreen());
                      },
                      child: Text('Register / ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
                    ),
                    InkWell(
                      onTap: (){
                        navigateFininsh(context: context,Widget: LoginScreen());

                      },
                      child: Text('Login ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.deepOrange)),
                    ),
                  ],
                ),
              )

            ],
          ),


          body: ConditionalBuilder(
            condition:  cubit.model !=null,
            builder: (context)=>Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context,index)=>ProductItem(cubit.model!.data!.product![index]),
                        separatorBuilder: (context,index)=>Container(color: Colors.white,width: double.infinity,height: 8,),
                        itemCount: cubit.model!.data!.product!.length),
                  ),
                ],
              ),
            ),
            fallback: (context)=>Center(child:CircularProgressIndicator()
            ),
          ),
        );
      },

    );
  }
}
