import 'dart:convert';

class Product {
  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  Product.empty() {
    id = null;
    title = null;
    description = null;
    price = null;
    discountPercentage = null;
    rating = null;
    stock = null;
    brand = null;
    category = null;
    thumbnail = null;
    images = null;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int?,
      title: map['title'] as String?,
      description: map['description'] as String?,
      price: map['price'] as int?,
      discountPercentage: map['discountPercentage'] != null
          ? (map['discountPercentage'] as num).toDouble()
          : null,
      rating: map['rating'] != null ? (map['rating'] as num).toDouble() : null,
      stock: map['stock'] as int?,
      brand: map['brand'] as String?,
      category: map['category'] as String?,
      thumbnail: map['thumbnail'] as String?,
      images: map['images'] != null
          ? List<String>.from(map['images'] as List<dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);
}
