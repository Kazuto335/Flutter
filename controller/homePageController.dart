import 'package:get/get.dart';
import 'package:static_pages/modle/modelStudentData.dart';

class HomePageController extends GetxController{
  var studentdata =  <ModelStudentData>[].obs;

  @override
  void onInit() {

    super.onInit();
    studentdata.value = data();
    studentdata.refresh();
  }



  List<ModelStudentData> data() {
    var list = <ModelStudentData>[];

    var model = ModelStudentData();
    model.name = "RAm";
    model.age = "15";
    model.phoneNo = "7580052418";
    model.image = "https://img.icons8.com/?size=1x&id=0lg0kb05hrOz&format=png";
    list.add(model);

    model = ModelStudentData(); // Create a new instance
    model.name = "Sham";
    model.age = "47";
    model.phoneNo = "1234567890";
    model.image = "https://img.icons8.com/?size=1x&id=KICzEAXp0VMR&format=png";
    list.add(model);

    model = ModelStudentData(); // Create a new instance
    model.name = "dham";
    model.age = "85";
    model.phoneNo = "4567891234";
    model.image = "https://img.icons8.com/?size=512&id=KbI4xhQzJQBG&format=png";
    list.add(model);

    return list;
  }

}