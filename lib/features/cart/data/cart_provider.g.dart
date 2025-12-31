// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier for managing cart state

@ProviderFor(CartNotifier)
final cartProvider = CartNotifierProvider._();

/// Notifier for managing cart state
final class CartNotifierProvider
    extends $AsyncNotifierProvider<CartNotifier, List<CartItem>> {
  /// Notifier for managing cart state
  CartNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartNotifierHash();

  @$internal
  @override
  CartNotifier create() => CartNotifier();
}

String _$cartNotifierHash() => r'9a6413fb925a7812c8826c0e4c65b361276e2546';

/// Notifier for managing cart state

abstract class _$CartNotifier extends $AsyncNotifier<List<CartItem>> {
  FutureOr<List<CartItem>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<CartItem>>, List<CartItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<CartItem>>, List<CartItem>>,
              AsyncValue<List<CartItem>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Provider for cart item count

@ProviderFor(cartItemCount)
final cartItemCountProvider = CartItemCountProvider._();

/// Provider for cart item count

final class CartItemCountProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// Provider for cart item count
  CartItemCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartItemCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartItemCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return cartItemCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cartItemCountHash() => r'3daa982e80aa534e0682ebfe7a558e2c01b320d3';

/// Provider for cart subtotal

@ProviderFor(cartSubtotal)
final cartSubtotalProvider = CartSubtotalProvider._();

/// Provider for cart subtotal

final class CartSubtotalProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  /// Provider for cart subtotal
  CartSubtotalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartSubtotalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartSubtotalHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return cartSubtotal(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$cartSubtotalHash() => r'6a6f656707bec7c468c4e995e5648dacda84620a';

/// Provider for delivery fee

@ProviderFor(deliveryFee)
final deliveryFeeProvider = DeliveryFeeProvider._();

/// Provider for delivery fee

final class DeliveryFeeProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  /// Provider for delivery fee
  DeliveryFeeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'deliveryFeeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$deliveryFeeHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return deliveryFee(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$deliveryFeeHash() => r'7f706980231c36f1b90dd6e5efd199867a1415e0';

/// Provider for cart total

@ProviderFor(cartTotal)
final cartTotalProvider = CartTotalProvider._();

/// Provider for cart total

final class CartTotalProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  /// Provider for cart total
  CartTotalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartTotalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartTotalHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return cartTotal(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$cartTotalHash() => r'a338ef1a2430a2b303f1bbf143ddb2055f709106';
