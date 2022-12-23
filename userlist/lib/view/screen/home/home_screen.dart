import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:userlist/data/arg/user_arg.dart';
import 'package:userlist/data/model/user_model.dart';
import 'package:userlist/data/service/apiservice.dart';
import 'package:userlist/db/hive/model/hive_db.dart';
import 'package:userlist/util/app_color.dart';
import 'package:userlist/util/app_constant.dart';
import 'package:userlist/view/screen/home/bloc/user_bloc.dart';
import 'package:userlist/view/widget/app_text_view.dart';

import '../../../db/hive/boxes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //model list
    List<UserModel> userList = [];
    //bloc
    final userBloc = UserBloc(RepositoryProvider.of<APIService>(context));
    //call event
    userBloc.add(const UserApiEvent());
    return RepositoryProvider(
      create: (context) => userBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.kBlue,
          leading: Container(),
          centerTitle: true,
          title: appTextView(
              name: 'User List',
              isBold: true,
              color: AppColor.kWhite,
              size: 20),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: commonPaddingAll,
            child: BlocListener<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserLoadingState) {
                  Fluttertoast.showToast(
                      msg: "Loading....",
                      backgroundColor: AppColor.kBlack,
                      textColor: AppColor.kWhite,
                      fontSize: 15.0);
                }
                if (state is UserLoadedState) {
                  for (int i = 0; i < state.response.data.length; i++) {
                    var data = state.response.data[i];
                    //add to list
                    userList.add(
                      UserModel(
                        id: data.id.toString(),
                        firstName: data.firstName.toString(),
                        lastName: data.lastName.toString(),
                        email: data.email.toString(),
                        avatar: data.avatar.toString(),
                      ),
                    );
                    //add to hive
                    final users = User()
                      ..id = data.id.toString()
                      ..firstName = data.firstName.toString()
                      ..lastName = data.lastName.toString()
                      ..email = data.email.toString()
                      ..avatar = data.avatar.toString();

                    final box = Boxes.getData();
                    box.add(users);
                  }
                }
              },
              child: ValueListenableBuilder<Box<User>>(
                valueListenable: Boxes.getData().listenable(),
                builder: (context, box, _) {
                  final userValue = box.values.toList().cast<User>();
                  return homeUIWidget(userValue);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column homeUIWidget(List<User> userValue) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: userValue.length,
          separatorBuilder: (context, index) => dividerSH(),
          itemBuilder: (context, index) {
            var data = userValue[index];
            String id = data.id.toString();
            String firstName = data.firstName.toString();
            String image = data.avatar.toString();
            String lastName = data.lastName.toString();
            String email = data.email.toString();
            return InkWell(
              child: Container(
                height: 100,
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.network(image),
                      ),
                      dividerW(),
                      dividerW(),
                      appTextView(name: firstName, isBold: true),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: UserArg(
                      id: id,
                      fistName: firstName,
                      lastName: lastName,
                      email: email,
                      avatar: image),
                );
              },
            );
          },
        )
      ],
    );
  }
}
