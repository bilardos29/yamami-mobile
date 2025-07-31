class MetaModel {
  int? currentPage;
  int? perPage;
  int? totalItems;
  int? totalPages;

  MetaModel({this.currentPage, this.perPage, this.totalItems, this.totalPages});

  MetaModel.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    perPage = json['perPage'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentPage'] = currentPage;
    data['perPage'] = perPage;
    data['totalItems'] = totalItems;
    data['totalPages'] = totalPages;
    return data;
  }
}