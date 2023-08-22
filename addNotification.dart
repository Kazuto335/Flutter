import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class AddNotificationPage extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();



  Future<void> submitForm() async {
    var url = Uri.parse('http://localhost/process.php');

    var response = await http.post(url, body: {
      'title': titleController.text,
      'description': descriptionController.text,
    });

    if (response.statusCode == 200) {
      Get.snackbar(
        'Successful',
        'Data Enter',
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.snackbar(
        'Error',
        'Data Not Enter',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notification'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: Get.height * 0.2, left: 20, right: 20),
        child: Column(
          children: [
            TextField(
              onChanged: (tittle){

              },
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                hintText: 'Enter the title',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: descriptionController,
              maxLines: 6,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Enter the description',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: submitForm,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
