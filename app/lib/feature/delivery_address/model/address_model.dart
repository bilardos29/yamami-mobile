class AddressModel {
  final String name;
  final String phone;
  final String address;
  bool isPrimary;

  AddressModel({
    required this.name,
    required this.phone,
    required this.address,
    this.isPrimary = false,
  });
}