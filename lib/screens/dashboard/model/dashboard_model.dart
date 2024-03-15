class SelectedItems {
  String? imagePath;
  String? name;
  String? urduName;
  int? price;
  int count;
  int totalPrice;
  bool? isSelected;

  SelectedItems({
    this.imagePath,
    this.name,
    this.urduName,
    this.price,
    this.count = 0,
    this.totalPrice = 0,
    this.isSelected,
  });

  SelectedItems copyWith({
    String? imagePath,
    String? name,
    String? urduName,
    int? price,
    int? count,
    int? totalPrice,
    bool? isSelected,
  }) {
    return SelectedItems(
      imagePath: imagePath ?? this.imagePath,
      name: name ?? this.name,
      urduName: urduName ?? this.urduName,
      price: price ?? this.price,
      count: count ?? this.count,
      totalPrice: totalPrice ?? this.totalPrice,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
