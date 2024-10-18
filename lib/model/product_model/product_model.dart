class ProductModel{
  final String productId;
  final String title;
  final String description;
  final List images;
  final String category;
  final String price;
  final dynamic createdAt;
  final String providerEmail;

  ProductModel({
    required this.productId,
    required this.title,
    required this.description,
    required this.images,
    required this.category,
    required this.price,
    required this.createdAt,
    required this.providerEmail});

  toMap(){
    return {"ProductId":productId, "Title":title, "Description":description, "Images":images,
      "Category":category, "Price":price, "CreatedAt":createdAt, "ProviderEmail":providerEmail};
  }

  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
        productId: json["ProductId"],
        title: json["Title"],
        description: json["Description"],
        images: json["Images"],
        category: json["Category"],
        price: json["Price"],
        createdAt: json["CreatedAt"],
        providerEmail: json["ProviderEmail"]);
  }
}