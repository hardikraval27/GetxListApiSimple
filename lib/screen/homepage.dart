import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controllers.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            body: ListView.builder(
              itemCount: controller.postList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        height: Get.height * 0.3,
                        width: Get.width * 0.3,
                        child: Image.network(
                            '${controller.postList[index].avatar}'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: Get.height * 0.3,
                        width: Get.width * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Id:${controller.postList[index].id}'),
                            Text('Email:${controller.postList[index].email}'),
                            Text(
                                'Reactive:${controller.postList[index].reactive}'),
                            Text(
                                'FirstName${controller.postList[index].firstName}'),
                            Text(
                                'LastName${controller.postList[index].lastName}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
