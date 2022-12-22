import 'package:flutter/material.dart';

//images

String icPlaceHolder = 'assets/images/place_holder.png';

//divider

Widget dividerH() {
  return const SizedBox(height: 20);
}

Widget dividerSH() {
  return const SizedBox(height: 8);
}

Widget dividerSW() {
  return const SizedBox(width: 8);
}

Widget dividerW() {
  return const SizedBox(width: 20);
}

// padding size
EdgeInsets commonPaddingAll = const EdgeInsets.all(10);
EdgeInsets commonPaddingAll20 = const EdgeInsets.all(20);
EdgeInsets commonPaddingAllOnBoard = const EdgeInsets.all(50);
EdgeInsets commonPaddingAll5 = const EdgeInsets.all(5);
EdgeInsets commonPaddingLR = const EdgeInsets.only(left: 10, right: 10);
EdgeInsets commonPaddingLR20 = const EdgeInsets.only(left: 20, right: 20);
EdgeInsets commonPaddingTB = const EdgeInsets.only(top: 10, bottom: 10);
EdgeInsets commonPaddingTB5 = const EdgeInsets.only(top: 5, bottom: 5);
EdgeInsets commonPaddingLR5 = const EdgeInsets.only(left: 5, right: 5);

//screen size

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}
