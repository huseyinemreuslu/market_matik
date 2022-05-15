import 'package:ecosargidamarket/views/alerts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:ecosargidamarket/controllers/router_controller.dart';
import '../menus.dart';



class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPage createState() => _InformationPage();
}


class _InformationPage extends State<InformationPage> {


  @override
  Widget build(BuildContext context) {
    int bottomSelectedIndex = 3;
    return GetX<InformationProvider>(
        init: InformationProvider(),
    builder: (box) => Scaffold(
          appBar: AppBar(
            title: Text(box.title,style: const TextStyle(
              fontStyle: FontStyle.italic,
            )),
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
          body: Container(
            padding: const EdgeInsets.all(0),
            child: Container(padding: const EdgeInsets.all(8),child: ListView(
            children: [
              InkWell(onTap: (){
                if(box.isLogin.isFalse) {
                  userLoginAlert(context);
                }
              },child: SizedBox(height: 50,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Row(children: const [
                  Icon(Icons.card_giftcard,size: 26,color: Colors.black),
                  SizedBox(width: 20),
                  Text("Siparişlerim",style: TextStyle(fontSize: 16,color: Colors.black))]),
                const Icon(Icons.chevron_right,color: Colors.black)
              ])))
              ,
              InkWell(child: SizedBox(height: 50,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Row(children: const [
                  Icon(Icons.account_box_outlined,size: 26,color: Colors.black),
                  SizedBox(width: 20),
                  Text("Hesap Bilgilerim",style: TextStyle(fontSize: 16,color: Colors.black))]),
                const Icon(Icons.chevron_right,color: Colors.black)
              ])),onTap: () {
                if(box.isLogin.isFalse) {
                  userLoginAlert(context);
                }
              }),
              InkWell(child: SizedBox(height: 50,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Row(children: const [
                  Icon(Icons.mail_outline,size: 26,color: Colors.black),
                  SizedBox(width: 20),
                  Text("Bize Ulaşın",style: TextStyle(fontSize: 16,color: Colors.black))]),
                const Icon(Icons.chevron_right,color: Colors.black)
              ])),onTap: ()=>Navigator.pushNamed(context, "/ContactUs")),
              InkWell(child: SizedBox(height: 50,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Row(children: const [
                  Icon(Icons.assignment_late_outlined,size: 26,color: Colors.black),
                  SizedBox(width: 20),
                  Text("Şartlar & Koşullar",style: TextStyle(fontSize: 16,color: Colors.black))]),
                const Icon(Icons.chevron_right,color: Colors.black)
              ])),onTap: ()=>Navigator.pushNamed(context, "/Terms")),
              InkWell(child: SizedBox(height: 50,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Row(children: const [
                  Icon(Icons.search_off_rounded,size: 26,color: Colors.black),
                  SizedBox(width: 20),
                  Text("Sıkça Sorulan Sorular",style: TextStyle(fontSize: 16,color: Colors.black))]),
                const Icon(Icons.chevron_right,color: Colors.black)
              ])),onTap: ()=>Navigator.pushNamed(context, "/Sss")),
              InkWell(child: SizedBox(height: 50,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Row(children: const [
                  Icon(Icons.info_outline,size: 26,color: Colors.black),
                  SizedBox(width: 20),
                  Text("Hakkımızda",style: TextStyle(fontSize: 16,color: Colors.black))]),
                const Icon(Icons.chevron_right,color: Colors.black)
              ])), onTap: ()=>Navigator.pushNamed(context, "/AboutUs")),
              if(box.isLogin.isTrue) InkWell(child: InkWell(child: SizedBox(height: 50,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                Row(children: [
                  const Icon(Icons.logout,size: 26,color: Colors.red),
                  const SizedBox(width: 12),
                  TextButton( onPressed: () {
                    userLogoutAlert(context, box);
                  },
                      child: const Text("Çıkış yap",style: TextStyle(fontSize: 16,color: Colors.red)))
                ]),
                const Icon(Icons.chevron_right,color: Colors.red)
              ])))),
              const Padding(padding: EdgeInsets.all(20)),
              if(box.isLogin.isFalse) Card(
                child: SizedBox(child: Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                  const Text("Göz atmaktan daha fazlasına mı ihtiyacınız var? ", style: TextStyle(fontSize: 14)),
                  const Text("Aramıza katılın", style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 10),
                  InkWell(child: Container(
                    width: 200,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
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
                          Colors.green,
                          Colors.green
                        ],
                      ),
                    ),
                    child: const Text(
                      "Kayıt ol",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),onTap: () {
                    Navigator.pushNamed(context, "/Register");
                  }),
                  const SizedBox(height: 20),

                  Row(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
                    const Text("Zaten hesabınız var mı?", style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 10),
                    InkWell(child: const Text("Giriş yap", style: TextStyle(fontSize: 14,color: Colors.green)),onTap: () {
                      Navigator.pushNamed(context, "/Login");
                    })
                  ]),
                  const SizedBox(height: 10),

                ])),
              ),
              Padding(padding: const EdgeInsets.all(50),child: Column(children: const [
                Center(child: Text("© Coşar Gıda Market Tüm Hakkları Saklıdır.",style: TextStyle(fontSize: 12))),
                SizedBox(height: 20),
                Center(child: Text("Mobil v.1.2",style: TextStyle(fontSize: 14)))
              ]))
            ],
          )),

          )
      ));
  }
}

