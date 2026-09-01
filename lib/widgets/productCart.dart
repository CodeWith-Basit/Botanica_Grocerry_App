import 'package:botanica/widgets/module.dart';
import 'package:flutter/material.dart';

class Productcart extends StatefulWidget {
  final String img;
  final String rating;
  final String title;
  final String weight;
  final String price;
  final VoidCallback onAddToCart;
  final VoidCallback? onFavoriteChanged;
  const Productcart({
    super.key,
    required this.img,
    required this.rating,
    required this.title,
    required this.weight,
    required this.price,
    required this.onAddToCart,
    this.onFavoriteChanged,
  });

  @override
  State<Productcart> createState() => _ProductcartState();
}

class _ProductcartState extends State<Productcart> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    bool isFavorite = favorite.any((item) => item.title == widget.title);
    return Container(
      width: 180,
      height: 290,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF191E1A) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(widget.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isFavorite) {
                          favorite.removeWhere(
                            (item) => item.title == widget.title,
                          );
                        } else {
                          double parsedPrice =
                              double.tryParse(
                                widget.price.replaceAll(RegExp(r'[^\d.]'), ''),
                              ) ??
                              0.0;
                          favorite.add(
                            Module(
                              title: widget.title,
                              img: widget.img,
                              price: parsedPrice,
                              count: 1,
                              isFavorite: true,
                            ),
                          );
                        }
                      });
                      widget.onFavoriteChanged?.call();
                    },
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: isDark
                          ? const Color(0xFF2C352E)
                          : const Color(0xffdedfdf),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? Colors.red
                            : (isDark ? Colors.white70 : Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xff735c00)),
                Text(
                  widget.rating,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.grey.shade400 : Colors.black87,
                  ),
                ),
              ],
            ),
            Text(
              widget.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                color: isDark ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.weight,
              style: TextStyle(
                fontSize: 16,
                color: isDark ? Colors.grey.shade500 : Colors.grey.shade400,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? const Color(0xFF22C55E)
                        : const Color(0xff006E2F),
                  ),
                ),
                GestureDetector(
                  onTap: widget.onAddToCart,
                  child: CircleAvatar(
                    backgroundColor: isDark
                        ? const Color(0xFF22C55E)
                        : const Color(0xff006E2F),
                    radius: 20,
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
