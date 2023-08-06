import 'package:image_picker/image_picker.dart';

class Predictor{
  final Map<String,dynamic> args;
  Predictor(this.args);
  Predictor.fromJson(Map<String,dynamic> json):args=json;
}
class ScreenArguments{
  final XFile? image;
  final Predictor result;
  ScreenArguments(this.result,this.image);
}