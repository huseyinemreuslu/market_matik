import 'dart:async';
import 'package:ecosargidamarket/views/informations/informationPage.dart';
import 'package:ecosargidamarket/views/auth/loginPage.dart';
import 'package:ecosargidamarket/views/categories.dart';
import 'package:ecosargidamarket/views/informations/aboutUs.dart';
import 'package:ecosargidamarket/views/informations/contactUs.dart';
import 'package:ecosargidamarket/views/informations/terms.dart';
import 'package:ecosargidamarket/views/wishList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'controllers/router_controller.dart';
import 'views/auth/forgotPassword.dart';
import 'views/auth/registerPage.dart';
import 'views/informations/sss.dart';
import 'views/subCategories.dart';
import 'views/widget/newDashboardPage.dart';


late Timer timer;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<InformationProvider>(InformationProvider());

  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coşar Gıda Market',
        theme: ThemeData(colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff228B22),
          secondary: const Color(0xff228B22),
        ),fontFamily: "Montserrat"),
        initialRoute: "/",
        routes: {

          "/": (context) => const MainPageState(),
          "/Home": (context) => const DashboardPage(),
          "/Recover": (context) => const DashboardPage(),
          "/Account": (context) => const InformationPage(),
          //"/PasswordChange": (context) => PasswordChangePage(),
          "/Categories": (context) => const CategoriesPage(),
          "/SubCategories": (context) => const SubCategoriesPage(),
          //"/Urunlistesi": (context) => SubCategoriesPage(),
          //"/Search": (context) => SearchPage(),
          "/Cart": (context) => const DashboardPage(),
          /*Profil Sayfaları*/
          //"/ProfilEdit": (context) => ProfilEditPage(veri: veri,),
          /*Adres Sayfaları*/
          //"/AddressPage": (context) => EditAddressPage(),
          "/Terms": (context) => const TermsPage(),
          "/Sss": (context) => const SSSPage(),
          "/ContactUs": (context) => const ContactPage(),
          "/AboutUs": (context) => const AboutPage(),
          "/AddressList": (context) => const DashboardPage(),
          "/InsertAddressPage": (context) => const DashboardPage(),
          "/Wishlist": (context) => const WishlistPage(),
          "/BuyNowPage": (context) => const DashboardPage(),
          "/Login": (context) => const LoginPage(),
          "/Register": (context) => const RegisterPage(),
          "/Forgot": (context) => const ForgotPage(),
          "/bos": (context) => const DashboardPage(),

          /*Product Sayfalari */
        },
      );
    });
  }
}

class MainPageState extends StatefulWidget {
  const MainPageState({Key? key}) : super(key: key);


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPageState> {
  @override
  void initState() {
    super.initState();
    final controller = Get.find<InformationProvider>();

    Future.delayed(const Duration(seconds: 2), () {
      if(controller.box.value.hasData("userID")) {
        controller.userID.value = controller.box.value.read("userID");
        controller.secretKey.value = controller.box.value.read("secret_key");
        controller.isLogin.value = controller.box.value.read("isLogin");
      }
    });
    changePage();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              color: Colors.black12,
              child: Image.asset(
                "assets/images/logo.png",
                fit: BoxFit.fill,
              )),
        ),
      ),
    );
  }

  Future changePage() async {
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacementNamed(context, '/Home');
    });

  }

}
