import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'alerts.dart';
import 'menus.dart';


InformationProvider p = InformationProvider();

class SubCategoriesPage extends StatefulWidget {
  const SubCategoriesPage({Key? key}) : super(key: key);


  @override
  SubCategoriesPageState createState() =>
      SubCategoriesPageState();
}

class SubCategoriesPageState extends State<SubCategoriesPage> {

  final box = Get.find<InformationProvider>();
  var initValue = 0;
  var tempValue = true;
  var orderBy = 0;
  var orderByText = "Önerilen";
  ScrollController scController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      box.loading(context, pageProcess());
    });


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    box.productListWCategory.clear();

  }

  Future<void> pageProcess() async {
    setState(() {
      initValue = 0;
      tempValue = true;
      box.productListWCategory.clear();
      if(tempValue == true) {
        box.loading(context, box.getProductWithCategoryList(context, box.subCategoryId.value,initValue.toString(),"10",orderBy.toString()).then((value){

          Future.delayed(Duration.zero,(){
            box.loading(context, box.getWishlist(context,"","","").then((value1) {
              box.wishList.value = value1;
              box.productListWCategory.value += value;
              if(value1.length >= 10) {
                initValue += 10;
              } else {
                tempValue = false;
              }

              for (var item in box.productListWCategory) {
                for (var element in box.wishList) {
                  if(item.productId == element.product.productId) {
                    item.isWished = true;
                  }
                }
              }
            }).then((value){
              Future.delayed(const Duration(milliseconds: 300),(){
                box.loading(context, box.getOptions(context).then((value2) {

                }));
              });
            }));
          });
          box.update();
        }));
      }
      scController.addListener(() {
        if(tempValue == true) {
          if (scController.position.pixels ==
              scController.position.maxScrollExtent) {
            box.getProductWithCategoryList(context, box.subCategoryId.value,initValue.toString(),"10",orderBy.toString()).then((value){
              box.productListWCategory.value += value;

              if(value.length >= 10) {
                initValue += 10;
              } else {
                tempValue = false;
              }

              for (var item in box.productListWCategory) {
                for (var element in box.wishList) {
                  if(item.productId == element.product.productId) {
                    item.isWished = true;
                  }
                }
              }
              box.update();
            });
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int bottomSelectedIndex = 0;

    return GetX<InformationProvider>(
        init: InformationProvider(),
        builder: (box) =>  Scaffold(
            appBar: AppBar(
              title: Text(
                box.subCategoryName.value,
                style: TextStyle(fontSize: 13.sp),
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

            body: box.isUnExpected.value == false ? box.productListWCategory.isNotEmpty ? Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                const Text("Sırala",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                DropdownButton<String>(
                  value: orderByText,
                  elevation: 16,
                  style: const TextStyle(color: Colors.green),
                  underline: Container(
                    height: 2,
                    color: Colors.green,
                  ),
                  onChanged: (String? newValue) {
                    box.productListWCategory.clear();
                    setState(() {
                      orderByText = newValue!;
                      if(newValue == "Önerilen") {
                        orderBy = 0;
                      }
                      if(newValue == "En Düşük Fiyat") {
                        orderBy = 1;
                      }
                      if(newValue == "En Yüksek Fiyat") {
                        orderBy = 2;
                      }
                    });
                    box.loading(context, pageProcess());
                  },
                  items: ['Önerilen', 'En Düşük Fiyat', 'En Yüksek Fiyat']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.center,children: [
                        value == orderByText  ? const Icon(Icons.radio_button_checked) : const Icon(Icons.radio_button_off),
                        const SizedBox(width: 20),
                        Text(value,style: const TextStyle(fontSize: 16)),
                      ]),
                    );
                  }).toList(),
                )
              ]),
              const Divider(color: Colors.black,height: 2,)
              ,Expanded(child: GridView.count(crossAxisCount: 2,
              controller: scController,
              physics: const AlwaysScrollableScrollPhysics(),
              childAspectRatio: 0.65,
              children: List.generate(box.productListWCategory.length, (index) {
                final item = box.productListWCategory[index];

                var p1 = box.productListWCategory[index].price.split(".");
                var p2 = box.productListWCategory[index].specialPrice.split(".");

                if(box.productListWCategory[index].specialPrice.split(".") == null) {
                  p2 = box.productListWCategory[index].price.split(".");
                }

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
                                      item.image,fit: BoxFit.cover,height: 165,width: 180,
                                )),
                              ),
                              Obx(() => Row(mainAxisAlignment: MainAxisAlignment.end,
                                  children: [Stack(children: [const Padding(padding: EdgeInsets.all(8),child: Icon(Icons.circle,color: Colors.white,size: 32)), IconButton(onPressed: () {
                                    if(box.isLogin.value == true) {
                                      setState(() {
                                        if(box.productListWCategory[index].isWished  == true) {
                                          box.deleteWishProduct(context, box.productListWCategory[index].productId).then((value) {
                                            setState(() {
                                              box.productListWCategory[index].isWished = value;
                                              box.update();
                                            });
                                          });
                                        } else {
                                          box.createWishList(context,box.productListWCategory[index].productId).then((value) {
                                            setState(() {
                                              box.productListWCategory[index].isWished = value;
                                              box.update();
                                            });
                                          });
                                        }
                                      });
                                    } else {
                                      userLoginAlert(context);
                                    }

                                  }, icon: box.productListWCategory[index].isWished == true ? const Icon(Icons.favorite,color: Colors.red) : const Icon(Icons.favorite_border))])])),
                            ]
                        )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                          child: Container(
                            height: 40,
                            color: Colors.white,
                            child: Text(
                              box.productListWCategory[index].name.toString().length > 60 ? box.productListWCategory[index].name.toString().substring(0,60).toUpperCase() + "..." : box.productListWCategory[index].name.toString(),
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
                              p2[0].toString() != "null" ?
                              Text(
                                " " + p1[0].toString() + " ₺",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration
                                        .lineThrough),
                              ) : const SizedBox(width: 0,height: 0),
                              const SizedBox(width: 10),
                              p2[0].toString() != "null" ?
                              Text(
                                p2[0].toString() + " ₺",
                                style: const TextStyle(
                                  color: Colors.teal,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ) : Text(
                                p1[0].toString() + " ₺",
                                style: const TextStyle(
                                  color: Colors.teal,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ) ,
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if(box.wishList[index].product.stolenQuantity == 0) InkWell(child: Container(
                              width: 150,
                              padding: const EdgeInsets.all(8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(3)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: const Offset(0, 2),
                                      blurRadius: 5,
                                      spreadRadius: 2)
                                ],
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.white,
                                    Colors.white
                                  ],
                                ),
                              ),
                              child: const Text(
                                "Sepete Ekle",
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ) ,
                            ),onTap: () {
                              setState(() {
                                box.wishList[index].product.stolenQuantity++;
                              });
                              //box.loading(context, box.addCart(context, box.wishList[index].product.productId, quantity, ""));
                            }),
                            if(box.wishList[index].product.stolenQuantity != 0) Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                              TextButton(onPressed: (){
                                setState(() {
                                  box.wishList[index].product.stolenQuantity--;
                                });
                              }, child: const Icon(Icons.remove)),
                              Text(box.wishList[index].product.stolenQuantity.toString()),
                              TextButton(onPressed: (){
                                setState(() {
                                  box.wishList[index].product.stolenQuantity++;
                                });
                              }, child: const Icon(Icons.add))
                            ])
                          ],
                        )

                      ],
                    ),
                  ),
                );

              }
              ),
            ))]) : noElement(context) : unExpectedError(context,box,1)
        )
    );
  }



}
