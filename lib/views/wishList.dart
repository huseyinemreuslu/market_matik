import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'alerts.dart';
import 'menus.dart';


InformationProvider p = InformationProvider();

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);


  @override
  WishlistPageState createState() =>
      WishlistPageState();
}

class WishlistPageState extends State<WishlistPage> {

  final box = Get.find<InformationProvider>();
  var initValue = 0;
  var tempValue = 7;
  var orderBy = 0;
  var orderByText = "Önerilen";
  ScrollController scController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      box.wishList.clear();
      pageProcess();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    box.wishList.clear();

  }

  Future<void> pageProcess() async {
    setState(() {
      debugPrint(box.subCategoryId.value);
      box.loading(context, box.getWishlist(context,initValue.toString(),"10","true").then((value) {
        box.wishList.value = value;
        tempValue = value.length;
        initValue += 10;
      }));
      scController.addListener(() {
        if(tempValue>=10) {
          if (scController.position.pixels ==
              scController.position.maxScrollExtent) {
            box.getWishlist(context,initValue.toString(),"10","true").then((value){
              box.wishList.value += value;
              tempValue = value.length;
              initValue += 10;
              box.update();
            });
          }
        }
      });
      box.update();
    });
  }

  @override
  Widget build(BuildContext context) {
    int bottomSelectedIndex = 1;

    return GetX<InformationProvider>(
        init: InformationProvider(),
        builder: (box) =>  Scaffold(
            appBar: AppBar(
              title: Text(
                "Favorilerim",
                style: TextStyle(fontSize: 13.sp),
              ),
              leading: IconButton(
                  icon: Icon(Icons.notifications,size: 26.sp),
                  onPressed: () {
                    Navigator.pushNamed(context, "/SubCategories");
                  }),
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

            body: box.isUnExpected.value == false ? box.wishList.isNotEmpty ? Column(children: [
              Expanded(child: GridView.count(crossAxisCount: 1,
                controller: scController,
                physics: const AlwaysScrollableScrollPhysics(),
                childAspectRatio: 1.9,
                children: List.generate(box.wishList.length, (index) {

                  final item = box.wishList[index].product;


                  var p1 = box.wishList[index].product.price.split(".");
                  var p2 = box.wishList[index].product.specialPrice.split(".");

                  if(box.wishList[index].product.specialPrice.split(".") == null) {
                    p2 = box.wishList[index].product.price.split(".");
                  }
                  return GestureDetector(
                    onTap: () {
                      debugPrint("ROAD TO CARD INFORMATION");
                    },
                    child: Card(
                      child: Row(
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

                              ]
                          )),
                          Expanded(child: Stack(children: [
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                                children: [Stack(children: [const Padding(padding: EdgeInsets.all(8),child: Icon(Icons.circle,color: Colors.white,size: 32)), IconButton(onPressed: () {
                                  if(box.isLogin.value == true) {
                                    setState(() {
                                      box.deleteWishProduct(context, box.wishList[index].product.productId).then((value) {
                                        setState(() {
                                          box.wishList[index].product.isWished = value;
                                          box.wishList.removeAt(index);
                                          box.update();
                                        });
                                      });
                                    });
                                  } else {
                                    userLoginAlert(context);
                                  }
                                }, icon: const Icon(Icons.delete_outline,color: Colors.redAccent))])]),
                            Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                              const SizedBox(height: 50),
                              Text(
                                box.wishList[index].product.name.toString().length > 60 ? box.wishList[index].product.name.toString().substring(0,60).toUpperCase() + "..." : box.wishList[index].product.name.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                              const SizedBox(height: 30),
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
                              const SizedBox(height: 30),
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
                              ),
                            ])]))],
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
