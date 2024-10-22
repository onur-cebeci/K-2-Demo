import 'dart:convert';
import 'package:k12_demo_proje/models/home_screen_datas_models/home_screen_data_model.dart';
import 'package:k12_demo_proje/utils/constant.dart';
import 'package:http/http.dart' as http;

class HomeScreenService {
  Future<List<DataModel>> getDatas() async {
    List<DataModel> modelList = [];

    final url = Uri.parse(AppConstant.apiURL);

    try {
      final res = await http.get(url);
      final data = jsonDecode(res.body);

      if (res.statusCode == AppConstant.success) {
        for (var i = 0; i < data.length; i++) {
          modelList.add(DataModel.fromJson(jsonDecode(res.body)[i]));
        }
        return modelList;
      } else {
        return modelList;
      }
    } catch (e) {
      print(' getDatas Error : $e');
    }

    return modelList;
  }
}
