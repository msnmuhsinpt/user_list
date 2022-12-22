import 'package:flutter/material.dart';
import 'package:userlist/util/app_color.dart';
import 'package:userlist/util/app_constant.dart';
import 'package:userlist/view/widget/app_text_view.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kBlue,
        centerTitle: true,
        title: appTextView(
            name: 'Details Page',
            isBold: true,
            size: 20,
            color: AppColor.kWhite),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            dividerH(),
            CircleAvatar(
              radius: 70,
              backgroundColor: AppColor.kBlue.withOpacity(0.5),
            ),
            dividerH(),
            appTextView(name: 'Name :   Muhammed Muhsin PT', isBold: true),
            dividerSH(),
            appTextView(name: 'Email :   msnmuhsin83@gmail.com', isBold: true),
          ],
        ),
      ),
    );
  }
}
