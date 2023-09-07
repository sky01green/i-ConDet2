import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ml_project/predictor_model.dart';
import 'dart:io';
import 'package:ml_project/services.dart';

class MainPage extends StatefulWidget {
  static String routename = "/main";
  static XFile? file;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String message = "";
  bool isLoading = false;
  final ApplicationServices repo = new ApplicationServices();

  getPredictions()async{
    setState(() {
      isLoading=true;
    });
    final Predictor result = await repo.prediction(MainPage.file!.path);
    print(result);
    setState(() {
      isLoading=false;
      message = result.args["result"];
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("eyeapp"),
        backgroundColor: Color(0xff6200ED),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Color(0xffFFBE00),
      body: Container(
        width: width,
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 3,
              child: Image.asset("assets/eyescan.png",width: width/2,height: height/4,),),
            MainPage.file==null?Container():Expanded(child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Image.file(File(MainPage.file!.path))
            )),
            Expanded(
                flex: 3,
                child: Container(child: Column(
              children: [
                Container(
                  width: width/3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff000002)
                      ),
                      onPressed: (){
                        Navigator.pushNamedAndRemoveUntil(context, '/camera',ModalRoute.withName('/main'));
                      }, child: Text("CAPTURE")),
                ),
                SizedBox(height: height*0.04,),
                Container(
                  width: width/3,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff000002)
                      ),
                      onPressed: ()async{

                        if(MainPage.file==null){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No file Selected")));
                        }
                        else{
                          await getPredictions();
                        }
                      }, child: isLoading==true?Container(
                      height: 20,
                      width: 20,
                      child: const CircularProgressIndicator(color: Colors.white,)):Text("PREDICT")),
                ),
                SizedBox(height: height*0.04,),
                message.isEmpty?Container():Container(child: Text(message.toUpperCase(),style: TextStyle(fontWeight: FontWeight.w700,fontSize: 25),),)
              ],
            ),)),

          ],
        ),
      ),
    );
  }
}
