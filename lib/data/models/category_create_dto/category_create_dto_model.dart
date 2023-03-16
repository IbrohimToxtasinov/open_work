class CategoryCreateDtoModel {
  final String name;

  CategoryCreateDtoModel({
    required this.name,
  });

  factory CategoryCreateDtoModel.fromJson(Map<String, dynamic> json) {
    return CategoryCreateDtoModel(
      name: json['name'] as String? ?? '',
    );
  }
}
