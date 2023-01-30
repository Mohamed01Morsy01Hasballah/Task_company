import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_company/Shared/Component.dart';
import 'package:task_company/layout/ProductCubit.dart';
import 'package:task_company/layout/ProductStates.dart';
import 'package:task_company/models/ProductModel.dart';
import 'package:task_company/modules/Login/LoginScreen.dart';

import '../modules/ProductScreen.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ProductCubit.get(context);
        return  Scaffold(
          appBar: AppBar(

            title: Text('Home',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),

            ),
            centerTitle: true,
          ),
          drawer: Drawer(

            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                        color:Colors.black54
                    ),
                    accountName: Text(
                      '${cubit.name}',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                    accountEmail: Text(
                      '${cubit.email}',
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),

                  ),
                  ListTile(
                  leading:Icon(Icons.logout),
                  title: InkWell(
                    onTap: (){
                      navigateFininsh(context: context,Widget: LoginScreen());
                    },
                      child: Text('LOGOUT'))
                ),
                  ListTile(
                    leading:Icon(Icons.category),
                    title: InkWell(
                        onTap: (){
                          navigateFininsh(context: context,Widget: ProductScreen());
                        },
                        child: Text('Product '))
                ),













              ],
            ),
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
