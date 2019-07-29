import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/flat_appbar.dart';
import './sms_code_sending_screen.dart';
import './sms_code_input_screen.dart';

class PhoneAuthScreen extends StatelessWidget {
  static const routeName = '/auth';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            FlatAppBar(
              title: Text(
                '登入Cafeca',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                '輸入手機號碼',
                style: TextStyle(
                    fontSize: 20, color: Theme.of(context).primaryColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 30, right: 30),
              child: Row(
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    color: Colors.grey[200],
                    onPressed: () {
                      // https://flutter.dev/docs/cookbook/navigation/returning-data
                      // Navigator.of(context).push(context, MaterialPageRoute(builder: (context) => CountryCodeScreen()) )
                    },
                    child: Row(
                      children: <Widget>[
                        Text(
                          '+886',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        Icon(
                          Icons.expand_more,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      style: TextStyle(color: Colors.grey),
                      text:
                          '點按下一步可收到 Facebook account kit 的簡訊確認。Cafeca 會使用 Facebook 技術來協助你登入，但是你不需要 Facebook 帳號。可能會收取訊息費用和資費。',
                    ),
                    TextSpan(
                      text: '瞭解 Facebook 如何使用你的資料',
                      style: TextStyle(
                          color: Colors.grey,
                          decoration: TextDecoration.underline),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch(
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(10),
                child: Text(
                  '下一步',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    // MaterialPageRoute(builder: (context) => SMSCodeSendingScreen()));
                    MaterialPageRoute(
                      builder: (context) =>
                          SMSCodeInputScreen(phone: '+989151529'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}