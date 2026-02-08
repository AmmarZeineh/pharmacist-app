class MedicineModel {
  final String scientificName;
  final String commercialName;
  final String theManufactureCompany;
  final String quantity;
  final String expiryDate;
  final String price;
  final int categoryId;
  final int ownerId;
  final int medicineId;

  MedicineModel(
      {required this.categoryId,
      required this.medicineId,
      required this.ownerId,
      required this.scientificName,
      required this.commercialName,
      required this.theManufactureCompany,
      required this.quantity,
      required this.expiryDate,
      required this.price});

  factory MedicineModel.fromJson(jsonData) {
    return MedicineModel(
      medicineId: jsonData['id'],
        ownerId: jsonData['owner_id'],
        categoryId: jsonData['category_id'],
        scientificName: jsonData['scientific_name'],
        commercialName: jsonData['commercial_name'],
        theManufactureCompany: jsonData['company'],
        quantity: jsonData['quantity'],
        expiryDate: jsonData['exp_date'],
        price: jsonData['price']);
  }
}
