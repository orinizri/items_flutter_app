class Item {
  Item({
    required this.id,
    this.imageUrl,
    required this.categories,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.holderId,
    required this.borrowerId,
    required this.active,
  });

  int id;
  String? imageUrl;
  List<String> categories;
  String name;
  String description;
  DateTime startDate;
  DateTime endDate;
  int holderId;
  int borrowerId;
  bool active;
}
