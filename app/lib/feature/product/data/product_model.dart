import 'package:app/feature/product/data/brand_model.dart';
import 'package:app/feature/product/data/product_category_model.dart';
import 'package:app/feature/product/data/product_tag_model.dart';
import 'package:app/feature/product/data/product_variant_model.dart';

class ProductModel {
  String? name;
  String? slug;
  String? type;
  String? description;
  int? brandId;
  Brand? brand;
  List<ProductCategoryModel>? productCategories;
  int? storeId;
  Brand? store;
  String? thumbnail;
  List<String>? productGalleries;
  List<ProductVariants>? productVariants;
  ProductTag? productTag;
  String? status;

  ProductModel({
    this.name,
    this.slug,
    this.type,
    this.description,
    this.brandId,
    this.brand,
    this.productCategories,
    this.storeId,
    this.store,
    this.thumbnail,
    this.productGalleries,
    this.productVariants,
    this.productTag,
    this.status,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    type = json['type'];
    description = json['description'];
    brandId = json['brand_id'];
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    if (json['product_categories'] != null) {
      productCategories = <ProductCategoryModel>[];
      json['product_categories'].forEach((v) {
        productCategories!.add(ProductCategoryModel.fromJson(v));
      });
    }
    storeId = json['store_id'];
    store = json['store'] != null ? Brand.fromJson(json['store']) : null;
    thumbnail = json['thumbnail'];
    productGalleries = json['product_galleries'].cast<String>();
    if (json['product_variants'] != null) {
      productVariants = <ProductVariants>[];
      json['product_variants'].forEach((v) {
        productVariants!.add(ProductVariants.fromJson(v));
      });
    }
    productTag =
        json['product_tag'] != null
            ? ProductTag.fromJson(json['product_tag'])
            : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['type'] = type;
    data['description'] = description;
    data['brand_id'] = brandId;
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    if (productCategories != null) {
      data['product_categories'] =
          productCategories!.map((v) => v.toJson()).toList();
    }
    data['store_id'] = storeId;
    if (store != null) {
      data['store'] = store!.toJson();
    }
    data['thumbnail'] = thumbnail;
    data['product_galleries'] = productGalleries;
    if (productVariants != null) {
      data['product_variants'] =
          productVariants!.map((v) => v.toJson()).toList();
    }
    if (productTag != null) {
      data['product_tag'] = productTag!.toJson();
    }
    data['status'] = status;
    return data;
  }
}
