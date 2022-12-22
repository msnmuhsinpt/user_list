/*
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../util/app_constant.dart';

Widget commonCacheImage(
  String item,
  double width,
  double height,
) {
  return CachedNetworkImage(
    imageUrl: item,
    width: width,
    height: height,
    imageBuilder: (context, imageProvider) => Stack(children: [
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
          bottom: 10,
          width: 100,
          child: Container(
            width: screenWidth(context),
          ))
    ]),
    placeholder: (context, url) =>
        Image.asset(icPlaceHolder, height: 100, fit: BoxFit.cover),
    errorWidget: (context, url, error) =>
        Image.asset(icPlaceHolder, height: 100, fit: BoxFit.cover),
  );
}
*/
