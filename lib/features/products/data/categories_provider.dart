import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/supabase_service.dart';
import '../domain/category.dart';

part 'categories_provider.g.dart';

/// Provider for fetching all categories
@riverpod
Future<List<Category>> categories(Ref ref) async {
  final response = await SupabaseService().client
      .from('categories')
      .select()
      .order('display_order', ascending: true);

  return (response as List)
      .map((json) => Category.fromJson(json as Map<String, dynamic>))
      .toList();
}

/// Provider for fetching a single category by ID
@riverpod
Future<Category?> categoryById(Ref ref, String categoryId) async {
  final response = await SupabaseService().client
      .from('categories')
      .select()
      .eq('id', categoryId)
      .maybeSingle();

  if (response == null) return null;
  return Category.fromJson(response);
}
