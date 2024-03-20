import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_first_project/utils/size/size_utils.dart';
import 'package:provider/provider.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';
import '../../view_model/login_view_model.dart';

class TextFormFieldWidget extends StatefulWidget {
  const TextFormFieldWidget({super.key, required this.icon, required this.text, this.i=false});
  final String icon;
  final String text;
  final bool? i;
  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  bool t=false;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: TextFormField(
        style: AppTextStyle.interMedium.copyWith(
          color: AppColors.black,fontSize: 16.w),
        onChanged: context.read<LoginViewModel>().updateEmail,
        decoration:InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal:15.w,vertical:14.h),
          prefixIcon:IconButton(onPressed:(){},icon: SvgPicture.asset(widget.icon,width:26.w,height: 26.h,),),
          hintStyle: AppTextStyle.interSemiBold,
          hintText:widget.text,
          suffixIcon: (widget.i!)?IconButton(onPressed: (){t=!t;setState(() {});},icon: (t)?const Icon(Icons.visibility):const Icon(Icons.visibility_off),):null,
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
    );
  }
}
//Container(
//               margin: EdgeInsets.symmetric(horizontal:34.w),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(9),
//                 color: AppColors.white,
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(0.25),
//                       spreadRadius:0.9,
//                       blurRadius: 0,
//                       offset:const Offset(0,3)
//                   )
//                 ]
//               ),
//               child: TextField(
//                 onChanged: context.read<LoginViewModel>().updatePassword,
//                 decoration:InputDecoration(
//                   filled: true,
//                   fillColor: AppColors.white,
//                   contentPadding: EdgeInsets.symmetric(horizontal:15.w,vertical:14.h),
//                   prefixIcon:IconButton(onPressed:(){},icon: SvgPicture.asset(AppImages.password,width:26.w,height: 26.h,),),
//                   hintStyle: AppTextStyle.interSemiBold,
//                   suffixIcon: IconButton(onPressed: (){
//                     t=!t;
//                     setState(() {});
//                   },icon: (t)?const Icon(Icons.visibility):const Icon(Icons.visibility_off),),
//                   hintText: "Password",
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(9),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(9),
//                   ),
//                 ),
//               ),
//             ),