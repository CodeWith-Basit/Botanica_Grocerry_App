import 'package:botanica/widgets/module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen>
    with SingleTickerProviderStateMixin {
  // ---------- controllers ----------
  final _formKey = GlobalKey<FormState>();
  final _addressCtrl = TextEditingController();
  final _pinCtrl = TextEditingController();
  final _cardNumberCtrl = TextEditingController();
  final _cardHolderCtrl = TextEditingController();
  final _expiryCtrl = TextEditingController();
  final _cvvCtrl = TextEditingController();

  // ---------- state ----------
  String _paymentMethod = 'card'; // 'card' | 'cod'
  bool _isPlacing = false;
  late AnimationController _btnController;
  late Animation<double> _btnScale;

  @override
  void initState() {
    super.initState();
    _btnController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.95,
      upperBound: 1.0,
      value: 1.0,
    );
    _btnScale = _btnController;
  }

  @override
  void dispose() {
    _addressCtrl.dispose();
    _pinCtrl.dispose();
    _cardNumberCtrl.dispose();
    _cardHolderCtrl.dispose();
    _expiryCtrl.dispose();
    _cvvCtrl.dispose();
    _btnController.dispose();
    super.dispose();
  }

  double get _total => getTotalprice();

  void _placeOrder() async {
    if (!_formKey.currentState!.validate()) return;

    await _btnController.reverse();
    await _btnController.forward();

    setState(() => _isPlacing = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isPlacing = false);

    if (!mounted) return;
    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Color(0xFF53B175),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 48,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Order Placed!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF181725),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your order has been placed successfully.\nThank you for shopping with Botanica!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53B175),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    cart.clear();
                    Navigator.of(context)
                      ..pop()
                      ..pop();
                  },
                  child: const Text(
                    'Back to Home',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatCardNumber(String raw) {
    final cleaned = raw.replaceAll(' ', '');
    final buffer = StringBuffer();
    for (int i = 0; i < cleaned.length; i++) {
      if (i > 0 && i % 4 == 0) buffer.write(' ');
      buffer.write(cleaned[i]);
    }
    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xFF181725),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: Color(0xFF181725),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _sectionCard(
              title: 'Order Summary ',
              icon: Icons.receipt_long_rounded,
              child: Column(
                children: [
                  ...cart.map(
                    (item) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              item.img,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Text(
                            'x${item.count}',
                            style: TextStyle(color: Colors.grey.shade500),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '\$${(item.price * item.count).toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF53B175),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '\$${_total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF53B175),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ───── Delivery Address ─────
            _sectionCard(
              title: 'Delivery Address',
              icon: Icons.location_on_rounded,
              child: Column(
                children: [
                  _buildField(
                    controller: _addressCtrl,
                    label: 'Full Address',
                    hint: 'e.g. House 12, Street 4, Islamabad',
                    icon: Icons.home_rounded,
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Address is required'
                        : null,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _pinCtrl,
                    label: 'Pin Code',
                    hint: 'e.g. 440001',
                    icon: Icons.pin_drop_rounded,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(6),
                    ],
                    validator: (v) {
                      if (v == null || v.isEmpty) return 'Pin code is required';
                      if (v.length != 6) return 'Pin code must be 6 digits';
                      return null;
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            _sectionCard(
              title: 'Payment Method',
              icon: Icons.payment_rounded,
              child: Column(
                children: [
                  _paymentTile(
                    value: 'card',
                    label: 'Credit / Debit Card',
                    icon: Icons.credit_card_rounded,
                    color: const Color(0xFF4F6EF7),
                  ),
                  _paymentTile(
                    value: 'cod',
                    label: 'Cash on Delivery',
                    icon: Icons.local_shipping_rounded,
                    color: const Color(0xFFF18701),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _paymentMethod == 'card'
                  ? _sectionCard(
                      key: const ValueKey('card'),
                      title: 'Card Details',
                      icon: Icons.credit_card_rounded,
                      child: Column(
                        children: [
                          _buildField(
                            controller: _cardNumberCtrl,
                            label: 'Card Number ',
                            hint: '1234 5678 9012 3456',
                            icon: Icons.credit_card,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(16),
                            ],
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'Card number is required';
                              }
                              final digits = v.replaceAll(' ', '');
                              if (digits.length != 16) {
                                return 'Enter a valid 16-digit card number';
                              }
                              return null;
                            },
                            onChanged: (v) {
                              final formatted = _formatCardNumber(v);
                              if (formatted != _cardNumberCtrl.text) {
                                _cardNumberCtrl.value = _cardNumberCtrl.value
                                    .copyWith(
                                      text: formatted,
                                      selection: TextSelection.collapsed(
                                        offset: formatted.length,
                                      ),
                                    );
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          _buildField(
                            controller: _cardHolderCtrl,
                            label: 'Card Holder Name',
                            hint: 'e.g. Abdul Basit',
                            icon: Icons.person_rounded,
                            validator: (v) => (v == null || v.trim().isEmpty)
                                ? 'Card holder name is required'
                                : null,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _buildField(
                                  controller: _expiryCtrl,
                                  label: 'Expiry',
                                  hint: 'MM/YY',
                                  icon: Icons.date_range_rounded,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(4),
                                  ],
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return 'Required';
                                    }
                                    if (v.replaceAll('/', '').length < 4) {
                                      return 'Invalid';
                                    }
                                    return null;
                                  },
                                  onChanged: (v) {
                                    final digits = v.replaceAll('/', '');
                                    if (digits.length == 2 &&
                                        !v.contains('/')) {
                                      _expiryCtrl.value = _expiryCtrl.value
                                          .copyWith(
                                            text: '$v/',
                                            selection: TextSelection.collapsed(
                                              offset: v.length + 1,
                                            ),
                                          );
                                    }
                                  },
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _buildField(
                                  controller: _cvvCtrl,
                                  label: 'CVV',
                                  hint: '• • •',
                                  icon: Icons.lock_rounded,
                                  keyboardType: TextInputType.number,
                                  obscureText: true,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(3),
                                  ],
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return 'Required';
                                    }
                                    if (v.length != 3) return 'Invalid CVV';
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : const SizedBox.shrink(key: ValueKey('cod')),
            ),

            const SizedBox(height: 24),

            ScaleTransition(
              scale: _btnScale,
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF53B175),
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: const Color(0xFF53B175).withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: _isPlacing ? null : _placeOrder,
                  child: _isPlacing
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.shopping_bag_rounded, size: 22),
                            const SizedBox(width: 8),
                            Text(
                              'Place Order  \$${_total.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _sectionCard({
    Key? key,
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF53B175), size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0xFF181725),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool obscureText = false,
    int maxLines = 1,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      maxLines: maxLines,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(icon, color: const Color(0xFF53B175), size: 20),
        filled: true,
        fillColor: const Color(0xFFF8F9FB),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF53B175), width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
      ),
    );
  }

  Widget _paymentTile({
    required String value,
    required String label,
    required IconData icon,
    required Color color,
  }) {
    final selected = _paymentMethod == value;
    return GestureDetector(
      onTap: () => setState(() => _paymentMethod = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? color.withValues(alpha: 0.08) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected ? color : Colors.grey.shade200,
            width: selected ? 1.8 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: selected ? color : const Color(0xFF181725),
                fontSize: 15,
              ),
            ),
            const Spacer(),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? color : Colors.grey.shade400,
                  width: 2,
                ),
                color: selected ? color : Colors.white,
              ),
              child: selected
                  ? const Icon(Icons.check, color: Colors.white, size: 14)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
