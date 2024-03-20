import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_first_project/screen/widget/bottom_information.dart';
import 'package:my_first_project/screen/widget/test_field_widget.dart';
import 'package:my_first_project/utils/colors/app_colors.dart';
import 'package:my_first_project/utils/images/app_images.dart';
import 'package:my_first_project/utils/size/size_utils.dart';
import 'package:my_first_project/utils/styles/app_text_style.dart';
import 'package:provider/provider.dart';

import '../view_model/login_view_model.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  bool k=false;
  final _formKey = GlobalKey<FormState>();
  // @override
  // void initState() {
  //   _init();
  //   super.initState();
  // }
  // Future<void> _init() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   Future.microtask(() {
  //     if (user != null) {
  //       Navigator.push(context, MaterialPageRoute(builder: (context) {
  //         return const HomeScreen();
  //       }));
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(AppImages.top,width: 218.w,height: 225.h,fit: BoxFit.cover,),
              SizedBox(height: 16.h,),
              Text('LOGIN',style:AppTextStyle.interSemiBold.copyWith(
                color: AppColors.black,fontSize:22.w
              ),),
              SizedBox(height: 16.h,),
              const TextFormFieldWidget(icon: AppImages.email,text: 'Email',),
              SizedBox(height: 9.h,),
              const TextFormFieldWidget(icon: AppImages.password,text: "Password",i: true,),
              SizedBox(height: 13.h,),
              Padding(padding: EdgeInsets.symmetric(horizontal: 40.w),child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Switch(value:k, onChanged:(v){
                    k=!k;
                    setState(() {});
                  }),
                  Text('Remember me',style: AppTextStyle.interRegular.copyWith(
                    fontSize: 11.w
                  ),),
                  Text('Forget Password',style: AppTextStyle.interRegular.copyWith(
                      fontSize: 11.w),)
                ],)),
              SizedBox(height: 25.h,),
              TextButton(onPressed:(){
                context.read<LoginViewModel>().login(context);
              }, style: TextButton.styleFrom(
                    backgroundColor:const Color(0xFF1317DD),
                    padding: EdgeInsets.symmetric(vertical: 16.h,horizontal: 80.w)
                  ),
                  child:Text('LOGIN',style: AppTextStyle.interSemiBold.copyWith(
                    color:AppColors.white,fontSize: 13.w
                  ),)),
              SizedBox(height: 13.h,),
              const InformationWidget()
            ],
          ),
        ),
      ),
    );
  }
}
