import 'package:flutter/material.dart';
import 'package:my_first_project/utils/styles/app_text_style.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(child: Text('Welcome to Home Screen',style: AppTextStyle.interBold.copyWith(
        color:Colors.black,fontSize:23
      ),),),
    );
  }
}
