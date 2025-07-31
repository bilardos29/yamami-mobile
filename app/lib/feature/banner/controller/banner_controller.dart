import 'dart:convert';

import 'package:app/config/api.dart';
import 'package:app/config/response.dart';
import 'package:app/feature/home/model/banner_model.dart';
import 'package:flutter/cupertino.dart';

class BannerController extends ChangeNotifier with Api {
  BannerModel item = BannerModel();

  getBannerDetail(String id) async {
    try {
      final result = await get('${ApiPath.promoBanner}/$id');
      final response = Response.fromJson(jsonDecode(result.body));
      if (result.statusCode == 200) {
        item = BannerModel.fromJson(response.data);
      }
    } catch (e) {
      print('err $e');
    }
  }
}