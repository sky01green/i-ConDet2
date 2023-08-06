import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ml_project/predictor_model.dart';

class ResultPage extends StatelessWidget {
  static String routename = "/result";

  @override
  Widget build(BuildContext context) {
    final ScreenArguments result = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Result "),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          width: 200,
          child: Card(child: Image.file(File(result.image!.path)))
        ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Text(result.result.args["result"]),
            )
          ],
        ),
      ),
    );
  }
}

