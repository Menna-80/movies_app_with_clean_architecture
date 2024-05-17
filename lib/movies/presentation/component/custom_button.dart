import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_color.dart';

Widget customButton(context, String title, void Function()? onTap) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
                colors: [AppColor.royalBlue, AppColor.violet])),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
      ),
    );