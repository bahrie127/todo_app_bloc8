import 'package:flutter/material.dart';
import 'package:todo_app_bloc8/theme.dart';

Column inputDataAdd(String label, TextEditingController textController) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          '$label: ',
          style: primary,
        ),
      ),
      Container(
        padding: const EdgeInsets.only(left: 8.0, bottom: 20.0),
        height: 50,
        width: double.infinity,
        child: TextFormField(
          controller: textController,
        ),
      ),
    ],
  );
}
