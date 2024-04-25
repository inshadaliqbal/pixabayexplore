import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class MainGetController extends GetxController{
  var counter = 1.obs;
  var inputTextField = ''.obs;


  void increment(){
    counter++;
  }

  void addInputTextData(String inputData){
    inputTextField.value = inputData;
  }

  void forUpdate(){
    update();
  }

  String mainAPIURL(){
    return "https://pixabay.com/api/?key=43534602-a1332e963a4d1509de70c86ee&q=${inputTextField}&page=${counter.value}&per_page=199";
  }

  Future<String> getData() async {
    http.Response response = await http.get(
      Uri.parse(
          mainAPIURL()),
    );
    String data = await response.body;
    return data;
  }

}