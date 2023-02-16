class Clothes {
  final String brand;
  final int bigCategory;
  final int smallCategory;
  final String name;
  final String color;
  final String fit;
  final String price;
  final String size;
  // final String picutre;

  Clothes({
    required this.brand,
    required this.bigCategory,
    required this.smallCategory,
    required this.name,
    required this.color,
    required this.fit,
    required this.price,
    required this.size,
    // required this.picutre, //base64 인코드해서
  });

  factory Clothes.fromJson(Map<String, dynamic> json) {
    return Clothes(
      brand: json['brand'],
      bigCategory: json['bigCategory'],
      smallCategory: json['smallCategory'],
      name: json['name'],
      color: json['color'],
      fit: json['fit'],
      price: json['price'],
      size: json['size'],
      // picutre: json['picutre'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "brand": brand,
      "bigCategory": bigCategory,
      "smallCategory": smallCategory,
      "name": name,
      "color": color,
      "fit": fit,
      "price": price,
      "size": size,
      // "picutre": picutre,
    };
  }
}
