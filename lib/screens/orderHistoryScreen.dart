import 'package:botanica/services/auth_service.dart';
import 'package:botanica/theme/theme_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Orderhistoryscreen extends StatelessWidget {
  const Orderhistoryscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final uid = CurrentUser.uid;

    return Scaffold(
      backgroundColor: isDark ? AppThemes.darkNeutralBg : const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text(
          'Order History',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: uid == null
          ? const Center(
              child: Text(
                'Please sign in to view your orders.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : StreamBuilder<QuerySnapshot>(
              // Listen to real-time orders of the logged-in user sorted by placed date
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(uid)
                  .collection('orders')
                  .orderBy('placedAt', descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                // 1. Show loading indicator while waiting
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                // 2. Handle empty orders
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long_outlined,
                          size: 80,
                          color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No orders placed yet',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Your completed orders will show up here.',
                          style: TextStyle(
                            fontSize: 14,
                            color: isDark ? Colors.grey.shade500 : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final orderDocs = snapshot.data!.docs;

                // 3. Display list of orders
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: orderDocs.length,
                  itemBuilder: (context, index) {
                    final order = orderDocs[index].data() as Map<String, dynamic>;
                    final orderId = orderDocs[index].id;
                    final total = (order['total'] as num?)?.toDouble() ?? 0.0;
                    final status = order['status'] ?? 'Pending';
                    final paymentMethod = order['paymentMethod'] ?? 'Cash on Delivery';
                    final address = order['address'] ?? '';
                    final items = (order['items'] as List<dynamic>?) ?? [];

                    // Format date if placedAt exists
                    String formattedDate = 'Recently';
                    if (order['placedAt'] is Timestamp) {
                      final DateTime dt = (order['placedAt'] as Timestamp).toDate();
                      formattedDate =
                          "${dt.day}/${dt.month}/${dt.year} at ${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}";
                    }

                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark ? AppThemes.darkCardSurface : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDark
                              ? AppThemes.darkCardBorder
                              : Colors.grey.shade200,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isDark ? Colors.black26 : Colors.black12,
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header: Order ID & Status Badge
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order #${orderId.substring(0, orderId.length > 6 ? 6 : orderId.length).toUpperCase()}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: status == 'Delivered'
                                      ? Colors.green.withValues(alpha: 0.15)
                                      : Colors.orange.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  status,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: status == 'Delivered'
                                        ? Colors.green
                                        : Colors.orange,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Text(
                            formattedDate,
                            style: TextStyle(
                              fontSize: 12,
                              color: isDark ? Colors.grey.shade400 : Colors.grey.shade600,
                            ),
                          ),
                          const Divider(height: 20),

                          // Items Summary
                          Text(
                            "Items (${items.length}):",
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Column(
                            children: items.map((item) {
                              final title = item['title'] ?? 'Item';
                              final count = item['count'] ?? 1;
                              final price = item['price'] ?? 0;
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "$title x$count",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: isDark
                                            ? Colors.grey.shade300
                                            : Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      "\$$price",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                          const Divider(height: 20),

                          // Footer: Total & Payment Method
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment: $paymentMethod",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isDark
                                          ? Colors.grey.shade400
                                          : Colors.grey.shade600,
                                    ),
                                  ),
                                  if (address.isNotEmpty)
                                    Text(
                                      "Delivery: $address",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: isDark
                                            ? Colors.grey.shade400
                                            : Colors.grey.shade600,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                ],
                              ),
                              Text(
                                "Total: \$${total.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF006E2F),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
