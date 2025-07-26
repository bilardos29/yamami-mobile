import 'dart:convert';

import 'package:app/config/api.dart';
import 'package:app/config/response.dart';
import 'package:app/feature/home/model/banner_model.dart';
import 'package:app/feature/product/data/product_category_model.dart';
import 'package:app/feature/profile/data/user_model.dart';
import 'package:app/utils/local_storage.dart';
import 'package:app/utils/local_storage_key.dart';
import 'package:flutter/material.dart';
import 'package:app/feature/product/data/product_model.dart';

class HomeController extends ChangeNotifier with Api {
  bool newNotif = false;
  bool newCart = false;
  List<BannerModel> listBanner = [];
  List<ProductCategoryModel> listCategory = [];
  List<ProductModel> listProduct = [];

  Future<UserModel> getUser() async {
    final userData = LocalStorage.getString(LocalStorageKey.user);
    if (userData.isNotEmpty) {
      final user = UserModel.fromJson(json.decode(userData));
      return user;
    }
    return UserModel();
  }

  void getListBanner({
    ValueChanged<String>? onErr,
    VoidCallback? onSuccess,
  }) async {
    try {
      final result = await get(ApiPath.promoBanner);
      final response = Response.fromJson(jsonDecode(result.body));
      if (result.statusCode == 200) {
        final List<dynamic> data = response.data;
        listBanner = data.map((e) => BannerModel.fromJson(e)).toList();
        onSuccess!();
      } else {
        onErr!(response.message ?? '');
      }
    } catch (e) {
      onErr!(e.toString());
    }
  }

  void getDetailBanner(
    String id, {
    ValueChanged<String>? onErr,
    ValueChanged<BannerModel>? onSuccess,
  }) async {
    try {
      final result = await get('${ApiPath.promoBanner}/$id');
      final response = Response.fromJson(jsonDecode(result.body));
      if (result.statusCode == 200) {
        final banner = BannerModel.fromJson(response.data);
        onSuccess!(banner);
      } else {
        onErr!(response.message ?? '');
      }
    } catch (e) {
      onErr!(e.toString());
    }
  }

  void getListCategory({
    ValueChanged<String>? onErr,
    VoidCallback? onSuccess,
  }) async {
    try {
      final result = await get(ApiPath.category);
      final response = Response.fromJson(jsonDecode(result.body));
      if (result.statusCode == 200) {
        final List<dynamic> data = response.data;
        listCategory = data.map((e) => ProductCategoryModel.fromJson(e)).toList();
        onSuccess!();
      } else {
        onErr!(response.message ?? '');
      }
    } catch (e) {
      onErr!(e.toString());
    }
  }

  void getListProduct(
      String filter,
      String catId,
      {
    ValueChanged<String>? onErr,
    VoidCallback? onSuccess,
  }) async {
    try {
      final result = await get(ApiPath.product);
      final response = Response.fromJson(jsonDecode(result.body));
      if (result.statusCode == 200) {
        final List<dynamic> data = response.data;
        listProduct = data.map((e) => ProductModel.fromJson(e)).toList();
        onSuccess!();
      } else {
        onErr!(response.message ?? '');
      }
    } catch (e) {
      onErr!(e.toString());
    }
  }

  void getListPromoCollection(
      {
        ValueChanged<String>? onErr,
        VoidCallback? onSuccess,
      }) async {
    try {
      final result = await get(ApiPath.promoCollection);
      final response = Response.fromJson(jsonDecode(result.body));
      if (result.statusCode == 200) {
        final List<dynamic> data = response.data;
        listProduct = data.map((e) => ProductModel.fromJson(e)).toList();
        onSuccess!();
      } else {
        onErr!(response.message ?? '');
      }
    } catch (e) {
      onErr!(e.toString());
    }
  }
}
