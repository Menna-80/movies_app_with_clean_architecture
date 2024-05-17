import 'package:flutter/material.dart';

class AppString {
  static const appName = "Movies App";
  static const popular = "Popular";
  static const seeMore = "See More";
  static const topRated = "Top Rated";
  static const genres = "Genres";
  static const moreLikeThis = "Similar";
  static const cast = "Cast";
  static const watchlist = "WatchList";
  static const watchTrailers = "Watch Trailers";



}

Widget defualtFormField(
    {required TextEditingController controller,
      required TextInputType type,
      void Function(String?)? onSubmit,
      void Function(String)? onChange,
      bool isPassword = false,
      bool readOnly = false,
      FormFieldValidator<String>? validate,
      required String label,
      required IconData prefix,
      IconData? suffix,
      void Function()? suffixPressed,
      void Function()? onTap}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      readOnly: readOnly,
      obscureText: isPassword,
      onFieldSubmitted: onSubmit,
      onTap: onTap,
      onChanged: onChange,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
