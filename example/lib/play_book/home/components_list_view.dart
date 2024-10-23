


import 'package:flex_color_scheme_example/play_book/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComponentsListView extends StatelessWidget {
  ComponentsListView({super.key});

  final HomePageController homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {

    // Getting the keys as an Iterable
    Iterable<Components> keys = homePageController.componentsList.keys;

    // Convert the keys to a List
    List<Components> keysList = keys.toList();

    return GetBuilder<HomePageController>(
      builder: (_) {
        return ListView.builder(
            itemCount: homePageController.componentsList.length,
            itemBuilder: (ctx, index){
              return ComponentsListItem(componentName: keysList[index], isSelected: homePageController.currentSelectedWidget == keysList[index],);
            });
      }
    );
  }
}

class ComponentsListItem extends StatelessWidget {
   ComponentsListItem({super.key, required this.componentName, required this.isSelected});

  final Components componentName;
  final bool isSelected;

  final HomePageController homePageController = Get.find<HomePageController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        homePageController.selectWidget(componentName);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isSelected ? Colors.blueAccent : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: Text(componentName.name, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? Colors.white : Colors.black),),
      ),
    );
  }
}

