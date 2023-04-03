import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_3s_mart_app/core/view_models/screens/interfaces/ion_search_view_model.dart';

Widget searchTextField(
    {required IOnSearchViewModel viewmodel, TextInputType? KeyboardType}) {
  return TextFormField(
    style: TextStyle(fontSize: 17),
    keyboardType: KeyboardType ?? TextInputType.text,
    decoration: const InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: 20),
      enabledBorder: UnderlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color: Color.fromRGBO(235, 235, 235, 1),
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        // borderRadius: BorderRadius.all(Radius.circular(5.0)),
        borderSide: BorderSide(
          color: Color.fromRGBO(235, 235, 235, 1),
        ),
      ),
      suffixIcon: Icon(
        Icons.search,
        size: 25,
        color: Color.fromRGBO(34, 0, 255, 1),
      ),
      hintText: 'Search...',
      hintStyle: TextStyle(
        fontSize: 17,
        color: Color.fromRGBO(34, 0, 255, 1),
      ),
    ),
    onChanged: (String value) {
      viewmodel.onSearch(value);
    },
  );
}
