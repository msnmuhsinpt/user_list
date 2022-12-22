import 'package:flutter/material.dart';
import 'package:userlist/util/app_color.dart';
import 'package:userlist/util/app_constant.dart';
import 'package:userlist/view/widget/app_image.dart';
import 'package:userlist/view/widget/app_text_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kBlue,
        leading: Container(),
        centerTitle: true,
        title: appTextView(
            name: 'User List', isBold: true, color: AppColor.kWhite, size: 20),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: commonPaddingAll,
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: 4,
                separatorBuilder: (context, index) => dividerSH(),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.2),
                      ),
                      child: Padding(
                        padding: commonPaddingAll5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColor.kBlue.withOpacity(0.4),
                            ),
                            dividerW(),
                            dividerW(),
                            appTextView(name: 'Muhsin Pt', isBold: true),
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/details');
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: appTextView(
            name: 'ADD TO DB', isBold: true, color: AppColor.kWhite),
      ),
    );
  }
}
