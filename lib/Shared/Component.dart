import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/ProductModel.dart';

Widget BuiltTextField(
    {
      required String label,
      required TextInputType  type,
      required TextEditingController controller,
      required IconData prefix,
      IconData? suffix,
      validate,
      bool secure=false,
      suffixPressed,
      Function? onsubmit,

    }
    )=> TextFormField(
    keyboardType: type,
    controller:controller ,
    obscureText: secure,
    onFieldSubmitted:(s){
      onsubmit!(s);
    } ,
    decoration: InputDecoration(
        labelText:label,

        prefixIcon: Icon(
            prefix
        ),
        suffixIcon: TextButton(
          onPressed:suffixPressed ,
          child: Icon(
              suffix
          ),
        ),
        border:OutlineInputBorder()
    ),
    validator: validate
);
Widget BuiltButton(
    {
      required double height,
      required Color color,
      required String text,
      required  Function function,
    }
    )=>
    Container(
      width: double.infinity,
      height: height,
      color: color,
      child: MaterialButton(
        onPressed:(){
          function();
        },
        child: Text(text.toUpperCase()),

      ),
    );
void navigatePush({
  required Widget widget,
  context
})=>Navigator.push(context, MaterialPageRoute(builder: (context)=>widget));
void navigateFininsh({
  Widget ,
  context
})=>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context)=>Widget)
        ,(route) => false
    );
void ShowToast(
    {
      required String text,
      required ToastState state
    }
    )
{
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: ChooseColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}
enum ToastState{Success,Error,Warning}
Color? ChooseColor(ToastState state){
  Color? color;
  switch(state){
    case ToastState.Success:
      color=Colors.orange;
      break;
    case ToastState.Error:
      color=Colors.red;
      break;
    case ToastState.Warning:
      color=Colors.yellow;
  }

}
Widget ProductItem(Products model){
  return  Container(
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
            imageUrl: '${model.image}'
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
                        child: Text('${model.name} ',
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
                    Text('${model.price} EGP',
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
  );
}

