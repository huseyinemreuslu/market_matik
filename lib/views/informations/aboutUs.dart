import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


final controller = Get.find<InformationProvider>();

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPage createState() => _AboutPage();
}




final box = Get.find<InformationProvider>();
class _AboutPage extends State<AboutPage> {

  String aboutUsTitle = "Hakkımızda";
  String aboutUsSubTitle2 = "Coşar Zeytincilik Sunar";
  String aboutUsSubTitle1 = "ŞİRKETİMİZ, COŞAR ZEYTİNCİLİK SAN. TİC. LTD. ŞTİ. BİR AİLE ŞİRKETİDİR.";
  String aboutUsText = "Kuruluş amacımız bir barış ve dostluk sembolü olan aynı zamanda bütün semavi dinlerce kutsal sayılan bu güzel ürünü hijyenik şartlarda müşteri memnuniyeti odaklı olarak tüm Türkiye ve dış pazarlardaki tüketicilerin beğenisine sunmaktır.Firmamız zeytin üretimine 2002 yılında Soma da başlamıştır. Zeytin üretimine ilk olarak EGE TURKUAZ ZEYTİN VE SÜT ÜRÜNLERİ SAN.TİC.LTD.ŞTİ. adı altında başlamış olup artan iş kapasitesi sebebiyle Soma da 4000 mt2 kapalı alana sahip olan yıllık 1500 ton kapasiteli modern zeytin işletmesini kurarak COŞAR ZEYTİNCİLİK olarak faaliyetlerine devam etmektedir. Firmamız EGE TURKUAZ ZEYTİN VE SÜT ÜRÜNLERİ SAN TİC LTD ŞTİ ile aynı çatı altında iki kardeş kuruluştur.Siyah ve yeşil Zeytin üretiminde farklı ihtiyaç ve istekleri göz önünde bulunduran COŞAR ZEYTİNCİLİK bütün, dolgulu, çekirdeği çıkartılmış, dilimli, çizik gibi her türlü zeytin üretimini gerçekleştirmekte olup iç ve dış pazara perakende ve toptan zeytin satışını yapmaktadır.Bu ilke doğrultusunda üretim, işleme, depolama ve pazarlama aşamasında gereken özeni göstermektedir. Kalitenin ancak kendini geliştirerek sağlanacağı düşüncesiyle hareket eden firmamızda; kalite anlayışı en alt çalışandan en üst yöneticiye kadar prensip haline getirilmiştir.Üretimde olduğu gibi sunumda da müşteri ihtiyaçlarına göre hareket eden COŞAR ZEYTİNCİLİK ürünlerini talep doğrultusunda cam kavanoz, teneke, vakumlu ve plastik ambalajlarda sunmaktadır.";
  String bottomText = "Misyonumuz; insan sağlığından direk sorumlu kuruluşlardan olmamızın gerekliliğinden; ekip ruhuna uygun olarak görev bilinciyle çalışıp, günümüz teknolojisini ve tecrübelerimizi birleştirerek sağlıklı, hijyenik ve kaliteli ürünler üretmektir.";
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
              ListView(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: height * .1),
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                              text: 'Hakkımızda',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: '',
                                  style: TextStyle(color: Colors.black, fontSize: 20),
                                ),
                              ]),
                        ),
                        const SizedBox(height: 30),
                        Card(
                            child: SizedBox(child: Padding(padding: const EdgeInsets.all(10), child: Column(children: [

                              Text(aboutUsSubTitle2, style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.bold)),
                              const SizedBox(height: 10),
                              Text(aboutUsSubTitle1, style: TextStyle(fontSize: 10.sp)),
                              const SizedBox(height: 10),
                              Text(aboutUsText, style: TextStyle(fontSize: 10.sp)),


                            ])),
                            )),const SizedBox(height: 30)],
                    ),
                  ),
                ),
                Padding(padding:const EdgeInsets.all(2),child: Card(
                    child: SizedBox(child: Row(children: [
                      SizedBox(child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/logo.png",
                        image: "https://cosarorganikmarket.com/image/catalog/cmsblock/hakkimizda.jpg",
                        height: 80,
                        width: 80,
                      )),
                      SizedBox(width: 2.w),
                      Expanded(child: Column(mainAxisAlignment:MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: [
                        const SizedBox(height: 10),
                        Text("COŞAR ZEYTİNCİLİK SAN TİC LTD.ŞTİ.",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(bottomText),
                        const SizedBox(height: 2),
                        const Text("Zeytin Satışı"),
                        const SizedBox(height: 2),
                        const Text("100% Güvenli alışveriş"),
                        const SizedBox(height: 2),
                        const Text("Siyah Zeytin"),
                        const SizedBox(height: 2),
                        const Text("Gemlik Zeytin"),
                        const SizedBox(height: 2),
                        const Text("Yurtdışı ihracat"),
                      ])),
                    ])
                    )
                ))

              ]),

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

