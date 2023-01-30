
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_company/layout/ProductCubit.dart';

import '../../Shared/Component.dart';
import '../../Shared/Network/endPoints.dart';
import '../../layout/Product.dart';
import '../Register/RegisterScreen.dart';
import 'LoginCubit.dart';
import 'LoginState.dart';

class LoginScreen extends StatelessWidget {

  var email=TextEditingController();
  var pass=TextEditingController();
  var formkey=GlobalKey<FormState>();
   String? text;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit,LoginStates>(
      listener: (context,state){
        var cubit=ProductCubit.get(context);
        if(state is LoginSucessState) {
          if (state.model.success!) {
            cubit.GetDataUser(state.model.data!.email.toString(), state.model.data!.name.toString());
            navigateFininsh(context: context, Widget: Product());
          } else {
            ShowToast(
                text: state.model.message.toString(), state: ToastState.Error
            );
          }
        }

      },
      builder: (context,state){
        var cubit=LoginCubit.get(context);
        return Scaffold(

          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      BuiltTextField(
                          type: TextInputType.emailAddress,
                          controller: email,
                          label: 'Email Address',
                          prefix: Icons.email,
                          validate: (String? value){
                            if(value!.isEmpty){
                              return 'Please Enter Email Address';
                            }
                            return null;

                          }
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      BuiltTextField(
                          type: TextInputType.visiblePassword,
                          controller: pass,
                          secure: cubit.secure,
                          label: 'password',
                          prefix: Icons.lock,
                          suffix: cubit.secure?Icons.visibility_off:Icons.visibility,
                          suffixPressed: (){
                            cubit.changeIcon();
                          },
                          validate: (String? value){
                            if(value!.isEmpty){
                              return 'Please Enter Email Address';
                            }
                            return null;

                          }
                      ),
                      SizedBox(
                        height: 20,
                      ),
                     ConditionalBuilder(
                         condition: state is! LoginLoadingState,
                         builder: (context)=> BuiltButton(
                             height: 50,
                             color:Colors.deepOrange,
                             text: 'Sign',
                             function: (){

                               if(formkey.currentState!.validate()){
                                 cubit.LoginData(email: email.text, password: pass.text);

                               }

                             }
                         ),
                         fallback: (context)=>Center(child: CircularProgressIndicator())
                     ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'dont\'t have Acount ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                            ),

                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TextButton(
                              onPressed: (){
                                navigatePush(context: context,widget: RegisterScreen());
                              },
                              child: Text(
                                'Register ',
                                style: TextStyle
                                  (
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrangeAccent
                                ),
                              ))
                        ],
                      ),




                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );
  }
}
