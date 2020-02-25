import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

//打电话
class Call extends StatelessWidget {
  final String callImg;
  final String callPhone;

  const Call({Key key, this.callImg, this.callPhone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width:8.0, color: Colors.black12)
        ),
      ),
      child: InkWell(
        child: Image.network(callImg),
        onTap: _launchURL
      ),
    );
  }
  void _launchURL() async {
    String url = 'tel:'+callPhone;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}