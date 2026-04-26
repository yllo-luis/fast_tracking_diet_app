import 'package:fast_tracking_diet_app/presentation/modules/home/store/home_store.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final HomeStore homeStore;

  HomeController({required this.homeStore});

  ValueNotifier<int> get getCurrentPage => homeStore.currentPage;
  set setCurrentPage(int page) => homeStore.currentPage.value = page;
}