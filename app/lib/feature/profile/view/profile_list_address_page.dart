import 'package:app/component/border_button.dart';
import 'package:app/component/custom_text_button.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/delivery_address/model/address_model.dart';
import 'package:app/feature/delivery_address/view/add_or_edit_address_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfileListAddressPage extends StatefulWidget {
  @override
  _ProfileListAddressPageState createState() => _ProfileListAddressPageState();
}

class _ProfileListAddressPageState extends State<ProfileListAddressPage> {
  List<AddressModel> addresses = [
    AddressModel(
      name: 'Raska Amelia',
      phone: '087878793893',
      address:
          'Rumah - Jalan Supratman No 31, RT 23 RW 23,\nKel.Cibeunying, Kec Cimenyan, Bandung, Jawa barat',
      isPrimary: true,
    ),
    AddressModel(
      name: 'Amelia',
      phone: '087878793893',
      address:
          'Rumah - Jalan Supratman No 31, RT 23 RW 23,\nKel.Cibeunying, Kec Cimenyan, Bandung, Jawa barat',
    ),
  ];

  void setAsPrimary(int index) {
    setState(() {
      for (var i = 0; i < addresses.length; i++) {
        addresses[i].isPrimary = i == index;
      }
    });
  }

  void deleteAddress(int index) {
    showDeleteAddressSheet();
  }

  void editAddress(int index) {
    // Navigasi ke halaman edit (tidak diimplementasikan di sini)
  }

  void addAddress() {
    nextPage(context, AddOrEditAddressPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: appText('Alamat Pengiriman'),
        actions: [
          CustomTextButton(text: 'Tambah', onClick: addAddress),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          final address = addresses[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${address.name} - ${address.phone}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff271B09),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  address.address,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xff8C867D),
                  ),
                ),
                const SizedBox(height: 12),
                if (address.isPrimary)
                  Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        size: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'Alamat utama',
                        style: TextStyle(
                          color: Color(0xFFD4A437),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      CustomTextButton(
                        text: 'Ubah',
                        onClick: () => editAddress(index),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      CustomTextButton(
                        text: 'Jadikan alamat utama',
                        onClick: () => setAsPrimary(index),
                      ),
                      const Spacer(),
                      CustomTextButton(
                        text: 'Hapus',
                        onClick: () => deleteAddress(index),
                      ),
                      const SizedBox(width: 16),
                      CustomTextButton(
                        text: 'Ubah',
                        onClick: () => editAddress(index),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  void showDeleteAddressSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hapus Alamat',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(height: 32),
                  const Text(
                    'Apa anda yakin menghapus alamat ini?',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: MainButton(
                      text: 'Kembali',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: BorderButton(
                      text: 'Ya',
                      onPressed: () {
                        Navigator.pop(context);
                        // setState(() {
                        //   addresses.removeAt(index);
                        // });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
