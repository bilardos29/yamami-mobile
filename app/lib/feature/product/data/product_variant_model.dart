class ProductVariants {
  int? productAttributeId;
  String? productAttributeName;
  List<ProductAttributeOptions>? productAttributeOptions;

  ProductVariants(
      {this.productAttributeId,
        this.productAttributeName,
        this.productAttributeOptions});

  ProductVariants.fromJson(Map<String, dynamic> json) {
    productAttributeId = json['product_attribute_id'];
    productAttributeName = json['product_attribute_name'];
    if (json['product_attribute_options'] != null) {
      productAttributeOptions = <ProductAttributeOptions>[];
      json['product_attribute_options'].forEach((v) {
        productAttributeOptions!.add(ProductAttributeOptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_attribute_id'] = productAttributeId;
    data['product_attribute_name'] = productAttributeName;
    if (productAttributeOptions != null) {
      data['product_attribute_options'] =
          productAttributeOptions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttributeOptions {
  int? productAttributeOptionId;
  String? productAttributeOptionName;

  ProductAttributeOptions(
      {this.productAttributeOptionId, this.productAttributeOptionName});

  ProductAttributeOptions.fromJson(Map<String, dynamic> json) {
    productAttributeOptionId = json['product_attribute_option_id'];
    productAttributeOptionName = json['product_attribute_option_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_attribute_option_id'] = productAttributeOptionId;
    data['product_attribute_option_name'] = productAttributeOptionName;
    return data;
  }
}