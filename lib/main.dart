import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CraterX',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI Demo'),
      ),
      // body is the majority of the screen.
      body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Text(
              'CraterX Payments',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            // TextField(
            //   keyboardType: TextInputType.number,
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     prefixText: '\₹',
            //     labelText: 'Enter Amount'
            //   ),
            //   //onSubmitted: ,
            // ),
            Divider(),
            OutlineButton(
              child: Text('Make Payment'),
              onPressed: _launchURL,
            )
            
          ],
        ),
    );
  }
}

_launchURL() async {
  const pa = "zomato-order@paytm"; //sample VPA replace with your company VPA
  const pn = "CrarterX";
  const tn = "From CraterX";
  const int am = 1;

  const url = 'upi://pay?'+'pa=$pa'+'&pn=$pn'+'&am=$am'+'&tn=$tn';

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}