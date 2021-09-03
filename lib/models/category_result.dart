import '../utils/constants.dart';

class Category {
  String status;
  Data data;

  Category({this.status, this.data});

  Category.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  List<Interests> interests;
  bool premium;
  String sId;
  String name;
  String selection;
  String date;
  String slug;
  int iV;

  Data(
      {this.interests,
        this.premium,
        this.sId,
        this.name,
        this.selection,
        this.date,
        this.slug,
        this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['interests'] != null) {
      interests = new List<Interests>();
      json['interests'].forEach((v) {
        interests.add(new Interests.fromJson(v));
      });
    }
    premium = json['premium'];
    sId = json['_id'];
    name = json['name'];
    selection = json['selection'];
    date = json['date'];
    slug = json['slug'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.interests != null) {
      data['interests'] = this.interests.map((v) => v.toJson()).toList();
    }
    data['premium'] = this.premium;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['selection'] = this.selection;
    data['date'] = this.date;
    data['slug'] = this.slug;
    data['__v'] = this.iV;
    return data;
  }
}

class Interests {
  bool flag;
  String sId;
  String name;
  String category;
  String date;
  String slug;
  int iV;
  String image;

  Interests(
      {this.flag,
        this.sId,
        this.name,
        this.category,
        this.date,
        this.slug,
        this.iV,
        this.image});

  Interests.fromJson(Map<String, dynamic> json) {
    flag = json['flag'];
    sId = json['_id'];
    name = json['name'];
    category = json['category'];
    date = json['date'];
    slug = json['slug'];
    iV = json['__v'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag'] = this.flag;
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['category'] = this.category;
    data['date'] = this.date;
    data['slug'] = this.slug;
    data['__v'] = this.iV;
    data['image'] = this.image;
    return data;
  }

  String getInteresetPhoto() {
    if (image == null) return null;
    return "${Constants.BASE_URL_IMAGE}$image";
  }

}