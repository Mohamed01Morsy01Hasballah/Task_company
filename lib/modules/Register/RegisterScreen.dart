
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Component.dart';
import '../../layout/Product.dart';
import '../../layout/ProductCubit.dart';
import 'RegisterCubit.dart';
import 'RegisterStates.dart';
class RegisterScreen extends StatelessWidget {
  var name=TextEditingController();

  var email=TextEditingController();
  var pass=TextEditingController();
  var phone=TextEditingController();
  var confirm=TextEditingController();

  var formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit,RegisterStates>(
      listener: (context,state) {
        var cubit=ProductCubit.get(context);
      if(state is RegisterSucessState) {
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
        var cubit=RegisterCubit.get(context);
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
                          'Register',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        BuiltTextField(
                            type: TextInputType.text,
                            controller: name,
                            label: 'name',
                            prefix: Icons.person,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return 'Please Enter name';
                              }
                              return null;

                            }
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
                            type: TextInputType.phone,
                            controller: phone,
                            label: 'Phone',
                            prefix: Icons.phone,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return 'Please Enter phone ';
                              }
                              return null;

                            }
                        ),
                        SizedBox(height: 20,),

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
                                return 'Please Enter Password';
                              }
                              return null;

                            }
                        ),

                        SizedBox(height: 20,),
                        BuiltTextField(
                            type: TextInputType.visiblePassword,
                            controller: confirm,
                            secure: cubit.secure,
                            label: 'Confirm password',
                            prefix: Icons.lock,
                            validate: (String? value){
                              if(value!.isEmpty){
                                return 'Please Enter Password';
                              }
                              return null;

                            }
                        ),

                        SizedBox(height: 20,),


                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context)=> BuiltButton(
                              height: 50,
                              color:Colors.deepOrange,
                              text: 'Register',
                              function: (){
                                if(formkey.currentState!.validate()) {
                                  cubit.RegisterData(
                                    name: name.text,
                                      email: email.text,
                                      password: pass.text,
                                      phone: phone.text,
                                    confirmPass: confirm.text
                                  );
                                }

                              }
                          ),
                          fallback: (context)=>Center(child: CircularProgressIndicator())
                      )


                      ],
                    ),
                  ),
                ),
              ),
            )
        );
      },

    );
  }
}
