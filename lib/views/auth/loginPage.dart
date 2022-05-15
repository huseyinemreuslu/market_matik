import 'dart:convert';
import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../alerts.dart';


bool isEmail = false;
bool isPassword = false;


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {

  final box = Get.find<InformationProvider>();

  String email = "", password = "";
  String result = "Giriş yap";

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (box.isLogin.value == true) {
        Navigator.pushReplacementNamed(context, '/Home');
      }
    });
  }



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
                            text: 'Giriş',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            )),
                      ),
                      const SizedBox(height: 50),
                      Column(
                        children: <Widget>[
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
                                    obscureText: false,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        errorText: isEmail ? box.emailError : null,
                                        filled: true),
                                    onChanged: (text) {
                                      setState(() {
                                        isEmail = false;
                                        email = text;
                                      });

                                    },
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
                                        errorText: isPassword ? box.passwordError : null,
                                        fillColor: Colors.white,
                                        filled: true),
                                    onChanged: (text) {
                                      setState(() {
                                        isPassword = false;
                                        password = text;
                                      });
                                    },

                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if((email.isEmpty || !email.isEmail)) {
                              isEmail = true;
                            } if(password.isEmpty) {
                              isPassword = true;
                            }
                            if(!isEmail && !isPassword) {
                              box.loading(context, box.login(context, email, password).then((value) {

                                if(value != "0" && value != "-1" && value != "-2"){
                                  box.isLogin.value = true;
                                  box.box.value.write("isLogin", true);
                                  box.box.value.write("userID", json.decode(value)["userID"]);
                                  box.box.value.write("secret_key", json.decode(value)["secret_key"]);
                                  box.userID.value = json.decode(value)["userID"];
                                  box.secretKey.value = json.decode(value)["secret_key"];
                                  box.getCartInformation(context);
                                  box.update();
                                  Future.delayed(const Duration(seconds: 1), () {
                                    Navigator.pushReplacementNamed(context, '/Home');
                                  });
                                } else if(value == "0"){
                                  Future.delayed(const Duration(milliseconds: 100), () {
                                    wrong(context,box.authLogin);
                                  });
                                }
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
                                Color(0xff228B22),
                                Colors.green,
                              ],
                            ),
                          ),
                          child: Text(
                            result,
                            style: const TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/Forgot");
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.all(1),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Şifrenizi mi unuttunuz?',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),

                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/Register");
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          padding: const EdgeInsets.all(1),
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text(
                                'Henüz hesabınız yok mu?',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
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
          ),
        ));
  }
}



