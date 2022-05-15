import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:ecosargidamarket/models/detail.dart';
import 'package:ecosargidamarket/models/option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:sizer/sizer.dart';

import 'alerts.dart';



late Future<List<Detail>> futureurundetaylistesi;

final _formKey = GlobalKey<FormState>();
bool alistesivarmi = false;

late String yorumetni;
final box = Get.find<InformationProvider>();
class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage({required this.productid});
  final String productid;


  @override
  _ProductDetailsPageState createState() =>
      _ProductDetailsPageState(productid: productid);
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {


  _ProductDetailsPageState({required this.productid});
  final String productid;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        box.tabIndex.value = 0;
        box.star.value = 0;
        box.productId = productid;
        box.productPriceDiscountInformation.value = "";
        if(box.productId!.isNotEmpty) {
          box.getProductDetail(context, box.productId!);

        } else {
          errorAlert(context);
        }

      });
    });


  }


  @override
  void dispose() {
    box.numOfProduct.value = 0;
    super.dispose();
  }

  String _parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;
    return parsedString;
  }

  @override
  Widget build(BuildContext context) {
    int bottomSelectedIndex = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ürün Detayı",
          style: TextStyle(fontSize: 15.sp, color: Colors.white),
        ),
        toolbarHeight: 8.h,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          box.changePage(context, value);
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green.shade900,
        unselectedItemColor: Colors.amber.shade100,
        unselectedFontSize: 11,
        selectedFontSize: 13,
        selectedItemColor: Colors.lightGreenAccent.shade100,
        currentIndex: bottomSelectedIndex,
        items: box.subBarList(),
        iconSize: 3.h,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/Cart');
        },
        child: const Icon(
          Icons.shopping_cart_outlined,
          size: 35,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      body: FutureBuilder(
          future: futureurundetaylistesi,
          builder: (context, AsyncSnapshot<List<Detail>> sonuc) {
            if (sonuc.hasData) {
              return ListView.builder(
                  itemCount: sonuc.data!.length.compareTo(0),
                  itemBuilder: (context, index) {
                    box.getDiscountProductInformation(sonuc.data![index].productId);
                    return Column(
                      children: [
                        Center(
                          child: FadeInImage.assetNetwork(
                            placeholder: "assets/images/logo.gif",
                            image: "https://" +
                                box.apiUrl +
                                "/image/" +
                                sonuc.data![index].image,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              sonuc.data![index].name,
                              style: TextStyle(
                                  fontSize: 12.sp, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            stars(int.parse(sonuc.data![index].reviews)),
                            CircleAvatar(
                              child: IconButton(
                                  icon: Icon(
                                    alistesivarmi == true
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.amber,
                                  ),
                                  onPressed: () {
                                    box.accountInfo.isNotEmpty == true
                                        ? box.createWishList(context,
                                        sonuc.data![index].productId,
                                        )
                                        : userLoginAlert(context);
                                  }),
                            ),
                            Text(sonuc.data![index].reviews + "  yorum"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: fiyatGoster(
                                      sonuc.data![index], box.productOption.last),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                      "Ürün Kodu: " + sonuc.data![index].model),
                                  Text("Ziyaretçi Sayısı: " +
                                      sonuc.data![index].viewed),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            box.tabIndex.value = 0;
                                          });
                                        },
                                        child: Text(
                                          "Ürün Açıklaması",
                                          style: TextStyle(
                                              color: box.tabIndex.value == 0
                                                  ? Colors.green
                                                  : Colors.grey),
                                        )),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                        onPressed: () {
                                          setState(() {
                                            box.tabIndex.value = 1;
                                          });
                                        },
                                        child: Text("Yorumlar",
                                            style: TextStyle(
                                                color: box.tabIndex.value == 1
                                                    ? Colors.green
                                                    : Colors.grey))),
                                  ),
                                ],
                              ),
                              box.tabIndex.value == 0
                                  ? Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Text(
                                    _parseHtmlString(
                                        sonuc.data![index].description),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              )
                                  : box.productComment.isNotEmpty == true
                                  ? commentList()
                                  : Card(
                                  margin: EdgeInsets.all(5.h),
                                  color: Colors.amber,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                          "Yorum Bulunmamaktadır.",
                                          style: TextStyle(fontSize: 10.sp),
                                        )),
                                  )),
                              box.tabIndex.value == 1
                                  ? commentForm()
                                  : const SizedBox(
                                height: 0,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  numOfProduct(),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: productOptions(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Sepete Ekle",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    );
                  });
            } else {
              return Center(
                child: TextButton(
                  onPressed: () {
                    box.getProductDetail(context, box.productId!);
                  },
                  child: const CircularProgressIndicator(),
                ),
              );
            }
          }),
    );
  }

  Widget commentList() {
    return Column(
        children: box.productComment
            .map((item) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Card(
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Sn. " + item.author.toUpperCase()),
                    Text(item.dateAdded),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                  child: numOfComments(int.parse(item.rating))),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(item.text),
            ),
            const Divider(
              height: 10,
            ),
          ],
        ))
            .toList());
  }

  Widget numOfComments(int rating) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      for (int i = 1; i <= rating; i++) const Icon(Icons.star, color: Colors.yellow)
    ]);
  }

  Widget productOptions() {
    return box.productOption.isNotEmpty
        ? Center(
      child: DropdownButton<Option>(
        hint: Text(
          "Seçenekler",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.sp,
          ),
        ),
        value: box.productPrice,
        onChanged: (Option? value) {
          setState(() {
            box.productPrice = value!;
          });
        },
        items: box.productOption.last.map((Option option) {
          return DropdownMenuItem<Option>(
            value: option,
            child: Row(
              children: [
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  option.name,
                  style: TextStyle(color: Colors.black, fontSize: 8.sp),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    )
        : Center(
      child:
      Text("Seçenek mevcut değil", style: TextStyle(fontSize: 8.sp)),
    );
  }

  Widget fiyatGoster(
      Detail price, Option? secenekprice) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        price.price.substring(0, price.price.length - 2) + " ₺",
        style: TextStyle(
            fontSize: 12.sp,
            color:box.productPriceDiscountInformation.value != "" ? Colors.grey : Colors.green,
            fontWeight: FontWeight.bold,
            decoration: box.productPriceDiscountInformation.value != ""
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      box.productPriceDiscountInformation.value != ""
          ? Text(" - ",
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.green,
              fontWeight: FontWeight.bold))
          : const SizedBox(height: 0),
      Text(
        box.productPriceDiscountInformation.value,
        style: TextStyle(
            fontSize: 15.sp, color: Colors.green, fontWeight: FontWeight.bold),
      )
    ]);
  }

  Widget numOfProduct() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: const Icon(
            Icons.remove,
            color: Colors.amberAccent,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
          iconSize: 15.sp,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              if (box.numOfProduct.value > 1) {
                box.numOfProduct.value--;
              }
            });
          },
        ),
        Text(
          box.numOfProduct.value.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.add,
            color: Colors.amberAccent,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
          iconSize: 15.sp,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              if (box.numOfProduct.value < 100) {
                box.numOfProduct.value++;
              }
            });
          },
        ),
      ],
    );
  }

  Widget commentForm() {
    return Container(
      child: box.accountInfo.isNotEmpty
          ? Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              initialValue: box.accountInfo.last.firstname +
                  " " +
                  box.accountInfo.last.lastname,
              keyboardType: TextInputType.text,
              obscureText: false,
              enabled: false,
              decoration: const InputDecoration(
                hintText: 'Adınız ve Soyadınız',
                labelText: "Adınız ve Soyadınız",
                prefixIcon: Icon(Icons.supervised_user_circle_sharp),
              ),
            ),
            TextFormField(
              initialValue: "",
              minLines: 5,
              maxLines: 10,
              keyboardType: TextInputType.multiline,
              obscureText: false,
              decoration: const InputDecoration(
                hintText: 'Yorumunuz Yazınız.',
                labelText: "Yorumunuz",
                prefixIcon: Icon(Icons.message_outlined),
              ),
              onSaved: (newValue) => yorumetni = newValue!,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Lütfen Yorumunuzu Yazınız.";
                }
                return null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 1; i <= 5; i++)
                  IconButton(
                      icon: Icon(
                          box.star.value >= i
                              ? Icons.star
                              : Icons.star_outline_outlined,
                          color:
                          box.star.value >= i ? Colors.yellow : Colors.grey),
                      onPressed: () {
                        setState(() {
                          box.star.value = i;
                        });
                      }),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (box.star.value == 0) {
                        comment(context);
                      } else {
                        box.comments(context, box.productId);
                        _formKey.currentState!.reset();
                      }
                    }
                  },
                  child: Text(
                    "Yorum Yap",
                    style:
                    TextStyle(color: Colors.black, fontSize: 10.sp),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _formKey.currentState!.reset();
                      box.star.value = 0;
                    });
                  },
                  child: Text(
                    "Temizle",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 20,
            ),
          ],
        ),
      )
          : Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              "Yorum Yapmak için Kullanıcı Girişi \nYapmanız Gerekmektedir.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget stars(int review) {
    return Row(children: [
      for (int i = 1; i <= 5; i++)
        review != 0
            ? const Icon(Icons.star, color: Colors.yellow)
            : const Icon(Icons.star_border_outlined, color: Colors.grey),
    ]);
  }

}
