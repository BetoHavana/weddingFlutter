import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wedding/models/constants.dart';

class WPButton extends StatelessWidget {
  final String? msg;
  final String? numero;
  const WPButton({Key? key, this.msg, this.numero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     double width = MediaQuery. of(context). size. width ;
    return Container(
     // width: width / 2 ,
      height: 80,
      padding: EdgeInsets.only( bottom: 10, right: 20),
      child: ElevatedButton(
        style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(primaryColor)),
        onPressed: _launchUrl,
        child: Wrap(
          children: [
            Icon(
              Icons.whatsapp,
              color: Colors.green,
              size: 30.0,
            ),
            SizedBox(
              width: 10,
            ),
            Text(msg!, style: commonTextStyle),
          ],
        ),
      ),
    );
  }

  void _launchUrl() async {
    final Uri _url = Uri.parse(
        "https://wa.me/$numero?text=Confirmo la asistencia a tu boda");
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }
  /*openwhatsapp() async{
  var whatsapp ="+919144040888";
  var whatsappURl_android = "whatsapp://send?phone="+whatsapp+"&text=hello";
  var whatappURL_ios ="https://wa.me/$whatsapp?text=${Uri.parse("hello")}";
  if(Platform.isIOS){
    // for iOS phone only
    if( await canLaunch(whatappURL_ios)){
       await launch(whatappURL_ios, forceSafariVC: false);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("whatsapp no installed")));

    }

  }else{
    // android , web
    if( await canLaunch(whatsappURl_android)){
      await launch(whatsappURl_android);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: new Text("whatsapp no installed")));

    }


  }

}*/
}
