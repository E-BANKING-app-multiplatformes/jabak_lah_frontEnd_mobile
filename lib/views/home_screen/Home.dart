import 'package:e_banking_app/Controller/HomeContoller.dart';
import 'package:e_banking_app/views/history_screen/history_screen.dart';
import 'package:e_banking_app/views/home_screen/home_screen.dart';
import 'package:e_banking_app/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeContoller());
    var navbarItem = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.history), label: "History"),
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
    ];
    var navBody = [
      const HomeScreen(),
      const HistoryScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: Color(0xFF6415FF),
          //selectedLabelStyle: const TextStyle(),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          items: navbarItem,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            controller.currentNavIndex.value = value;
          },
        ),
      ),
      body: Obx(
        () => Column(
          children: [
            Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ],
        ),
      ),
    );
  }
}
