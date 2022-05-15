import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../alerts.dart';

bool isName = false;
bool isLastName = false;
bool isTelephone = false;
bool isEmail = false;
bool isPassword = false;




class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPage createState() => _RegisterPage();
}

final box = Get.find<InformationProvider>();

class _RegisterPage extends State<RegisterPage> {

  @override
  Widget build(BuildContext context) {
    int bottomSelectedIndex = 3;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(box.title,style: const TextStyle(
            fontStyle: FontStyle.italic,
          ),),
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
          color: const Color(0xfff3f3f4),
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: Transform.rotate(
                  angle: -3.14 / 3.5,
                  child: ClipPath(
                    child: Container(
                      height: MediaQuery.of(context).size.height * .5,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color(0xff228B22),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: 'Kayıt',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: ' Ol',
                                style: TextStyle(color: Colors.black, fontSize: 20),
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const  Text(
                                  "İsim",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                    obscureText: false,
                                    onChanged: (text) {
                                      setState(() {
                                        isName = false;
                                        box.user.value.firstname = text;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        errorText: isName ? box.nameError : null,
                                        filled: true))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Soyisim",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                    obscureText: false,
                                    onChanged: (text) {
                                      setState(() {
                                        isLastName = false;
                                        box.user.value.lastname = text;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        errorText: isLastName ? box.lastNameError : null,
                                        filled: true))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Telefon",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                    obscureText: false,
                                    maxLength: 10,
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) {
                                      setState(() {
                                        isTelephone = false;
                                        box.user.value.telephone = text;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        errorText: isTelephone ? box.telephoneError : null,
                                        filled: true))
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "E-posta",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                    keyboardType: TextInputType.emailAddress,

                                    obscureText: false,
                                    onChanged: (text) {
                                      setState(() {
                                        isEmail = false;
                                        box.user.value.email = text;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      filled: true,
                                      errorText: isEmail ? box.emailError : null,

                                    )
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "Şifre",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      errorText: isPassword ? box.passwordError : null,
                                      filled: true),
                                  onChanged: (text) {
                                    setState(() {
                                      isPassword = false;
                                      box.user.value.password = text;
                                    });
                                  },
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Hesap oluşturarak",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              GestureDetector(onTap:(){
                                Navigator.pushNamed(context, "/Terms");
                              },child: const Text(
                                " Gizlilik Politikamızı",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14,color: Colors.green),
                              )),
                              const Text(
                                " ve ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ],
                          ),
                          Row(
                              children: [
                                GestureDetector(
                                    onTap:(){
                                      Navigator.pushNamed(context, "/Terms");
                                      },
                                    child: const Text(
                                        "Koşullarımızı ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14,color: Colors.green))
                                ),
                                const Text("kabul etmiş olursunuz.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14))
                              ]
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                if((box.user.value.email.isEmpty || !box.user.value.email.isEmail)) {
                                  isEmail = true;
                                } if(box.user.value.firstname.isEmpty || !box.user.value.firstname.isAlphabetOnly) {
                                  isName = true;
                                } if(box.user.value.lastname.isEmpty || !box.user.value.lastname.isAlphabetOnly) {
                                  isLastName = true;
                                } if (box.user.value.telephone.isEmpty || !box.user.value.telephone.isNumericOnly || box.user.value.telephone.length != 10) {
                                  isTelephone = true;
                                } if (box.user.value.password.length < 6) {
                                  isPassword = true;
                                }
                                if(!isEmail && !isName && !isLastName && !isTelephone && !isPassword) {
                                  box.loading(context, box.register(context, box.user.value.email, box.user.value.firstname, box.user.value.lastname, box.user.value.telephone, box.user.value.password).then((value) {
                                    Future.delayed(const Duration(milliseconds: 200), () {
                                      if(value == "0") {
                                        wrong(context,box.authRegister);
                                      } else if(value == "-1") {
                                        wrong(context,box.unExceptedError);
                                      } else {
                                        debugPrint(value);
                                        wrong(context,box.authRegisterSuccess);
                                      }
                                    });
                                  }));
                                }
                              });

                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(25)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: const Offset(2, 4),
                                      blurRadius: 5,
                                      spreadRadius: 2)
                                ],
                                gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.green,
                                    Colors.greenAccent,
                                  ],
                                ),
                              ),
                              child: const Text(
                                'Hesap Oluştur',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/Login");
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              padding: const EdgeInsets.all(1),
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Text(
                                    'Zaten hesabınız var mı?',
                                    style: TextStyle(
                                        fontSize: 13, fontWeight: FontWeight.w600),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                top: 40,
                left: 0,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/Account");
                  },
                  child: Container(
                    color: Colors.green,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
                          child: const Icon(Icons.keyboard_arrow_left,
                              color: Colors.white),
                        ),
                        const Text('Geri',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500,color: Colors.white))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ) ,
        )
    );
  }
}

