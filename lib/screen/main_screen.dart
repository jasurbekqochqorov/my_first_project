import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool t=false;
  // @override
  // void initState() {
  //   _init();
  //   super.initState();
  // }
  //
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
        child: Column(
          children: [
            Image.asset(AppImages.top,width: 218.w,height: 225.h,fit: BoxFit.cover,),
            SizedBox(height: 16.h,),
            Text('LOGIN',style:AppTextStyle.interSemiBold.copyWith(
              color: AppColors.black,fontSize:22.w
            ),),
            SizedBox(height: 16.h,),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    spreadRadius:0.9,
                    blurRadius: 0,
                    offset:const Offset(0,3)
                  )
                ]
              ),
              margin: EdgeInsets.symmetric(horizontal:34.w),
              child: TextField(
                onChanged: context.read<LoginViewModel>().updateEmail,
                decoration:InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal:15.w,vertical:14.h),
                  prefixIcon:IconButton(onPressed:(){},icon: SvgPicture.asset(AppImages.email,width:26.w,height: 26.h,),),
                  hintStyle: AppTextStyle.interSemiBold,
                  hintText: "Email",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
            ),
            SizedBox(height: 9.h,),
            Container(
              margin: EdgeInsets.symmetric(horizontal:34.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius:0.9,
                      blurRadius: 0,
                      offset:const Offset(0,3)
                  )
                ]
              ),
              child: TextField(
                onChanged: context.read<LoginViewModel>().updatePassword,
                decoration:InputDecoration(
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: EdgeInsets.symmetric(horizontal:15.w,vertical:14.h),
                  prefixIcon:IconButton(onPressed:(){},icon: SvgPicture.asset(AppImages.password,width:26.w,height: 26.h,),),
                  hintStyle: AppTextStyle.interSemiBold,
                  suffixIcon: IconButton(onPressed: (){
                    t=!t;
                    setState(() {});
                  },icon: (t)?const Icon(Icons.visibility):const Icon(Icons.visibility_off),),
                  hintText: "Password",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(9),
                  ),
                ),
              ),
            ),
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
            const Text('OR'),
            SizedBox(height: 6.h,),
            const Text('Login with'),
            SizedBox(height: 19.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 44.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Image.asset(AppImages.google,width: 23.w,height: 23.h,fit: BoxFit.cover,),
                Image.asset(AppImages.apple,width: 23.w,height: 23.h,fit: BoxFit.cover),
                Image.asset(AppImages.faceBook,width: 23.w,height: 23.h,fit: BoxFit.cover),
              ],),
            ),
            SizedBox(height: 19.h,),
            RichText(text:TextSpan(
              text:'Don’t have an account? ',
              style: AppTextStyle.interRegular.copyWith(
                color: AppColors.black,fontSize: 11.w
              ),
              children: [
                TextSpan(
                  text: ' Register now',
                  style: AppTextStyle.interRegular.copyWith(
                      color: Colors.blue,fontSize: 11.w
                  ),
                )
              ]
            ))
          ],
        ),
      ),
    );
  }
}
