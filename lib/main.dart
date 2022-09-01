import 'package:flutter/material.dart';
 import 'package:webview_flutter_plus/webview_flutter_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
//Added new
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WebViewPlus(zoomEnabled: true,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller){
            controller.loadUrl("assets/webpages/index.html");
          },
          javascriptChannels: Set.from([
            JavascriptChannel(name: 'Captcha', onMessageReceived: (JavascriptMessage message){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
            })
          ]),
        )
    );
  }
}


class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("           Welcome Mahipal \n\nIn Mobile Captcha Development",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w700),),
      ),
    );
  }
}