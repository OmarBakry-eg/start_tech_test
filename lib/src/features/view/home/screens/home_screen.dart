import 'package:flutter/material.dart';
import 'package:start_tech_test/src/features/view/home/widgets/action_widget.dart';
import 'package:start_tech_test/src/features/view/home/widgets/profile_data_widget.dart';
import 'package:start_tech_test/src/utils/base/custom_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> profileTitles = [
      'test01 t',
      "+971 559944652",
      "test@test.test"
    ];
    List<IconData> profileIcons = [
      Icons.person_outline,
      Icons.phone_android,
      Icons.email_outlined,
    ];
    List<String> actionsTitle = [
      'Update Information',
      "Change Password",
      "Delete Account",
      "Logout",
    ];
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
          ListView.separated(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) => ProfileDataWidget(
                    iconData: profileIcons[i],
                    title: profileTitles[i],
                  ),
              separatorBuilder: (c, i) => const SizedBox(
                    height: 25,
                  ),
              itemCount: profileTitles.length),
          ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (c, i) => ActionWidget(
                    title: actionsTitle[i],
                  ),
              separatorBuilder: (c, i) => const SizedBox(
                    height: 15,
                  ),
              itemCount: actionsTitle.length),
        ],
      ),
    );
  }
}
