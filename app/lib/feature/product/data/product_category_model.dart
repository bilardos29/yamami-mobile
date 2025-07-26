class ProductCategoryModel {
  String? id;
  String? name;
  String? slug;
  String? description;
  String? icon;
  String? parentId;
  String? storeId;
  String? status;

  ProductCategoryModel(
      {this.id,
        this.name,
        this.slug,
        this.description,
        this.icon,
        this.parentId,
        this.storeId,
        this.status});

  ProductCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    icon = json['icon'];
    parentId = json['parent_id'];
    storeId = json['store_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['icon'] = icon;
    data['parent_id'] = parentId;
    data['store_id'] = storeId;
    data['status'] = status;
    return data;
  }
}