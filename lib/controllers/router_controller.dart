import 'dart:async';
import 'dart:convert';
import 'package:ecosargidamarket/models/cart.dart';
import 'package:ecosargidamarket/models/categories.dart';
import 'package:ecosargidamarket/models/detail.dart';
import 'package:ecosargidamarket/models/product.dart';
import 'package:ecosargidamarket/models/option.dart';
import 'package:ecosargidamarket/models/review.dart';
import 'package:ecosargidamarket/models/slide.dart';
import 'package:ecosargidamarket/models/user.dart';
import 'package:ecosargidamarket/models/wishlist.dart';
import 'package:ecosargidamarket/views/alerts.dart';
import 'package:flutter/material.dart';
import 'package:future_progress_dialog/future_progress_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class InformationProvider extends GetxController {
  final box = GetStorage('cosargidamarket').obs;
  final apiUrl = "api.melihkara.com.tr";
  final networkStatus = 1.obs;

  final double boottomnavselectedFontSize = 12;
  final Color boottomnavbackgroundColor = const Color(0xff228B22);
  final Color boottomnavunselectedItemColor = Colors.white;
  final double boottomnavunselectedFontSize = 10;
  final Color boottomnavselectedItemColor = Colors.black;
  final double boottomnaviconSize = 3;

  /* Product */
  String? productId;
  final tabIndex = 0.obs;
  final star = 0.obs;
  final error = "".obs;
  final productPriceDiscountInformation = "".obs;
  final numOfProduct = 0.obs;
  final wishList = [].obs;
  final accountInfo = [].obs;
  final textBox = "Ara".obs;
  final acc = [].obs;
  final user = User().obs;
  final productDetail = [].obs;
  final productOption = [].obs;
  final productComment = [].obs;
  Option? productPrice;
  final cart = [].obs;
  final countryList = [].obs;
  final cityList = [].obs;
  final accountAddress = [].obs;
  final addressList = [].obs;
  /* Dashboard */
  final categories = [].obs;
  List<Categories> categoryList = [];
  final subCategoryList = [].obs;
  final slide = [].obs;
  final productList = [].obs;
  final discountProductList = [].obs;
  final specialProductList = [].obs;
  final productListWCategory = [].obs;
  final cartCount = 0.obs;
  final isSearch = false.obs;
  final searchWord = "".obs;
  final subCategoryId = "".obs;
  final subCategoryName = "".obs;
  final userID = "".obs;
  final secretKey = "".obs;
  final isLogin = false.obs;
  final isUnExpected = false.obs;
  final isAddedCart = false.obs;
  String title = "Coşar Gıda Market";

  /* ERROR TEXTS */
  String nameError = "Lütfen geçerli bir isim giriniz";
  String lastNameError = "Lütfen geçerli bir soyisim giriniz";
  String telephoneError = "Lütfen geçerli bir telefon giriniz";
  String emailError = "Lütfen geçerli bir e-posta giriniz";
  String passwordError = "Şifreniz 6 haneli veya daha fazla olmalıdır.";

  /* AUTH TEXTS */
  String authRegister = "Girdiğiniz E-posta adresi zaten kayıtlı. Eğer E-posta adresinize gelen iletiyi onaylamadıysanız lütfen kaydı tamamlamak için gelen linke tıklayınız. İletiyi almadığınızı düşünüyorsanız bizimle iletişime geçin.";
  String authRegisterSuccess = "Hesabınız başarılı şekilde oluşturuldu. Lütfen kaydı tamamlamak için E-posta adresinize gelen linke tıklayın";
  String unExceptedError = "Beklenmedik bir hata oluştu";
  String authLogin = "E-posta ve / veya şifreniz hatalı.";


  List<BottomNavigationBarItem> subBarList() {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Anasayfa',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favorilerim',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket_outlined),
        label: 'Sepetim',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle_rounded),
        label: 'Hesabım',
      ),
    ];
  }

  void permissions() {
    Permission.storage.request().isGranted.then((isAllowed) {
      if (!isAllowed) {
        Permission.storage.request();
      }
    });
  }

  changePage(BuildContext context, int index) {

    if (index == 3) {

      ModalRoute.of(context)!.settings.name == "/Account"
      // ignore: unnecessary_statements
          ? null
          : Navigator.pushReplacementNamed(context, '/Account');

    } else if (index == 0) {
      ModalRoute.of(context)!.settings.name == "/Home"
      // ignore: unnecessary_statements
          ? null
          : Navigator.pushReplacementNamed(context, '/Home');
    } else if (index == 1) {
      if(isLogin.value == true) {
        ModalRoute.of(context)!.settings.name == "/Wishlist"
        // ignore: unnecessary_statements
            ? null
            : Navigator.pushReplacementNamed(context, '/Wishlist');
      } else {
        userLoginAlert(context);
      }

    } else if (index == 2) {
      if(isLogin.value == true) {
        ModalRoute.of(context)!.settings.name == "/Cart"
        // ignore: unnecessary_statements
            ? null
            : Navigator.pushReplacementNamed(context, '/Cart');
      } else {
        userLoginAlert(context);
      }

    }
  }

  void loading(BuildContext context, Future<dynamic> future) async {
    showDialog(
      context: context,
      builder: (context) =>
          FutureProgressDialog(future, message: const Text('Yükleniyor')),
    );
  }

  Widget loadingR(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }

  Widget loadingWidget(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(100.0),
        decoration: const BoxDecoration(
          color: Colors.orange,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            bottomRight: Radius.circular(25.0),
          ),
        ),
        child: Column(
          children: [
            Container(
              color: Colors.green,
              child: Image.asset("assets/images/logo.png"),
            ),
            const TextButton(
                onPressed: null,
                child: Text("Yükleniyor",
                    style: TextStyle(color: Colors.white)))
          ],
        ));
  }
  final completer = Completer();

  Future<void> multiProcess(context) async {
    isUnExpected.value = false;
    categoryList.clear();
    slide.clear();
    discountProductList.clear();
    specialProductList.clear();
    loading(context, getCategories(context).catchError((e){
      isUnExpected.value = true;
      throw e;
    }).then((value) {
      if(value.isNotEmpty) categoryList = value;
    }).whenComplete((){
      getSlides(context).catchError((e){
        isUnExpected.value = true;
        throw e;
      }).then((value) {
        slide.clear();
        if(value.isNotEmpty) slide.value = value;
      }).whenComplete((){
        getDiscountProductList(context, "true", "0", "10").catchError((e){
          isUnExpected.value = true;
          throw e;
        }).then((value){
          if(value.isNotEmpty) discountProductList.value = value;
        }).whenComplete((){
          getSpecialProductList(context, "true", "0", "10","").catchError((e){
            isUnExpected.value = true;
            throw e;
          }).then((value){

            if(value.isNotEmpty) specialProductList.value = value;
          });
        });
      });
    }));

    if(isLogin.value == true) {
      await getWishlist(context,"","","").then((value) {
        wishList.value = value;

        for (var item in discountProductList) {
          for (var element in wishList) {
            if(item.productId == element.productId) {
              item.product.isWished = true;
            }
          }
        }
        for (var item in specialProductList) {
          for (var element in wishList) {
            if(item.productId == element.productId) {
              item.product.isWished = true;
            }
          }
        }
      });

      accountInfo.isNotEmpty ? getCartInformation(context) : null;
    }

    if(!completer.isCompleted) {
      String text = "Coşar Gıda Market'e Hoşgeldiniz";
      textBox.value = "";
      Future.delayed(const Duration(seconds: 2), () {
        for(var i=0; i<text.length;i++) {
          Future.delayed(Duration(milliseconds: i*270), () {
            textBox.value = textBox.value+text[i];
          });
        }
        Future.delayed(const Duration(seconds: 10),(){
          for(var i=0; i<=text.length;i++) {
            Future.delayed(Duration(milliseconds: 100*i), () {
              textBox.value = text.substring(i);
            });
          }
        });
        Future.delayed(const Duration(seconds: 14),(){
          textBox.value = "Ara";
        });
        completer.complete();
      });
    }
    // ignore: unnecessary_statements
    update();
  }

/************************************PRIVATE************************************/

/// USER **/

  Future<List<User>> getAccount(context) async {
    var hosturl = Uri.https(apiUrl, '/api.php', {});
    var response = await http.post(hosturl, body: {
      'Parametre': 'getAccountInfo',
      'userID': userID.value,
      'secret_key': secretKey.value,
    }).timeout(const Duration(seconds: 10));
    if(response.statusCode == 200) {

      if(response.body != "0") {
        return (json.decode(response.body) as List)
            .map((e) => User.fromJson(e)).toList() ;
      }

    } else {
      Future.error(errorAlert(context));
    }
    return [];
  }

  Future<bool> createWishList(context ,String productId) async {
    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http.post(hosturl, body: {
      'Parametre': 'alistesiekle',
      'userID': userID.value,
      'product_id': productId,
      'secret_key': secretKey.value
    }).timeout(const Duration(seconds: 10));
    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body != "0") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Favorilerinize eklendi.'),
            action: SnackBarAction(
              label: 'Favorilerim',
              onPressed: () {
                Navigator.pushNamed(context, "/Wishlist");
              },
            ),
          ),
        );

        return true;
      } else {
        return false;
      }
    } else {
      Future.error(errorAlert(context));
      return false;
    }
  }

  Future<List<Wishlist>> getWishlist(context,from1,from2,isLimit) async {
    isUnExpected.value = false;
    if(isLogin.value == true) {
      var hosturl = Uri.https(apiUrl, '/api.php');
      final gelenpostverisi = await http.post(hosturl, body: {
        'Parametre': 'alistesi',
        'userID': userID.value,
        'secret_key': secretKey.value,
        'isLimit': isLimit,
        'from1':from1,
        'from2':from2
      }).timeout(const Duration(seconds: 10)).catchError((e){
        isUnExpected.value = true;
      });
      if (gelenpostverisi.statusCode == 200) {
        if (gelenpostverisi.body != "0") {

          return (json.decode(gelenpostverisi.body) as List)
              .map((e) => Wishlist.fromJson(e))
              .toList();
        }
      } else {
        isUnExpected.value = true;
      }
    }
    return [];
  }

  Future<bool> deleteWishProduct(context ,String productId) async {
    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http.post(hosturl, body: {
      'Parametre': 'alistesil',
      'product_id': productId,
      'userID': userID.value,
      'secret_key': secretKey.value
    }).timeout(const Duration(seconds: 10));
    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body != "0") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Favorilerinizden silindi.'),
            action: SnackBarAction(
              label: 'Favorilerim',
              onPressed: () {
                Navigator.pushNamed(context, "/Wishlist");
              },
            ),
          ),
        );
        update();
        return false;
      } else {
        return true;
      }
    } else {
      Future.error(errorAlert(context));
      return true;
    }
  }

  Future<bool> addCart(context,productId,quantity,option) async {
    isAddedCart.value = false;
    isUnExpected.value = false;
    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http.post(hosturl, body: {
      'Parametre': 'addCart',
      'userID': userID.value,
      'secret_key': secretKey.value,
      'product_id':productId,
      'quantity':quantity,
      'option':option,

    }).timeout(const Duration(seconds: 10)).catchError((e){
      isUnExpected.value = true;
    });
    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body == "1") {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  Future<void> getCartInformation(context) async {
    cart.clear();
    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http.post(hosturl, body: {
      'Parametre': 'cartlist',
      'userID': userID.value,
      'secret_key': secretKey.value,

    }).timeout(const Duration(seconds: 10));
    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body != "0") {
        cart.value = (json.decode(gelenpostverisi.body) as List)
            .map((e) => Cart.fromJson(e))
            .toList();
      }
    } else {
      Future.error(errorAlert(context));
    }
  }

  Future<String> login(context, String email, String password) async {
    var hosturl = Uri.https(apiUrl, '/api.php', {});
    var response =  await http.post(hosturl, body: {
      'Parametre': 'Login',
      'Email': email.toString(),
      'Password': password.toString(),
    }).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      Future.error(errorAlert(context));
    }
    return "";
  }

  Future<String> register(context, String email,String firstname, String lastname, String telephone, String password) async {
    var hosturl = Uri.https(apiUrl, '/api.php', {});
    var response =  await http.post(hosturl, body: {
      'Parametre': 'Register',
      'firstname': firstname,
      'lastname': lastname,
      'email' : email,
      'telephone': telephone,
      'password': password,
    }).timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      Future.error(errorAlert(context));
    }
    return "-1";
  }

/************************************PUBLIC************************************/


  /// PRODUCT **/

  Future<List<Product>> getSpecialProductList(context, isRandom, from1, from2,order) async {
    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http.post(hosturl, body: {
      'Parametre': 'specialProductList',
      'isRandom':isRandom,
      'from1':from1,
      'from2':from2,
      'order':order
    }).timeout(const Duration(seconds: 10));
    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body != "0") {
        return (json.decode(gelenpostverisi.body) as List)
            .map((e) => Product.fromJson(e))
            .toList();
      }
    } else {
      Future.error(errorAlert(context));
    }
    return [];
  }

  Future<List<Product>> getDiscountProductList(context, isRandom, from1, from2) async {
    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http.post(hosturl, body: {
      'Parametre': 'discountProductList',
      'isRandom':isRandom,
      'from1':from1,
      'from2':from2

    }).timeout(const Duration(seconds: 10));
    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body != "0") {
        return (json.decode(gelenpostverisi.body) as List)
            .map((e) => Product.fromJson(e))
            .toList();
      }
    } else {
      Future.error(errorAlert(context));
    }
    return [];
  }

  void getDiscountProductInformation(String id) {
    try {
      String x = discountProductList
          .firstWhere((element) => element.productId == id)
          .specialPrice
          .substring(
          0,
          discountProductList
              .firstWhere((element) => element.productId == id)
              .specialPrice
              .length -
              2);

      productPriceDiscountInformation.value = x + " ₺";
    } catch (e) {
      String y = discountProductList
          .firstWhere((element) => element.productId == id)
          .specialPrice
          .substring(
          0,
          discountProductList
              .firstWhere((element) => element.productId == id)
              .specialPrice
              .length -
              2);
      productPriceDiscountInformation.value =  y + " ₺";
    }
    update();
  }

  Future<List<Product>> getProductWithCategoryList(context ,String id,from1,from2,order) async {
    isUnExpected.value = false;
    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http.post(hosturl,
        body: {'Parametre': 'catproductlist', 'CatID': id,'from1':from1,'from2':from2,'order':order}).timeout(const Duration(seconds: 10)).catchError((e) {
        isUnExpected.value = true;
    });

    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body != "0") {
        return (json.decode(gelenpostverisi.body) as List)
            .map((e) => Product.fromJson(e))
            .toList();
      }
    } else {
      Future.error(errorAlert(context));
    }
    update();
    return [];
  }

  Future<List<Detail>?> getProductDetail(context ,String productId) async {
    var hosturl = Uri.https(apiUrl, '/api.php',
        {'Parametre': 'productdetails', "product_id": productId});
    final gelenpostverisi = await http.post(hosturl, body: {
      'Parametre': 'productdetails',
      "product_id": productId
    }).timeout(const Duration(seconds: 10));
    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body != "0") {
        return (json.decode(gelenpostverisi.body) as List)
            .map((e) => Detail.fromJson(e))
            .toList();

      }
    } else {
      Future.error(errorAlert(context));
    }
    return [];
  }

  Future<List<Slide>> getSlides(context) async {
    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http
        .post(hosturl, body: {'Parametre': 'slidelist'}).timeout(const Duration(seconds: 10));
    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body != "0") {

        return (json.decode(gelenpostverisi.body) as List)
            .map((e) => Slide.fromJson(e))
            .toList();

      }
    } else {
      Future.error(errorAlert(context));
    }
    return [];
  }

  Future<List<Review>> comments(context, productId) async {
    productComment.clear();
    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http.post(hosturl, body: {
      'Parametre': 'yorumlar',
      'product_id': productId
    }).timeout(const Duration(seconds: 10));
    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body != "0") {
        return (json.decode(gelenpostverisi.body) as List)
            .map((e) => Review.fromJson(e))
            .toList();
      }
    } else {
      Future.error(errorAlert(context));
    }
    return [];
  }

  Future<List<Option>> getOptions(context) async {
    productOption.clear();

    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http.post(hosturl, body: {
      'Parametre': 'getProductOptions',
    }).timeout(const Duration(seconds: 10));
    if (gelenpostverisi.statusCode == 200) {
      debugPrint(gelenpostverisi.body);
      if (gelenpostverisi.body != "0") {
        return (json.decode(gelenpostverisi.body) as List)
            .map((e) => Option.fromJson(e))
            .toList();
      }
    } else {
      Future.error(errorAlert(context));
    }
    return [];
  }

  Future<List> getSubCategory(String id,context) async {

    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http.post(hosturl, body: {
      'Parametre': 'subcategorieslist',
      'ParentID': id
    }).timeout(const Duration(seconds: 10));
    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body != "false") {
        if (gelenpostverisi.body != "0") {
            return (json.decode(gelenpostverisi.body) as List)
                .map((e) => Product.fromJson(e))
                .toList();
        }
      }
    } else {
      Future.error(errorAlert(context));
    }
    return [];
  }

  Future<List<Categories>> getCategories(context) async {
    var hosturl = Uri.https(apiUrl, '/api.php');
    final gelenpostverisi = await http
        .post(hosturl, body: {"Parametre": "categorieslist"}).timeout(const Duration(seconds: 10));

    if (gelenpostverisi.statusCode == 200) {
      if (gelenpostverisi.body != "0") {

        return (json.decode(gelenpostverisi.body) as List)
            .map((e) => Categories.fromJson(e))
            .toList();
      }
    } else {
      Future.error(errorAlert(context));

    }
    return [];
  }

}
