import 'package:ecosargidamarket/controllers/router_controller.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


Future<void> userLoginAlert(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Uyarı',
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Center(
              child: Text("Kullanıcı girişi yapmanız gerekmektedir.",style: TextStyle(fontSize: 10.sp)),

          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/Login");
                },
                child: const Text("Giriş Yap"),
              ),
              const SizedBox(width: 20),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Vazgeç"),
              ),
            ],
          )
        ],
      );
    },
  );
}

Future<void> errorAlert(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: const [
          Text('Uyarı'),
          SizedBox(height: 10),
          Divider(height: 5,color: Colors.green),
        ]),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Beklenmedik bir hata oluştu')
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> userLogoutAlert(context, InformationProvider box) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: const [
          Text('Uyarı'),
          SizedBox(height: 10),
          Divider(height: 5,color: Colors.green),
        ]),
        content: SingleChildScrollView(
          child: Center(
            child: Text("Gerçekten çıkış yapmak istiyor musunuz?",style: TextStyle(fontSize: 10.sp)),

          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.red),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  box.isLogin.value = false;
                  box.box.value.write("isLogin", false);
                  box.box.value.remove("userID");
                  box.box.value.remove("secret_key");
                  box.userID.value = "";
                  box.secretKey.value = "";
                  box.update();
                  Navigator.pushNamed(context, "/Home");
                },
                child: const Text("Çıkış yap"),
              ),
              const SizedBox(width: 20),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey),
                  foregroundColor:
                  MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Vazgeç"),
              ),
            ],
          )
        ],
      );
    },
  );
}

Future<void> wrong(context, message) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,children: const [
          Text('Uyarı'),
          SizedBox(height: 10),
          Divider(height: 5,color: Colors.green),
        ]),
        content: SingleChildScrollView(
          child: Text(message),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> comment(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Uyarı'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('Yorum yapmak ister misiniz?')
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Tamam'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
