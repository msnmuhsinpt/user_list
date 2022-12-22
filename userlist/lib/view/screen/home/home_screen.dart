import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:userlist/data/service/apiservice.dart';
import 'package:userlist/util/app_color.dart';
import 'package:userlist/util/app_constant.dart';
import 'package:userlist/view/screen/home/bloc/user_bloc.dart';
import 'package:userlist/view/widget/app_text_view.dart';

import '../../../data/api/user_reponse.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //bloc
  late UserBloc userBloc;
  //model list
  List<Datum> userList = [];

  //data base
  bool isNotAddtoDataBase = true;

  @override
  void initState() {
    super.initState();
    userBloc = UserBloc(RepositoryProvider.of<APIService>(context));

    userBloc.add(const UserApiEvent());
  }

  @override
  void dispose() {
    super.dispose();
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
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
            child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserLoadedState) {
                  if (state.response.data.isNotEmpty) {
                    userList.addAll(state.response.data);
                  }
                }
              },
              builder: (context, state) {
                if (state is UserInitialState) {
                  return const CircularProgressIndicator();
                }
                if (state is UserLoadingState) {
                  return const CircularProgressIndicator();
                }
                if (state is UserLoadedState) {
                  return homeUIWidget(userList, isNotAddtoDataBase);
                }
                if (state is NoInternetState) {
                  return const CircularProgressIndicator();
                }
                if (state is UnAuthorizedState) {
                  //authorization
                  /// please logout
                }
                if (state is ErrorState) {
                  //error
                  ///404 case
                }
                return Container();
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              isNotAddtoDataBase = false;
            });
          },
          label: appTextView(
              name: 'ADD TO DB', isBold: true, color: AppColor.kWhite),
        ),
      ),
    );
  }

  Column homeUIWidget(List<Datum> userList, bool isNotAddtoDataBase) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: 4,
          separatorBuilder: (context, index) => dividerSH(),
          itemBuilder: (context, index) {
            var data = userList[index];
            String id = data.id.toString();
            String firstName = data.firstName.toString();
            String image = data.avatar.toString();
            String lastName = data.lastName.toString();
            String email = data.email.toString();
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.network(
                          image,
                          height: 90,
                          fit: BoxFit.cover,
                        ),
                      ),
                      dividerW(),
                      dividerW(),
                      appTextView(name: firstName, isBold: true),
                    ],
                  ),
                ),
              ),
              onTap: () {
                isNotAddtoDataBase
                    ? EasyLoading.showToast('Plase Add to Database')
                    : Navigator.pushNamed(context, '/details');
              },
            );
          },
        )
      ],
    );
  }
}
