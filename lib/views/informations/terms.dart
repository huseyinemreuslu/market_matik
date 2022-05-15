import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


final controller = Get.find<InformationProvider>();

class TermsPage extends StatefulWidget {
  const TermsPage({Key? key}) : super(key: key);

  @override
  _TermsPage createState() => _TermsPage();
}


final box = Get.find<InformationProvider>();
class _TermsPage extends State<TermsPage> {
  String text = "EGE COŞAR’da dilerseniz kredi kartı ile dilerseniz havale-eft ile ve dilerseniz kapıda nakit – kredi kartıyla çok kolay sipariş oluşturup alışveriş yapabilirsiniz.";
  String text1 = "Seçtiğiniz ürünleri sepete ekledikten sonra sepet ödeme kısmına tıklayıp ödeme seçeneklerini seçip siparişinizi tamamlayabilirsiniz. Kredi kartı bilgileriniz kesinlikle sistemimizde tutulmamaktadır. Kredi kartı aracılığı ile gerçekleştirilen ödemeler BDDK lisanslı ve dünya Standartlarındaki PCI-DSS güvenlik sertifikasına sahip İyzico E-Ticaret sistemi aracılığı ile online olarak gerçekleştirilmektedir. Sistem herhangi bir sorun nedeni ile işlemi gerçekleştiremiyorsa ödeme sayfası ekranında bilgilendirileceksiniz. Havale - eft  ödeme  yapacaksanız banka hesap numaralarımız bölümünde bulunan hesap bilgilerimizi kullanabilirsiniz.";
  String text2 = "Ödemeniz hesabımıza geçtiğinde siparişiniz işleme alınacaktır.";
  String text3 = "Verilen siparişler ortalama 1 ila 5 gün içerisinde hazırlanıp kargoya verilmektedir. Bazı olağan dışı durumlarda bu süre değişiklik gösterebilmektedir.";
  String text4 = "Tüm siparişleriniz anlaşmalı olduğumuz ARAS  ile gönderilemektedir. Sipariş aşamasında belirttiğiniz adreste, herhangi bir hata gerçekleştiğinde yada kargo teslimatı yapılamadığı durumlarda   siparişiniz ile ilgili sizlerle iletişime geçilmektedir. Teslimatın zamanında ve sorunsuz olarak gerçekleşmesi konusuda siz müşterilerimize karşı sorumluluğumuz bulunmaktadır.";
  String text5 = "EGE COŞAR olarak güvenliğe ve müşteri memnuniyetine azami derecede önem veriyoruz. Siparişleriniz her yönden güvence altındadır. Güvenle sistemimizden sipariş oluşturabilirsiniz.";
  String text6 = " Tüm ürünlerimiz tarafına özel olarak ambalajlanıp gönderilmektedir. Sizlere doğa tadında ve saflığında ürünler sunmak gibi bir misyonumuz vardır. İade gelen ürünler öncelikle EGE COŞAR kalite kontrol ekibi tarafından incelenir ve şartlar uygunsa iade işlemi başlatılır. 10 iş günü içinde iade ettiğiniz ürünün ücreti tarafınıza iade edilmektedir.İade ettiğiniz ürünün iadesi kontrol ekibimiz tarafından onaylandıktan sonra iade ödemeniz için sizinle irtibata geçilecektir.";
  String text7 = "EGE COŞAR bir üretici ve/veya aracı satış yapan bir sitedir. Gelen tüm siparişler EGE COŞAR sitesi üzerinden üretici ve/veya aracı firmalara iletilerek sipariş hazırlanmaya başlanır takip edilir ve teslimatları sağlanır. Sitemizden oluşturulan tüm siparişler tedarikçi / üretici ile iletişime geçilerek anlık olarak taze taze hazırlanır.";
  String text8 = "EGE COŞAR stoksuz çalışan ve anlık olarak üreten bir sistemde çalışmaktadır. Gelen siparişler üreticiye gönderilir ve takibi yapılır üreticinin ürünü zamanında teslim edememesi veya herhangi bir aksilik durumunda EGE COŞAR müşteri ile irtibata geçer ve söz konusu ürün ile alakalı bilgi verir. Müşterinin arzusuna göre ürün satışı ya iptal edilir yada yerine müşterinin istediği başka bir ürün gönderilir.";
  String text9 = "Gelen siparişlerin üreticiye gönderilerek üretilmesi ve kargo hazır hale gelmesi 1 ile 6 gün arasında sürebilmektedir.";
  String text10 = "Ürünlerin üretici tarafından tedarik edilememesi veya mevsim veya hava şartları nedeniyle teslim edilemeyen ürünler hakkında EGE COŞAR müşteriyi bilgilendirmekte ve müşterinin ödemiş olduğu tutar 1 Hafta içerisinde hesabına iade edilmektedir. Bu gibi durumlarda EGE COŞAR olarak ürünleri teslim etmeme hakkımız bulunmaktadır.";
  String title = "ŞARTLAR VE KOŞULLAR";
  String title1 = "TESLİMAT BİLGİLERİ & İADE KOŞULLARI";


  var list = [];
  var list2 = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      list = [title,text,text1,text2,text3,text4,text5,text6,title1,text7,text8,text9,text10];

    });
  }

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
                            text: 'Şartlar & Koşullar',
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
                      Container(color: Colors.white,height:58.h,child: ListView.builder(shrinkWrap: true,itemCount: list.length,itemBuilder: (context,i){
                        return ListTile(title: Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),child: (i != 0 && i != 8) ? Text((i).toString()+")") : null),subtitle: (i == 0 || i == 8) ? Text(list[i],style: const TextStyle(fontWeight: FontWeight.bold)) : Text(list[i]));
                      }))

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

