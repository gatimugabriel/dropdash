import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/supabase_service.dart';
import '../../cart/data/cart_provider.dart';
import '../../cart/domain/cart_item.dart';
import '../domain/order.dart';

part 'orders_provider.g.dart';

/// Notifier for managing orders
@riverpod
class OrdersNotifier extends _$OrdersNotifier {
  @override
  Future<List<Order>> build() async {
    return _fetchOrders();
  }

  Future<List<Order>> _fetchOrders() async {
    final user = SupabaseService().client.auth.currentUser;
    if (user == null) return [];

    final response = await SupabaseService().client
        .from('orders')
        .select('*, order_items(*)')
        .eq('user_id', user.id)
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => Order.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Create a new order from cart items
  Future<Order?> createOrder({
    required List<CartItem> cartItems,
    required double totalAmount,
    String? deliveryAddress,
    String? deliveryNotes,
    String paymentMethod = 'cash',
  }) async {
    final user = SupabaseService().client.auth.currentUser;
    if (user == null) throw Exception('User not authenticated');

    if (cartItems.isEmpty) throw Exception('Cart is empty');

    // Create order
    final orderResponse = await SupabaseService().client
        .from('orders')
        .insert({
          'user_id': user.id,
          'status': 'pending',
          'total_amount': totalAmount,
          'delivery_address': deliveryAddress,
          'delivery_notes': deliveryNotes,
          'payment_method': paymentMethod,
        })
        .select()
        .single();

    final orderId = orderResponse['id'] as String;

    // Create order items
    final orderItems = cartItems
        .where((item) => item.product != null)
        .map(
          (item) => {
            'order_id': orderId,
            'product_id': item.productId,
            'product_name': item.product!.name,
            'quantity': item.quantity,
            'unit_price': item.product!.price,
          },
        )
        .toList();

    if (orderItems.isNotEmpty) {
      await SupabaseService().client.from('order_items').insert(orderItems);
    }

    // Clear cart after creating order
    await ref.read(cartProvider.notifier).clearCart();

    // Refresh orders
    state = AsyncValue.data(await _fetchOrders());

    // Fetch and return the created order
    final createdOrder = await SupabaseService().client
        .from('orders')
        .select('*, order_items(*)')
        .eq('id', orderId)
        .single();

    return Order.fromJson(createdOrder);
  }

  /// Refresh orders list
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await _fetchOrders());
  }
}

/// Provider for fetching a single order by ID
@riverpod
Future<Order?> orderById(Ref ref, String orderId) async {
  final response = await SupabaseService().client
      .from('orders')
      .select('*, order_items(*)')
      .eq('id', orderId)
      .maybeSingle();

  if (response == null) return null;
  return Order.fromJson(response);
}
