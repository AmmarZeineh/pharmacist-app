class OrderModel {
  final int id;
  final String status;
  final String paymentStatus;
  final OrderItems orderItems;

  OrderModel(
      {required this.id,
      required this.status,
      required this.paymentStatus,
      required this.orderItems});

  factory OrderModel.fromJson(jsonData, int i) {
    return OrderModel(
      id: jsonData['orders'][i]['order_id'],
      status: jsonData['orders'][i]['status'],
      paymentStatus: jsonData['orders'][i]['payment_status'],
      orderItems: OrderItems.fromJson(jsonData['orders'][i]['order_items'][0]),
    );
  }
}

class OrderItems {
  final String commercialName;
  final int quantity;

  OrderItems({required this.commercialName, required this.quantity});
  factory OrderItems.fromJson(jsonData) {
    return OrderItems(
      commercialName: jsonData['commercial_name'],
      quantity: jsonData['quantity'],
    );
  }
}
