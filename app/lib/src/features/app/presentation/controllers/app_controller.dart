import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  final PageController pageController = PageController();
  final GlobalKey pageViewKey = GlobalKey();
  final GlobalKey bottomNavKey = GlobalKey();

  final _currentPage = 0.obs;
  get currentPage => _currentPage.value;
  set currentPage(value) => _currentPage.value = value;

  final _isLogged = false.obs;
  get isLogged => _isLogged.value;
  set isLogged(value) => _isLogged.value = value;

  void animateToPage(int page) {
    currentPage = page;
    pageController.jumpToPage(page);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
