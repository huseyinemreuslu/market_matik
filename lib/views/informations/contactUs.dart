import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';


bool isName = false;
bool isText = false;
bool isTelephone = false;
bool isEmail = false;

String nameError = "Lütfen geçerli bir isim giriniz";
String textError = "Lütfen 30 karakter veya daha fazla girin";
String telephoneError = "Lütfen geçerli bir telefon giriniz";
String emailError = "Lütfen geçerli bir e-posta giriniz";


class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}


class _ContactPageState extends State<ContactPage> {

  final box = Get.find<InformationProvider>();

  String telephone = "", fullname = "", subject = "", email = "";
  String result = "E-posta gönder";


  @override
  Widget build(BuildContext context) {
    int bottomSelectedIndex = 3;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ege Coşar Gıda Market",style: TextStyle(
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
                            Colors.green,
                            Colors.greenAccent,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .2),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                            text: 'Bize Ulaşın',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            )),
                      ),
                      const SizedBox(height: 50),
                      Padding(padding: const EdgeInsets.fromLTRB(40, 0, 50, 0),child: Column(
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const Text(
                                  "İsim ve Soyisim",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextField(
                                  obscureText: false,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      filled: true),
                                  onChanged: (text) {
                                    setState(() {
                                      fullname = text;
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
                                        telephone = text;
                                      });
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        fillColor: Colors.white,
                                        errorText: isTelephone ? telephoneError : null,
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
                                        email = text;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      fillColor: Colors.white,
                                      filled: true,
                                      errorText: isEmail ? emailError : null,

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
                                  "Konu",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                    height: 5 * 24.0,
                                    child: TextField(
                                      onChanged: (text) {
                                        setState(() {
                                          isText = false;
                                          subject = text;
                                        });
                                      },
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Mesajınız",
                                        errorText: isText ? textError : null,
                                        fillColor: Colors.white,
                                        filled: true,
                                      ),
                                    )),

                              ],
                            ),
                          ),
                        ],
                      )),

                      Padding(padding: const EdgeInsets.fromLTRB(40, 10, 50, 0),child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if(fullname.length < 3) {
                              isName = true;
                            } if(telephone.length < 10) {
                              isTelephone = true;
                            } if(!email.isEmail || email.isEmpty) {
                              isEmail = true;
                            } if(subject.length<30) {
                              isText = true;
                            }
                            if(!isName || !isTelephone|| !isEmail|| !isText) {
                              debugPrint("Başarıyla gönderildi.");
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
                          child: Text(
                            result,
                            style: const TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )),

                      const SizedBox(height: 20),
                      Padding(padding: const EdgeInsets.all(8),child: Card(
                        child: SizedBox(child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [
                          const Padding(padding:EdgeInsets.all(8),child:Text("İLETİŞİM", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold))),
                          const SizedBox(height: 10),


                          Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                            const Padding(padding: EdgeInsets.all(8),child: Icon(Icons.support_agent_rounded,size: 62)),
                            const SizedBox(width: 10),
                            InkWell(child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: const [
                              Text("7/24 Ücretsiz Destek",style: TextStyle(color: Colors.black,fontSize: 18)),
                              SizedBox(height: 20),
                              Text("05465506779",style: TextStyle(color: Colors.green,fontSize: 16))
                            ]),onTap: () {
                              _launchURL();
                            })
                          ]),
                          const SizedBox(height: 10),
                          const Padding(padding: EdgeInsets.all(8),child: Text("Soma / Manisa",style: TextStyle(color: Colors.black,fontSize: 16))),
                          InkWell(onTap: () {
                            _sendEmail();
                          },child: const Padding(padding: EdgeInsets.all(8),child: Text("satis@cosarorganikmarket.com",style: TextStyle(color: Colors.green,fontSize: 16))))

                        ])),
                      ))

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

  _launchURL() async {
    const url = 'https://api.whatsapp.com/send?phone=905465506779';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _sendEmail() async {

    final Email email = Email(
      body: '',
      subject: 'Destek',
      recipients: ['satis@cosarorganikmarket.com'],
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }


}



