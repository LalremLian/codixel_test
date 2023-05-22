import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
          centerTitle: true,
        ),
        body: Obx(
          () {
            if (controller.isLoading.value) {
              return const Center(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: RiveAnimation.asset('assets/loading_new.riv',
                    fit: BoxFit.cover,),
                ), // Show a loading indicator
              );
            } else if (controller.isEmpty.value) {
              return const Center(
                child: Text('No Data'), // Show an error message
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Card(
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(controller.model.value.avatar!,
                            height: 90,
                            width: 90,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Text('${controller.model.value.firstName!} ${controller.model.value.lastName!}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                    fontSize: 18),),
                                ),
                                Text(controller.model.value.dateOfBirth!,),
                                Text(controller.model.value.phoneNumber!),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.getProfileAPIData();
          },
          child: const Icon(Icons.restart_alt),
        ));
  }
}

