

class InvoiceData {
  final String id;
  final String orderNumber;
  final String date;
  final String paymentMethod;
  final String customerName;
  final String customerAdress;

  const InvoiceData({
    required this.id,
    required this.orderNumber,
    required this.date,
    required this.paymentMethod,
    required this.customerName,
    required this.customerAdress,
  });
}
