class QuantityState {
  final int quantity;
  final double unitPrice;

  double get total => quantity * unitPrice;

  const QuantityState({required this.quantity, required this.unitPrice});

  QuantityState copyWith({int? quantity, double? unitPrice}) {
    return QuantityState(
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
    );
  }
}

/// ====== UI (Second Screen) ======
