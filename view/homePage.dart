import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:static_pages/controller/homePageController.dart';
import 'package:static_pages/modle/modelStudentData.dart';

class HomePage extends StatelessWidget {
  final _conroller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
          child: Container(
            child: Obx(()=>
             ListView.separated(
                separatorBuilder: (BuildContext context , int index){
                  return Container(
                    height: 3,
                  );
                },
                  itemCount: _conroller.studentdata.length,
                  itemBuilder: (BuildContext context , int index){
                  ModelStudentData data = _conroller.studentdata[index];
                    return ListTile(
                      leading: Text("${data.image}"),
                      title: Text("${data.name}"),
                      subtitle: Text("${data.phoneNo}"),
                      trailing: Text("${data.age}"),

                    );

                  }),
            ),
          )

      ),
    );
  }
}
