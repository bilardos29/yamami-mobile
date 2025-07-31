import 'package:app/config/meta.dart';
import 'package:app/feature/product/data/store_model.dart';

class ListBannerModel {
  List<BannerModel>? banners;
  MetaModel? meta;

  ListBannerModel({this.banners, this.meta});

  ListBannerModel.fromJson(Map<String, dynamic> json) {
    banners = <BannerModel>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        banners?.add(BannerModel.fromJson(v));
      });
    }
    meta = MetaModel.fromJson(json['meta']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items'] = banners;
    data['meta'] = meta?.toJson();
    return data;
  }
}

class BannerModel {
  String? id;
  String? name;
  String? slug;
  String? image;
  int? voucherId;
  String? voucherCode;
  String? startDate;
  String? endDate;
  String? description;
  String? tnc;
  ShortStoreModel? store;
  String? notificationTitle;
  String? notificationBody;
  bool? sendNotifNow;
  String? notificationSendAt;
  bool? isPublish;

  BannerModel({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.voucherId,
    this.voucherCode,
    this.startDate,
    this.endDate,
    this.description,
    this.tnc,
    this.store,
    this.notificationTitle,
    this.notificationBody,
    this.sendNotifNow,
    this.notificationSendAt,
    this.isPublish,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    voucherId = json['voucher_id'];
    voucherCode = json['voucher_code'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
    tnc = json['tnc'];
    notificationTitle = json['notification_title'];
    notificationBody = json['notification_body'];
    sendNotifNow = json['send_notif_now'];
    notificationSendAt = json['notification_send_at'];
    isPublish = json['is_publish'];
    store = json['store'] != null ? ShortStoreModel.fromJson(json['store']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['voucher_id'] = voucherId;
    data['voucher_code'] = voucherCode;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    data['tnc'] = tnc;
    data['store'] = store;
    data['notification_title'] = notificationTitle;
    data['notification_body'] = notificationBody;
    data['send_notif_now'] = sendNotifNow;
    data['notification_send_at'] = notificationSendAt;
    data['is_publish'] = isPublish;
    return data;
  }
}
