import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_company/Shared/Component.dart';
import 'package:task_company/layout/ProductCubit.dart';
import 'package:task_company/layout/ProductStates.dart';

import '../layout/Product.dart';
import '../models/ProductScreenModel.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit,ProductStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit=ProductCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            leading: InkWell(onTap:(){navigatePush(context:context,widget: Product());},child: Icon(Icons.arrow_back_ios)),
            title: Text('Product',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),

          ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                Container(
                height: 140,
                width:double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),

                    ),
                    color: Colors.grey
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FancyShimmerImage(
                        boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        height: 140,
                        width:  110,
                        imageUrl: '${cubit.pmodel!.data!.image}'
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Name Product /',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,


                                    ),
                                  ),
                                  SizedBox(width: 3,),
                                  Expanded(
                                    flex: 1,
                                    child: Text('${cubit.pmodel!.data!.name} ',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,

                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Price / ',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,)),
                                Text('${cubit.pmodel!.data!.price} EGP',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,


                                  ),
                                ),
                              ],
                            ),
                          ),



                        ],
                      ),
                    ),





                  ],
                ),
              ),
                    SizedBox(height: 10,),
                  Text('More Image .. '),
                  SizedBox(height: 10,),

                  Container(
                    color:Colors.grey[300] ,
                    child: GridView.count(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      mainAxisSpacing: 1,
                      crossAxisSpacing: 1,
                      childAspectRatio: 1/1.74,
                      children: List.generate(cubit.pmodel!.data!.moreImage!.length, (index) =>
                          GridViewItem(cubit.pmodel!.data!.moreImage![index])
                      ),

                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }
  Widget GridViewItem(MoreImage model){
    return Card(
      elevation: 15,
      child:FancyShimmerImage(
          boxDecoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          height: 140,
          width:  110,
          imageUrl: '${model.image}'
      ),

    );
  }
}
