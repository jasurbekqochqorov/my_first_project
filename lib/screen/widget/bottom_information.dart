import 'package:flutter/material.dart';
import 'package:my_first_project/utils/size/size_utils.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';

class InformationWidget extends StatefulWidget {
  const InformationWidget({super.key});

  @override
  State<InformationWidget> createState() => _InformationWidgetState();
}

class _InformationWidgetState extends State<InformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
    ],);
  }
}
