import 'package:bmi_calculator/controller/BmiController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BmiCalc extends StatelessWidget {
  final _controller = Get.put(BmiController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALC',
        style: TextStyle(
        fontSize: 30,
        ),
        ),
      ),

      body: SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(10, 10, 10, 0.8)
            ),

            child: Center(
              child: Container(
                width: Get.width * 0.7,
                height: Get.height * 0.4,
                child: Column(
                  children: [

                    TextFormField(
                      style: const TextStyle(
                          color: Colors.white70
                      ),
                      decoration: const InputDecoration(
                        hintText: 'Weight (Kg)',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white70
                        )
                      ),
                      keyboardType: TextInputType.number,
                      controller: _controller.weightController,
                      onChanged: (weight) {
                        _controller.weight.value = int.parse(weight);
                      },
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                    ),

                    TextFormField(
                      style: const TextStyle(
                          color: Colors.white70
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Height (cm)',
                          hintStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white70
                          )
                      ),
                      keyboardType: TextInputType.number,
                      controller: _controller.heightController,
                      onChanged: (height) {
                        _controller.height.value  = int.parse(height);
                      },
                      onEditingComplete: () =>
                          _controller.calculateBMI(),
                    ),

                    SizedBox(
                      height: Get.height * 0.04,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _controller.calculateBMI();
                            },
                            child: const Text('Calculate')
                        ),

                        SizedBox(
                          width: Get.width * 0.02,
                        ),

                        ElevatedButton(
                            onPressed: () {
                              _controller.clearFields();
                            },
                            child: const Text('Clear')
                        ),
                      ],
                    ),

                    SizedBox(
                      height: Get.height * 0.04,
                    ),
                    Obx(() {
                      return Text(_controller.result.value.toStringAsFixed(4),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 25
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}


