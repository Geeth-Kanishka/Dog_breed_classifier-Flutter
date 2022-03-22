import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  Future launchURL({
     String url,
    bool inApp=false,
}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return  new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.purple[800],
        title: Text(
          'Info Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(

        width: double.infinity,
        height: double.infinity,
        color: Colors.grey[850],
        padding:EdgeInsets.fromLTRB(35,0,35,20) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed:() async{
                final url = 'https://www.akc.org/dog-breeds/samoyed/';
                launchURL(url:url,inApp: true);
              },
              child: Container(
                width: 250,
                alignment: Alignment.center,
                padding:
                EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.purple[800],
                ),
                child: Text(
                  'Samoyed',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed:() async{
                final url = 'https://www.akc.org/dog-breeds/chihuahua/';
                launchURL(url:url,inApp: true);
              },
              child: Container(
                width: 250,
                alignment: Alignment.center,
                padding:
                EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.purple[800],
                ),
                child: Text(
                  'Chihuahua',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed:() async{
                final url = 'https://www.akc.org/dog-breeds/bloodhound/';
                launchURL(url:url,inApp: true);
              },
              child: Container(
                width: 250,
                alignment: Alignment.center,
                padding:
                EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.purple[800],
                ),
                child: Text(
                  'Bloodhound',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed:() async{
                final url = 'https://www.akc.org/dog-breeds/golden-retriever/';
                launchURL(url:url,inApp: true);
              },
              child: Container(
                width: 250,
                alignment: Alignment.center,
                padding:
                EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.purple[800],
                ),
                child: Text(
                  'Golden retriever',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed:() async{
                final url = 'https://www.akc.org/dog-breeds/border-collie/';
                launchURL(url:url,inApp: true);
              },
              child: Container(
                width: 250,
                alignment: Alignment.center,
                padding:
                EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.purple[800],
                ),
                child: Text(
                  'Border collie',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}