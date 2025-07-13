import 'package:app/feature/delivery_address/model/address_model.dart';
import 'package:app/feature/delivery_address/view/find_location_page.dart';
import 'package:app/feature/delivery_address/view/pin_point_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class AddOrEditAddressPage extends StatefulWidget {
  final AddressModel? address;

  const AddOrEditAddressPage({this.address, super.key});

  @override
  _AddOrEditAddressPageState createState() => _AddOrEditAddressPageState();
}

class _AddOrEditAddressPageState extends State<AddOrEditAddressPage> {
  final _formKey = GlobalKey<FormState>();
  bool isPrimary = false;
  bool isPinpointed = false;
  String? selectedRegion;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final TextEditingController labelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isFormValid =
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        selectedRegion != null &&
        addressController.text.isNotEmpty;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: appText('Alamat Pengiriman')),
      body: Form(
        key: _formKey,
        onChanged: () => setState(() {}),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          children: [
            const Text('Nama Penerima'),
            const SizedBox(height: 6),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Masukkan nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Nomor Telepon
            const Text('Nomor Telepon'),
            const SizedBox(height: 6),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                hintText: 'Masukkan nama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Provinsi, Kota, Kecamatan, Kode Pos'),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () {
                nextPage(context, FindLocationPage());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Text(
                      selectedRegion ?? 'Pilih',
                      style: TextStyle(
                        color:
                            selectedRegion == null ? Colors.grey : Colors.black,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Nama Jalan
            const Text('Nama Jalan, Gedung, No. Rumah'),
            const SizedBox(height: 6),
            TextFormField(
              controller: addressController,
              maxLines: 2,
              decoration: const InputDecoration(
                hintText: 'cth : Jalan sukabumi no 24, RT01 RW 24',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Detail Lainnya
            const Text('Detail Lainnya'),
            const SizedBox(height: 6),
            TextFormField(
              controller: detailController,
              decoration: const InputDecoration(
                hintText: 'cth : Blok / Unit No, Patokan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Label Alamat
            const Text('Label Alamat'),
            const SizedBox(height: 6),
            TextFormField(
              controller: labelController,
              decoration: const InputDecoration(
                hintText: 'cth : Rumah, Apartemen, Kantor, Kos',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Pinpoint
            const Text('Pinpoint'),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: () {
                nextPage(context, PinPointPage());
                // setState(() {
                //   isPinpointed = true;
                // });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Text(
                      isPinpointed ? 'Pin sudah ditentukan' : 'Pinpoint alamat',
                      style: TextStyle(
                        color: isPinpointed ? Colors.black : Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Atur',
                      style: TextStyle(
                        color: Color(0xFFD4A437),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Checkbox
            Row(
              children: [
                Checkbox(
                  value: isPrimary,
                  onChanged: (val) => setState(() => isPrimary = val ?? false),
                ),
                const Text('Jadikan alamat utama'),
              ],
            ),
            const SizedBox(height: 8),

            // Tombol Simpan
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    isFormValid
                        ? () {
                          // Simpan data
                        }
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD4A437),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  elevation: 0,
                  disabledBackgroundColor: Colors.grey.shade300,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    'Simpan',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
