import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'menus.dart';



InformationProvider p = InformationProvider();

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  CategoriesPageState createState() =>
      CategoriesPageState();
}

class CategoriesPageState extends State<CategoriesPage> {

  final box = Get.find<InformationProvider>();


  @override
  Widget build(BuildContext context) {
    int bottomSelectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Kategoriler",
          style: TextStyle(fontSize: 15.sp),
        ),
        toolbarHeight: 8.h,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          p.changePage(context, value);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: p.boottomnavbackgroundColor,
        unselectedItemColor: p.boottomnavunselectedItemColor,
        unselectedFontSize: p.boottomnavunselectedFontSize,
        selectedFontSize: p.boottomnavselectedFontSize,
        selectedItemColor: p.boottomnavselectedItemColor,
        currentIndex: bottomSelectedIndex,
        items: p.subBarList(),
        selectedLabelStyle: TextStyle(fontSize: 8.sp),
        iconSize: p.boottomnaviconSize.h,
      ),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      body: box.categoryList.isNotEmpty ? Column(children: [Expanded(child: GridView.count(crossAxisCount: 2,
        childAspectRatio: (15.w / 9.h),
        children: List.generate(box.categoryList.length, (index) {
          return SizedBox(
            height: 30.h,
            child: GestureDetector(
              onTap: () {

                box.subCategoryId.value = box.categoryList[index].categoryId;
                box.subCategoryName.value = box.categoryList[index].name;
                Navigator.pushNamed(context, "/SubCategories");
              },
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          child:
                          FadeInImage.assetNetwork(
                            placeholder: "assets/images/logo.png",
                            image: "https://" +
                                p.apiUrl +
                                "/image/" +
                                box.categoryList[index].image,fit: BoxFit.cover,height: 20.h,

                          ),
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        height: 3.h,
                        color: Colors.white,
                        child: Text(
                          box.categoryList[index].name.toString().length > 60 ? box.categoryList[index].name.toString().substring(0,60).toUpperCase() + "..." : box.categoryList[index].name.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

          );
        }


        ),
      ))]) : unExpectedError(context,box,0)
    );
  }



}
