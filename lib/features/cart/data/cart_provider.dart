import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/supabase_service.dart';
import '../../products/domain/product.dart';
import '../domain/cart_item.dart';

part 'cart_provider.g.dart';

/// Notifier for managing cart state
@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  Future<List<CartItem>> build() async {
    return _fetchCartItems();
  }

  Future<List<CartItem>> _fetchCartItems() async {
    final user = SupabaseService().client.auth.currentUser;
    if (user == null) return [];

    final response = await SupabaseService().client
        .from('cart_items')
        .select('*, products(*, categories(*))')
        .eq('user_id', user.id)
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => CartItem.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Add a product to cart or increment quantity if already exists
  Future<void> addToCart(Product product, {int quantity = 1}) async {
    final user = SupabaseService().client.auth.currentUser;
    if (user == null) throw Exception('User not authenticated');

    // Check if item already exists in cart
    final existingItems = state.value ?? [];
    final existingItem = existingItems.firstWhere(
      (item) => item.productId == product.id,
      orElse: () => CartItem(id: '', userId: user.id, productId: product.id),
    );

    if (existingItem.id.isNotEmpty) {
      // Update quantity
      await SupabaseService().client
          .from('cart_items')
          .update({'quantity': existingItem.quantity + quantity})
          .eq('id', existingItem.id);
    } else {
      // Insert new item
      await SupabaseService().client.from('cart_items').insert({
        'user_id': user.id,
        'product_id': product.id,
        'quantity': quantity,
      });
    }

    // Refresh cart
    state = AsyncValue.data(await _fetchCartItems());
  }

  /// Update the quantity of an item in the cart
  Future<void> updateQuantity(String cartItemId, int quantity) async {
    if (quantity <= 0) {
      await removeFromCart(cartItemId);
      return;
    }

    await SupabaseService().client
        .from('cart_items')
        .update({'quantity': quantity})
        .eq('id', cartItemId);

    // Refresh cart
    state = AsyncValue.data(await _fetchCartItems());
  }

  /// Remove an item from the cart
  Future<void> removeFromCart(String cartItemId) async {
    await SupabaseService().client
        .from('cart_items')
        .delete()
        .eq('id', cartItemId);

    // Refresh cart
    state = AsyncValue.data(await _fetchCartItems());
  }

  /// Clear all items from the cart
  Future<void> clearCart() async {
    final user = SupabaseService().client.auth.currentUser;
    if (user == null) return;

    await SupabaseService().client
        .from('cart_items')
        .delete()
        .eq('user_id', user.id);

    state = const AsyncValue.data([]);
  }

  /// Refresh the cart
  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = AsyncValue.data(await _fetchCartItems());
  }
}

/// Provider for cart item count
@riverpod
int cartItemCount(Ref ref) {
  final cartAsync = ref.watch(cartProvider);
  return cartAsync.when(
    data: (items) => items.fold(0, (sum, item) => sum + item.quantity),
    loading: () => 0,
    error: (_, __) => 0,
  );
}

/// Provider for cart subtotal
@riverpod
double cartSubtotal(Ref ref) {
  final cartAsync = ref.watch(cartProvider);
  return cartAsync.when(
    data: (items) => items.fold(0.0, (sum, item) => sum + item.totalPrice),
    loading: () => 0.0,
    error: (_, __) => 0.0,
  );
}

/// Provider for delivery fee
@riverpod
double deliveryFee(Ref ref) {
  final subtotal = ref.watch(cartSubtotalProvider);
  // Free delivery for orders over $50
  return subtotal >= 50.0 ? 0.0 : 4.99;
}

/// Provider for cart total
@riverpod
double cartTotal(Ref ref) {
  final subtotal = ref.watch(cartSubtotalProvider);
  final deliveryFee = ref.watch(deliveryFeeProvider);
  return subtotal + deliveryFee;
}
