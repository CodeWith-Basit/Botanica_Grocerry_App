class Module {
  final String title;
  final String img;
  final double price;
  int count;
  bool isFavorite = false;

  Module({
    required this.title,
    required this.img,
    required this.price,
    required this.count,
    this.isFavorite = false,
  });
}

List<Module> cart = [];
