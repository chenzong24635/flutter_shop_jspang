import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

Future request(url, {formData})async{
  try {
    Response res;
    Dio dio = new Dio();
    dio.options.contentType = ContentType.parse("application/x-www-form-urlencoded").toString();
    if(formData == null) {
      res = await dio.post(servicePath[url]);
    } else {
      res = await dio.post(servicePath[url], data: formData);
    }
    if(res.statusCode == 200) {
      return res.data;
    } else {
      throw Exception('接口异常');
    }
  } catch(e) {
    throw Exception('错误$e');
  }
}