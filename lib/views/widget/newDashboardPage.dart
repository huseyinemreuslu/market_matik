import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sizer/sizer.dart';
import '../alerts.dart';
import '../menus.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);


  void dependencies() {
    Get.lazyPut<_DashboardPageState>(() => _DashboardPageState());
  }

  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {



  final controller = Get.find<InformationProvider>();
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () {
      controller.loading(context, controller.multiProcess(context));
    });


    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    int bottomSelectedIndex = 0;
    return GetX<InformationProvider>(
        init: InformationProvider(),
        builder: (box) => RefreshIndicator(
          onRefresh: () => box.multiProcess(context),
          child:Scaffold(
            appBar: AppBar(
              title: buildSearch(box),
              leading: IconButton(
                  icon: Icon(Icons.notifications,size: 26.sp),
                  onPressed: () {
                    Navigator.pushNamed(context, "/SubCategories");
                  }),

            ),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                box.changePage(context, value);
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: box.boottomnavbackgroundColor,
              unselectedItemColor: box.boottomnavunselectedItemColor,
              unselectedFontSize: box.boottomnavunselectedFontSize,
              selectedFontSize: box.boottomnavselectedFontSize,
              selectedItemColor: box.boottomnavselectedItemColor,
              currentIndex: bottomSelectedIndex,
              items: box.subBarList(),
              selectedLabelStyle: TextStyle(fontSize: 8.sp),
              iconSize: box.boottomnaviconSize.h,
            ),
            floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
            body: (box.isUnExpected.value == false) ? Container(
              alignment: Alignment.center,
              child: ListView(
                children: [
                  if(box.categoryList.isNotEmpty)Padding(padding: const EdgeInsets.all(8),child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Kategoriler",style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                        TextButton(child:  Text("Tüm Kategoriler", style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xff228B22),
                          fontWeight: FontWeight.bold,
                        )),onPressed: () {

                          Navigator.pushNamed(context, "/Categories");
                        })
                      ],
                    )),
                    buildCategories(context, box),
                    if(box.slide.isNotEmpty) Padding(padding: const EdgeInsets.all(8),child: CarouselSlider(
                      ///Slide
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: false,
                        viewportFraction: 1.0,
                        aspectRatio: 1.0,
                        autoPlayAnimationDuration: const Duration(milliseconds: 150),
                        pageSnapping: true,
                        height: 20.h,
                      ),
                      items: box.slide
                          .map((item) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child:
                        FadeInImage.assetNetwork(
                          placeholder: "assets/images/logo.png",
                          image: "https://" +
                              box.apiUrl +
                              "/image/" +
                              item.image,

                        ),
                      ))
                          .toList(),
                    )),
                    if(box.discountProductList.isNotEmpty) Padding(padding: const EdgeInsets.all(8),child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Süper Fırsatlar",style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        )),
                        TextButton(child:  Text("Tüm ürünler", style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xff228B22),
                          fontWeight: FontWeight.bold,
                        )),onPressed: () {
                        })
                      ],
                    )),
                    if(box.discountProductList.isNotEmpty) Padding(padding: const EdgeInsets.all(8), child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: false,
                        enableInfiniteScroll: false,
                        viewportFraction: 1.0,
                        aspectRatio: 1.0,
                        pageSnapping: true,
                        height: 500,
                      ),
                      items: List.generate(box.discountProductList.getRange(0, 10).length, (index) {
                        var p1 = box.discountProductList[index].price.split(".");
                        var p2 = box.discountProductList[index].specialPrice.split(".");
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: GestureDetector(
                            onTap: () {
                              debugPrint("ROAD TO CARD INFORMATION");
                            },
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                      children: [
                                        Center(child: ClipRRect(
                                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                          child:
                                          FadeInImage.assetNetwork(
                                            placeholder: "assets/images/logo.png",
                                            image: "https://" +
                                                box.apiUrl +
                                                "/image/" +
                                                box.discountProductList[index].image,width: 100.w,
                                          ),
                                        )),
                                        Obx(() => Row(mainAxisAlignment: MainAxisAlignment.end,
                                            children: [Stack(children: [IconButton(onPressed: () {}, icon: const Icon(Icons.circle,color: Colors.white),iconSize: 48), Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: IconButton(onPressed: () {
                                                if(box.isLogin.value == true) {
                                                  if(box.discountProductList[index].isWished  == true) {
                                                    box.deleteWishProduct(context, box.discountProductList[index].productId).then((value) {
                                                      setState(() {
                                                        box.discountProductList[index].isWished = value;
                                                        box.update();
                                                      });
                                                    });
                                                  } else {
                                                    box.createWishList(context,box.discountProductList[index].productId).then((value) {
                                                      setState(() {
                                                        box.discountProductList[index].isWished = value;
                                                        box.update();
                                                      });
                                                    });
                                                  }
                                                } else {
                                                  userLoginAlert(context);
                                                }

                                              }, icon: box.discountProductList[index].isWished == true ? const Icon(Icons.favorite,color: Colors.red,size: 32) : const Icon(Icons.favorite_border,size: 32)),
                                            )])])),
                                      ]
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      height: 40,
                                      color: Colors.white,
                                      child: Text(
                                        box.discountProductList[index].name.toString().length > 60 ? box.discountProductList[index].name.toString().substring(0,60).toUpperCase() + "..." : box.discountProductList[index].name.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        color: Colors.white10,
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              " " + p1[0].toString() + " ₺",
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                  decoration: TextDecoration
                                                      .lineThrough),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              p2[0].toString() + " ₺",
                                              style: const TextStyle(
                                                color: Colors.teal,
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),

                        );
                      }),
                    )),
                    if(box.specialProductList.isNotEmpty) Padding(padding: const EdgeInsets.all(8),child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("İndirimli Ürünler",style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                        TextButton(child:  Text("Tüm ürünler", style: TextStyle(
                          fontSize: 10.sp,
                          color: const Color(0xff228B22),
                          fontWeight: FontWeight.bold,
                        )),onPressed: () {
                          box.subCategoryId.value = "175";
                          box.subCategoryName.value = "İndirimli Ürünler";
                          Navigator.pushNamed(context, "/SubCategories");

                        })
                      ],
                    )),
                    if(box.specialProductList.isNotEmpty) GFItemsCarousel(
                      rowCount: 2,
                      itemHeight: 250,
                      children: List.generate(box.specialProductList.length, (index) {
                        var p1 = box.specialProductList[index].price.split(".");
                        var p2 = box.specialProductList[index].specialPrice.split(".");

                        return GestureDetector(
                          onTap: () {
                            debugPrint("ROAD TO CARD INFORMATION");
                          },
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Padding(padding: const EdgeInsets.all(8),child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                                        child:
                                        Center(child: FadeInImage.assetNetwork(
                                          placeholder: "assets/images/logo.png",
                                          image: "https://" +
                                              box.apiUrl +
                                              "/image/" +
                                              box.specialProductList[index].image,fit: BoxFit.cover,height: 165,width: 180,
                                        )),
                                      ),
                                      Obx(() => Row(mainAxisAlignment: MainAxisAlignment.end,
                                          children: [Stack(children: [const Padding(padding: EdgeInsets.all(8),child: Icon(Icons.circle,color: Colors.white,size: 32)), IconButton(onPressed: () {
                                            if(box.isLogin.value == true) {
                                              if(box.specialProductList[index].isWished  == true) {
                                                box.deleteWishProduct(context, box.specialProductList[index].productId).then((value) {
                                                  setState(() {
                                                    box.specialProductList[index].isWished = value;
                                                    box.update();
                                                  });
                                                });
                                              } else {
                                                box.createWishList(context,box.specialProductList[index].productId).then((value) {
                                                  setState(() {
                                                    box.specialProductList[index].isWished = value;
                                                    box.update();
                                                  });
                                                });
                                              }
                                            } else {
                                              userLoginAlert(context);
                                            }

                                          }, icon: box.specialProductList[index].isWished == true ? const Icon(Icons.favorite,color: Colors.red) : const Icon(Icons.favorite_border))])])),
                                    ]
                                )),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                  child: Container(
                                    height: 30,
                                    color: Colors.white,
                                    child: Text(
                                      box.specialProductList[index].name.toString().length > 60 ? box.specialProductList[index].name.toString().substring(0,60).toUpperCase() + "..." : box.specialProductList[index].name.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 5),
                                  color: Colors.white10,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        " " + p1[0].toString() + " ₺",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            decoration: TextDecoration
                                                .lineThrough),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        p2[0].toString() + " ₺",
                                        style: const TextStyle(
                                          color: Colors.teal,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  
                ],
              ),
            ) : unExpectedError(context,box,0)
          )
        )
    );
  }

}
