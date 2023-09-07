import 'package:flutter/material.dart';
import 'dart:async';
class SplashScreen extends StatefulWidget {
  static String routename = "/splashscreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoading = false;
  @override
  void initState(){
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    isLoading=true;
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushNamedAndRemoveUntil(context, "/main", ModalRoute.withName('/splashscreen'));

  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFBE00),
      body: Container(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/eye-scan.png",width: width/2,height: height/4,),
            SizedBox(height: height*0.1,),
            Container(
              child: Text("iConDet-V2",style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontSize: 40.0
              ),),
            ),
            SizedBox(height: height*0.04,),
            isLoading==true?Container(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ):Container(),
          ],
        ),
      ),
    );
  }
}
