import 'package:flutter/material.dart';

//首页广告图

class AdBanner extends StatelessWidget {
  final String adBannerImg;
  const AdBanner({Key key, this.adBannerImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(width: 8.0, color: Colors.black12))
      ),
      child: Image.network(adBannerImg),
    );
  }
}