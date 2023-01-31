class Clothes {
  final String brand;
  final int bigCategory;
  final int smallCategory;
  final String memo;
  final String color;
  final String fit;
  final String price;
  final String size;
  // final String picutre;

  Clothes({
    required this.brand,
    required this.bigCategory,
    required this.smallCategory,
    required this.memo,
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
      memo: json['memo'],
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
      "memo": memo,
      "color": color,
      "fit": fit,
      "price": price,
      "size": size,
      // "picutre": picutre,
    };
  }
}
