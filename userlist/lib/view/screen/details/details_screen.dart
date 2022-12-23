import 'package:flutter/material.dart';
import 'package:userlist/util/app_color.dart';
import 'package:userlist/util/app_constant.dart';
import 'package:userlist/view/widget/app_text_view.dart';

class DetailsScreen extends StatelessWidget {
  final String id;
  final String fistName;
  final String lastName;
  final String email;
  final String avatar;

  const DetailsScreen(
      {required this.id,
      required this.fistName,
      required this.lastName,
      required this.email,
      required this.avatar,
      super.key});

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
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                avatar,
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
            dividerH(),
            appTextView(name: 'Name :   $fistName' '$lastName', isBold: true),
            dividerSH(),
            appTextView(name: 'Email :   $email', isBold: true),
          ],
        ),
      ),
    );
  }
}
