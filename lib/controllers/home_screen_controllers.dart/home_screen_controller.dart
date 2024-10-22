import 'package:get/get.dart';
import 'package:k12_demo_proje/models/home_screen_datas_models/home_screen_data_model.dart';
import 'package:k12_demo_proje/services/home_screen_services/home_screen_service.dart';
import 'package:k12_demo_proje/widgets/custom_snack_bar.dart';

enum HomeStatus { initial, loading, error, success }

class HomeScreenController extends GetxController {
  HomeScreenService service = HomeScreenService();
  HomeStatus status = HomeStatus.initial;
  int currentPage = 0;
  List<DataModel> dataList = [];
  List<DataModel> featuredList = [];
  List<DataModel> latestList = [];
  List<DataModel> trendingList = [];

//initial
  @override
  void onInit() {
    super.onInit();
    getData();
  }

//fetch data to datalist
  Future getData() async {
    try {
      status = HomeStatus.loading;
      dataList = await service.getDatas();

      if (dataList.isNotEmpty) {
        status = HomeStatus.success;
        splitCategory();
        update();
      } else {
        status = HomeStatus.error;
        CustomSnackBar.showErrorMessage("Beklenmeyen Bir Hata Oluştu.");
      }
      update();
    } catch (e) {
      print(e);
    }
  }

  //split to category

  void splitCategory() {
    for (var i in dataList) {
      if (i.category == "lorem") {
        featuredList.add(i);
      } else if (i.category == "ipsum") {
        latestList.add(i);
      } else {
        trendingList.add(i);
      }
    }
  }

  void changeCurrentPage({required int pageIndex}) {
    currentPage = pageIndex;
    update();
  }

  List<DataModel> checkCurrentPage() {
    if (currentPage == 0) {
      return featuredList;
    } else if (currentPage == 1) {
      return latestList;
    } else {
      return trendingList;
    }
  }
}
