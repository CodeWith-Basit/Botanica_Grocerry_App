import 'package:botanica/theme/theme_controller.dart';
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

  double get _total =>
      cart.fold(0.0, (sum, item) => sum + item.price * item.count);

  void _placeOrder() async {
    if (!_formKey.currentState!.validate()) return;

    await _btnController.forward();
    await _btnController.reverse();

    setState(() => _isPlacing = true);
    await Future.delayed(const Duration(milliseconds: 1200));
    if (!mounted) return;
    setState(() => _isPlacing = false);

    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => Dialog(
        backgroundColor: isDark ? AppThemes.darkCardSurface : Colors.white,
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
                  color: AppThemes.primaryGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                  size: 48,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Order Placed!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : const Color(0xFF181725),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Your order has been placed successfully.\nThank you for shopping with Botanica!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: isDark ? AppThemes.darkTextSecondary : Colors.grey.shade600,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppThemes.primaryGreen,
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: isDark ? AppThemes.darkNeutralBg : const Color(0xFFF8F9FB),
      appBar: AppBar(
        backgroundColor: isDark ? AppThemes.darkNeutralBg : Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: isDark ? Colors.white : const Color(0xFF181725),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Checkout',
          style: TextStyle(
            color: isDark ? Colors.white : const Color(0xFF181725),
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
              title: 'Order Summary',
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
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: isDark ? Colors.white : Colors.black87,
                              ),
                            ),
                          ),
                          Text(
                            'x${item.count}',
                            style: TextStyle(
                              color: isDark ? AppThemes.darkTextSecondary : Colors.grey.shade500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '\$${(item.price * item.count).toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isDark ? AppThemes.primaryGreen : const Color(0xFF53B175),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    height: 20,
                    color: isDark ? AppThemes.darkCardBorder : Colors.grey.shade200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      Text(
                        '\$${_total.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: isDark ? AppThemes.primaryGreen : const Color(0xFF53B175),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            _sectionCard(
              title: 'Delivery Address',
              icon: Icons.location_on_rounded,
              child: Column(
                children: [
                  _buildField(
                    controller: _addressCtrl,
                    label: 'Street Address',
                    hint: 'e.g. 123 Green Valley Ave',
                    icon: Icons.home_rounded,
                    validator: (v) =>
                        v == null || v.trim().isEmpty ? 'Address is required' : null,
                  ),
                  const SizedBox(height: 12),
                  _buildField(
                    controller: _pinCtrl,
                    label: 'ZIP / Postal Code',
                    hint: 'e.g. 94103',
                    icon: Icons.pin_drop_rounded,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (v) {
                      if (v == null || v.trim().isEmpty) {
                        return 'ZIP code is required';
                      }
                      if (v.trim().length < 4) return 'Enter a valid ZIP code';
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
                    color: isDark ? AppThemes.primaryGreen : const Color(0xFF53B175),
                  ),
                  _paymentTile(
                    value: 'cod',
                    label: 'Cash on Delivery',
                    icon: Icons.money_rounded,
                    color: isDark ? AppThemes.secondaryGreen : const Color(0xFFF37A20),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: _paymentMethod == 'card'
                  ? _sectionCard(
                      key: const ValueKey('card_details'),
                      title: 'Card Details',
                      icon: Icons.lock_outline_rounded,
                      child: Column(
                        children: [
                          _buildField(
                            controller: _cardNumberCtrl,
                            label: 'Card Number',
                            hint: 'XXXX XXXX XXXX XXXX',
                            icon: Icons.credit_card,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(16),
                            ],
                            onChanged: (v) {
                              final formatted = _formatCardNumber(v);
                              if (formatted != v) {
                                _cardNumberCtrl.value =
                                    TextEditingValue(
                                      text: formatted,
                                      selection: TextSelection.collapsed(
                                        offset: formatted.length,
                                      ),
                                    );
                              }
                            },
                            validator: (v) {
                              if (v == null || v.isEmpty) {
                                return 'Card number is required';
                              }
                              final clean = v.replaceAll(' ', '');
                              if (clean.length < 13) {
                                return 'Invalid card number';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 12),
                          _buildField(
                            controller: _cardHolderCtrl,
                            label: 'Cardholder Name',
                            hint: 'e.g. Jane Doe',
                            icon: Icons.person_rounded,
                            validator: (v) =>
                                v == null || v.trim().isEmpty
                                    ? 'Cardholder name is required'
                                    : null,
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: _buildField(
                                  controller: _expiryCtrl,
                                  label: 'Expiry Date',
                                  hint: 'MM/YY',
                                  icon: Icons.calendar_today_rounded,
                                  keyboardType: TextInputType.datetime,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(4),
                                  ],
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return 'Required';
                                    }
                                    if (v.length < 4) return 'MM/YY required';
                                    return null;
                                  },
                                  onChanged: (v) {
                                    if (v.length == 2 &&
                                        !_expiryCtrl.text.endsWith('/')) {
                                      _expiryCtrl.text = '$v/';
                                      _expiryCtrl.selection =
                                          TextSelection.fromPosition(
                                            TextPosition(
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
                                    if (v == null || v.isEmpty) return 'Required';
                                    if (v.length != 3) return 'Invalid';
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
                    backgroundColor: isDark ? AppThemes.primaryGreen : const Color(0xFF53B175),
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shadowColor: (isDark ? AppThemes.primaryGreen : const Color(0xFF53B175)).withValues(alpha: 0.4),
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

            const SizedBox(height: 32),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      key: key,
      decoration: BoxDecoration(
        color: isDark ? AppThemes.darkCardSurface : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark ? AppThemes.darkCardBorder : Colors.transparent,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black26 : Colors.black.withValues(alpha: 0.06),
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
              Icon(
                icon,
                color: isDark ? AppThemes.primaryGreen : const Color(0xFF53B175),
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: isDark ? Colors.white : const Color(0xFF181725),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      maxLines: maxLines,
      onChanged: onChanged,
      style: TextStyle(
        color: isDark ? Colors.white : const Color(0xFF181725),
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: isDark ? AppThemes.darkTextSecondary : Colors.grey.shade600,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
        ),
        prefixIcon: Icon(
          icon,
          color: isDark ? AppThemes.primaryGreen : const Color(0xFF53B175),
          size: 20,
        ),
        filled: true,
        fillColor: isDark ? AppThemes.darkInputBg : const Color(0xFFF8F9FB),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? AppThemes.darkCardBorder : Colors.grey.shade200,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? AppThemes.darkCardBorder : Colors.grey.shade200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: isDark ? AppThemes.primaryGreen : const Color(0xFF53B175),
            width: 1.5,
          ),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final selected = _paymentMethod == value;
    return GestureDetector(
      onTap: () => setState(() => _paymentMethod = value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? color.withValues(alpha: isDark ? 0.18 : 0.08)
              : (isDark ? AppThemes.darkInputBg : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? color
                : (isDark ? AppThemes.darkCardBorder : Colors.grey.shade200),
            width: selected ? 1.8 : 1,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: isDark ? 0.2 : 0.12),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 20),
            ),
            const SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                color: selected
                    ? color
                    : (isDark ? Colors.white : const Color(0xFF181725)),
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
                  color: selected
                      ? color
                      : (isDark ? Colors.grey.shade600 : Colors.grey.shade400),
                  width: 2,
                ),
                color: selected
                    ? color
                    : (isDark ? AppThemes.darkInputBg : Colors.white),
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
