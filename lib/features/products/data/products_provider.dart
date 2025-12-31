import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/supabase_service.dart';
import '../domain/product.dart';

part 'products_provider.g.dart';

/// Provider for fetching all available products
@riverpod
Future<List<Product>> products(Ref ref) async {
  final response = await SupabaseService().client
      .from('products')
      .select('*, categories(*)')
      .eq('is_available', true)
      .order('created_at', ascending: false);

  return (response as List)
      .map((json) => Product.fromJson(json as Map<String, dynamic>))
      .toList();
}

/// Provider for fetching featured/recommended products
@riverpod
Future<List<Product>> featuredProducts(Ref ref) async {
  final response = await SupabaseService().client
      .from('products')
      .select('*, categories(*)')
      .eq('is_available', true)
      .eq('is_featured', true)
      .order('rating', ascending: false)
      .limit(10);

  return (response as List)
      .map((json) => Product.fromJson(json as Map<String, dynamic>))
      .toList();
}

/// Provider for fetching products by category
@riverpod
Future<List<Product>> productsByCategory(Ref ref, String categoryId) async {
  final response = await SupabaseService().client
      .from('products')
      .select('*, categories(*)')
      .eq('is_available', true)
      .eq('category_id', categoryId)
      .order('rating', ascending: false);

  return (response as List)
      .map((json) => Product.fromJson(json as Map<String, dynamic>))
      .toList();
}

/// Provider for fetching a single product by ID
@riverpod
Future<Product?> productById(Ref ref, String productId) async {
  final response = await SupabaseService().client
      .from('products')
      .select('*, categories(*)')
      .eq('id', productId)
      .maybeSingle();

  if (response == null) return null;
  return Product.fromJson(response);
}

/// Provider for searching products
@riverpod
Future<List<Product>> searchProducts(Ref ref, String query) async {
  if (query.trim().isEmpty) {
    return [];
  }

  final response = await SupabaseService().client
      .from('products')
      .select('*, categories(*)')
      .eq('is_available', true)
      .ilike('name', '%$query%')
      .order('rating', ascending: false)
      .limit(20);

  return (response as List)
      .map((json) => Product.fromJson(json as Map<String, dynamic>))
      .toList();
}

/// Notifier for managing search query state
@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void setQuery(String query) {
    state = query;
  }

  void clear() {
    state = '';
  }
}

/// Provider for selected category filter
@riverpod
class SelectedCategory extends _$SelectedCategory {
  @override
  String? build() => null;

  void select(String? categoryId) {
    state = categoryId;
  }
}
