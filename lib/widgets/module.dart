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
List<Module> favorite = [];

double getTotalprice() {
  double total = 0;
  for (var item in cart) {
    total += item.price * item.count;
  }
  return total;
}
