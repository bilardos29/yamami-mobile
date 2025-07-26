class ProductTag {
  String? metaTitle;
  String? metaKeyword;
  String? metaDescription;
  String? ogTitle;
  String? ogDescription;
  String? ogImage;

  ProductTag(
      {this.metaTitle,
        this.metaKeyword,
        this.metaDescription,
        this.ogTitle,
        this.ogDescription,
        this.ogImage});

  ProductTag.fromJson(Map<String, dynamic> json) {
    metaTitle = json['meta_title'];
    metaKeyword = json['meta_keyword'];
    metaDescription = json['meta_description'];
    ogTitle = json['og_title'];
    ogDescription = json['og_description'];
    ogImage = json['og_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meta_title'] = metaTitle;
    data['meta_keyword'] = metaKeyword;
    data['meta_description'] = metaDescription;
    data['og_title'] = ogTitle;
    data['og_description'] = ogDescription;
    data['og_image'] = ogImage;
    return data;
  }
}