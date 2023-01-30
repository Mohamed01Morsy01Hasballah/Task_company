class ProductScreenModel {
  bool? success;
  String? message;
  Data? data;

  ProductScreenModel({this.success, this.message, this.data});

  ProductScreenModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? category;
  String? description;
  String? image;
  int? price;
  int? oldprice;
  int? favourite;
  int? discount;
  int? priceAfterDiscount;
  List<MoreImage>? moreImage;
  List<Color>? color;

  Data(
      {this.id,
        this.name,
        this.category,
        this.description,
        this.image,
        this.price,
        this.oldprice,
        this.favourite,
        this.discount,
        this.priceAfterDiscount,
        this.moreImage,
        this.color});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    oldprice = json['oldprice'];
    favourite = json['favourite'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    if (json['MoreImage'] != null) {
      moreImage = <MoreImage>[];
      json['MoreImage'].forEach((v) {
        moreImage!.add(new MoreImage.fromJson(v));
      });
    }
    if (json['Color'] != null) {
      color = <Color>[];
      json['Color'].forEach((v) {
        color!.add(new Color.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['oldprice'] = this.oldprice;
    data['favourite'] = this.favourite;
    data['discount'] = this.discount;
    data['price_after_discount'] = this.priceAfterDiscount;
    if (this.moreImage != null) {
      data['MoreImage'] = this.moreImage!.map((v) => v.toJson()).toList();
    }
    if (this.color != null) {
      data['Color'] = this.color!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MoreImage {
  int? id;
  String? image;
  String? hex;

  MoreImage({this.id, this.image, this.hex});

  MoreImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    hex = json['hex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['hex'] = this.hex;
    return data;
  }
}

class Color {
  int? id;
  String? name;
  String? hex;
  List<Size>? size;

  Color({this.id, this.name, this.hex, this.size});

  Color.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    hex = json['hex'];
    if (json['Size'] != null) {
      size = <Size>[];
      json['Size'].forEach((v) {
        size!.add(new Size.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['hex'] = this.hex;
    if (this.size != null) {
      data['Size'] = this.size!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Size {
  int? id;
  String? name;

  Size({this.id, this.name});

  Size.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}