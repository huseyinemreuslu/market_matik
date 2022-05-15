import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


final controller = Get.find<InformationProvider>();

class SSSPage extends StatefulWidget {
  const SSSPage({Key? key}) : super(key: key);

  @override
  _SSSPage createState() => _SSSPage();
}


final box = Get.find<InformationProvider>();
class _SSSPage extends State<SSSPage> {
  final text = {"title":"SİPARİŞLERİMİZ NASIL HAZIRLANIYOR?","text":"Hiçbir ürünümüzde stoklu çalışma yapmıyoruz. Bu nedenle siparişten sonraki üç gün içerisinde siparişinize göre üretici ile iletişime geçilip ürün hazırlanıyor özenle paketlendikten sonra tarafınıza sağlam bir şekilde gönderiliyor. Ayrıca sipariş ve sonrasında ürünü teslim alıncaya kadar arkadaşlarımız ürünle ilgili detaylı olarak müşterilerimizi bilgilendirmekte ve siparişlerinin hangi aşamada olduğu konusunda irtibat halinde olmaktadırlar."};
  final text1 = {"title": "SİPARİŞLERİMİZ NEREDE HAZIRLANIYOR?","text":"Öncelikler gelen siparişler üretici ile irtibata geçilip hazırlanıyor ve depomuza gönderiliyor. Ardından kalite kontrol ekibimiz gelen ürünün lezzet gramaj ve son kontrollerini yaptıktan sonra paketleme servisinde ürün özenle paketlenip tarafınıza kargo yapılıyor."};
  final text2 = {"title": "EGE COŞAR GÜVENLİ Mİ?","text":"Firma olarak kişisel bilgileri 3. Şahıslarla kesinlikle paylaşmıyoruz. Bu konuda çok hassas bir firmayız. Ayrıca kişisel verilerinizin 6698 sayılı Kişisel Verilerin Korunması kanununa uygun olarak işlenerek muhafaza edilmesine büyük önem veriyoruz."};
  final text3 = {"title": "HANGİ KARGO İLE ÇALIŞIYORSUNUZ?","text":"Ege Coşar olarak sadece Aras Kargo ile güvenli bir şekilde gönderim sağlıyoruz."};
  final text4 = {"title": "KARGO ÜCRETİ KARŞILANIYOR MU?","text":"Sitemizden yapacağınız tüm alışverişlerinizde kargo ücreti tarafımıza aittir. Tüm ürünlerimiz ücretsiz kargo ile tarafınıza kadar gönderilmektedir."};
  final text5 = {"title": "TÜM TÜRKİYEYE ÜRÜN GÖNDERİYOR MUSUNUZ?","text":"Türkiye’nin her yerine ürün gönderimi yapabiliyoruz. Ayrıca anlaşmalı olduğumuz uluslararası uçak kargo firması ile tüm Avrupa ülkelerine ürün gönderimi yapabiliyoruz."};
  final text6 = {"title": "SİPARİŞLERİMİZ KAÇ GÜNDE TARAFIMIZA ULAŞIYOR?","text":"Stoklu çalışmadığımız için ürünlerin hazırlık süreleri ürüne göre değişiyor.1 Günden 3 güne kadar ürün teslimat süreleri değişebiliyor."};
  final text7 = {"title": "VERDİĞİM SİPARİŞLERİ DEĞİŞTİREBİLİR MİYİM ?","text":"Tedarik süresi tamamlanana kadar siparişlerinizi güncelleyip değiştirebilirsiniz. Eğer siparişlerinizde ürün kargo süreci tamamlandıysa yeniden sipariş oluşturmanız gerekmektedir."};
  final text8 = {"title": "EN AZ NE KADARLIK SİPARİŞ OLUŞTURABİLİRİM?","text":"En az 40 TL lik sipariş oluşturabilirsiniz."};
  final text9 = {"title": "KARGOM GECİKTİYSE NE YAPMAM GEREKİYOR? ","text":"Geciken kargolar ile alakalı bilgi almak için 0546 5506779 nolu telefonumuzdan bize ulaşabilirsiniz."};
  final text10 = {"title": "SİPARİŞİMİN KARGO TAKİBİNİ NASIL YAPACAĞIM?","text":"Üye olduktan sonra mail adresinize kargo bilgileriniz gönderiliyor. Ayrıca kargo takip bölümünden de kargonuzun son durumunu görebiliyorsunuz."};
  final text11 = {"title": "SİPARİŞLERİMDE HERHANGİ BİR SORUN OLURSA NE YAPMALIYIM?","text":"Firma olarak sipariş ve sonraki süreçte çok titiz davranmakta ve hatayı en aza indirmeye çalışmaktayız. Şu anada kadar böyle bir durumla karşılaşmamakta birlikte yine eksik veya yanlış ürün konusunda 0546 550 6779 Nolu telefonumuzdan bize ulaşmanızı öneriyoruz. Bu süreçte kargo ekibimiz gereken kontrolleri yapacaktır ve eksik veya yanlış bir ürün tespit edilmesi halinde  ürününüz hiçbir ücret ödemeksizin tarafınıza gönderilecektir."};
  final text12 = {"title": "ADRESTE BANA ULAŞAMAYAN KARGO BAŞKA BİRİNE ÜRÜNÜ TESLİM EDEBİLİR Mİ ?","text":"Onay verdiğiniz herhangi birine ürününüz teslim edilebilir."};
  final text13 = {"title": "SİPARİŞLERİMLE İLGİLİ BİLGİ ALMAK İSTİYORUM NE YAPMALIYIM?","text":"Siparişlerinizin durumunu kargo takip bölümünden kargo kodu ile görebilirsiniz. Detaylı bilgi almak için  yine bizi 0546 5506779 Nolu  sipariş ve bilgi hattımızdan arayabilirsiniz."};
  final text14 = {"title": "KAPIDA ÖDEME SEÇENEĞİ VAR MI?","text":"Elbette var. Sitemizden vereceğiniz tüm siparişleri dilerseniz güvenli bir şekilde kredi kartıyla dilerseniz banka havalesi ile dilerseniz de kapıda nakit kapıda kredi kartı ile ödeme seçeneği ile ödeyebilirsiniz."};
  final text15 = {"title": "HANGİ BANKALAR İLE ÇALIŞIYORSUNUZ?","text":"Banka hesap numaralarımız bölümünde bulunan AKBANK HALKBANKASI ve GARANTİBANKASI ile çalışmaktayız."};
  final text16 = {"title": "NASIL ÜYE OLABİLİRİM","text":"cosargidamarket.com' a giderek ya da mobil uygulamamız üzerinden kaydınızı oluşturabilirsiniz."};
  final text17 = {"title": "ŞİFREMİ UNUTTUM NE YAPMALIYIM?","text":"cosargidamarket.com' a giderek ya da mobil uygulamamızda bulunan 'Şifremi unuttum' kısmından E-posta adresinize gönderilen kdd ile birlikte şifrenizi yenileyebilirsiniz."};
  final text18 = {"title": "KARGO ÜRÜN TESLİMAT GÜNLERİ NELERDİR?","text":"Pazartesi , Salı , Çarşamba , Perşembe ve Cuma olmak üzere hafta içi tüm siparişler kargoya teslim edilmektedir."};




  var list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

      list = [text,text1,text2,text3,text4,text5,text6,text7,text8,text9,text10,text11,text12,text13,text14,text15,text16,text17,text18];

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
                            text: 'Sıkça Sorulan Sorular',
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
                        return ListTile(title: Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),child: Text((i+1).toString()+") "+list[i]["title"])),subtitle: Text(list[i]["text"]));
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

