import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:ecosargidamarket/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:sizer/sizer.dart';
import 'subCategories.dart';


Widget categoryMenu(BuildContext context,InformationProvider box) {
  return Drawer(
    child: Stack(
      children: [
        SizedBox(
          width: 100.w,
          height: 30.h,
          child: const DrawerHeader(
            child: Text(
              'Kategoriler',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage('assets/images/logo.png'))),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 30.h, 0, 0),
          child: FutureBuilder(
              future: box.getCategories(context),
              builder: (context, AsyncSnapshot<List<Categories>> sonuc) {
                if (sonuc.hasData) {
                  return ListView.builder(
                      itemCount: sonuc.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.api_rounded),
                            radius: 20,
                          ),
                          title: Text(sonuc.data![index].name),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SubCategoriesPage(),
                              ),
                            );
                          },
                        );
                      });
                } else {
                  return Center(
                    child: TextButton(
                      onPressed: () {
                        box.getCategories(context);
                      },
                      child: const CircularProgressIndicator(),
                    ),
                  );
                }
              }),
        ),
      ],
    ),
  );
}

class SearchWidget extends StatefulWidget {
  final String text;
  final ValueChanged<String> onChanged;
  final String hintText;

  const SearchWidget({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.hintText,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black);
    final style = widget.text.isEmpty ? styleHint : styleActive;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,

      ),

      width: 78.6.w,
      child: Center(child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.black,size: 20.sp),
          suffixIcon: widget.text.isNotEmpty
              ? GestureDetector(
            child: const Icon(Icons.close, color: Colors.white),
            onTap: () {
              controller.clear();
              widget.onChanged('');
              FocusScope.of(context).requestFocus(FocusNode());
            },
          )
              : null,
          hintText: widget.hintText,
          fillColor: Colors.black,
          border: InputBorder.none,


        ),
        style: style,
        onChanged: widget.onChanged,
      ),),
    );
  }
}

Widget buildSearch(InformationProvider box) => SearchWidget(text: "", hintText: box.textBox.value, onChanged: (String value) {
  box.searchWord.value = value;
  if(value == "") {

  } else {
    box.isSearch.value = true;
  }
});

Widget unExpectedError(BuildContext context, InformationProvider box, pageInfo) {
  return Center(child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [
    const Icon(Icons.error_outline,size: 56),
    const SizedBox(height: 20),
    Center(child: Text("Beklenmedik bir hata meydana geldi",style: TextStyle(fontSize: 14.sp))),
    const SizedBox(height: 20),
    InkWell(child: Container(
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
        "Tekrar dene",
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    ),onTap: () {
      if(pageInfo == 0) {
        box.multiProcess(context);
      } else {
        box.loading(context, box.getProductWithCategoryList(context, box.subCategoryId.value,"0","10","").then((value){
          box.productListWCategory.value = value;
          box.update();
        }));
      }

    })
  ]));
}

Widget noElement(BuildContext context) {
  return Padding(padding: const EdgeInsets.all(14),child: Center(child: Column(mainAxisAlignment:MainAxisAlignment.center,children: [
    const Icon(Icons.search_off_rounded,size: 56),
    const SizedBox(height: 20),
    Center(child: Text("Aradığınızı bulamadık :(",style: TextStyle(fontSize: 14.sp))),
    const SizedBox(height: 20),
    InkWell(child: Container(
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
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
        "Diğer Ürünlere Göz Atın",
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
    ),onTap: () {
      Navigator.pushNamed(context, "/Categories");
    })
  ])));
}

Widget buildCategories(BuildContext context,InformationProvider box) {

  return GFItemsCarousel(
    rowCount: 3,
    itemHeight: 6.h,
    children: box.categoryList.map(
          (item) {
        return Padding(padding: const EdgeInsets.all(4),
          child: TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
            ),
            onPressed: () {
              box.subCategoryId.value = item.categoryId;
              box.subCategoryName.value = item.name;
              box.update();
              Navigator.pushNamed(context, "/SubCategories");

            },
            child: Text(item.name, style: TextStyle(fontSize: 6.sp)),
          ),
        );
      },
    ).toList(),
  );
}
