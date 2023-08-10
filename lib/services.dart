import 'predictor_model.dart';
import 'package:dio/dio.dart';
class ApplicationServices{
  final Dio _dio =new Dio();
  Future prediction(String path)async{
    var formData = FormData.fromMap({
      "file":await MultipartFile.fromFile(path)
    });
    try{
      var response = await _dio.post('http://192.168.0.5:8000/api/home/classify',data: formData,options: Options(
        validateStatus:(status)=>true,
        headers:{
          'Content-type':'multipart/form-data',
          'Accept':'application/json'
        }
      ));
      print(response);
      return Predictor.fromJson(response.data);
    }catch(e){
      if(e is DioException){
        throw Exception(e);
      }else{
        throw Exception(e);
      }
    }
  }
}