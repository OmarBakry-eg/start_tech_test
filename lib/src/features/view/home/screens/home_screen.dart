import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_tech_test/src/features/controller/home/state_management/home_controller.dart';
import 'package:start_tech_test/src/features/view/home/widgets/action_widget.dart';
import 'package:start_tech_test/src/features/view/home/widgets/profile_data_widget.dart';
import 'package:start_tech_test/src/utils/base/custom_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 67,
        backgroundColor: const Color.fromARGB(255, 46, 12, 52),
        title: const CustomTextWidget(
          title: 'Home Page',
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          GetBuilder<HomeController>(builder: (controller) {
            return ListView.separated(
                padding: const EdgeInsets.all(20),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (c, i) => ProfileDataWidget(
                      iconData: homeController.profileIcons[i],
                      title: homeController.profileTitles[i],
                    ),
                separatorBuilder: (c, i) => const SizedBox(
                      height: 25,
                    ),
                itemCount: homeController.profileTitles.length);
          }),
          ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) => ActionWidget(
                    title: homeController.actionsTitle[i],
                  ),
              separatorBuilder: (c, i) => const SizedBox(
                    height: 15,
                  ),
              itemCount: homeController.actionsTitle.length),
        ],
      ),
    );
  }
}
