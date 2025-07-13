import 'package:app/component/custom_text_button.dart';
import 'package:app/component/main_button.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChangeProfilePage extends StatefulWidget {
  @override
  _ChangeProfilePageState createState() => _ChangeProfilePageState();
}

class _ChangeProfilePageState extends State<ChangeProfilePage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  String gender = '';
  String email = 'user@email.com';
  DateTime? selectedDate;

  final List<String> genderOptions = ['Laki-laki', 'Perempuan'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: appText('Profil'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: ListView(
          children: [
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomTextButton(
                            text: 'Ubah Foto Profil',
                            onClick: () {},
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Ukuran file maksimum adalah 5 MB',
                            style: TextStyle(
                              color: Color(0xffA4A7AB),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            txtField(ctrl: _firstNameController, hint: 'Nama depan'),
            const SizedBox(height: 16),
            txtField(ctrl: _lastNameController, hint: 'Nama belakang'),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: gender.isNotEmpty ? gender : null,
              hint: const Text('Jenis kelamin'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items:
                  genderOptions.map((String gender) {
                    return DropdownMenuItem<String>(
                      value: gender,
                      child: Text(gender),
                    );
                  }).toList(),
              onChanged: (String? value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _birthDateController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: 'Tanggal Lahir',
                suffixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  String formattedDate = DateFormat(
                    'dd MMMM yyyy',
                  ).format(pickedDate);
                  setState(() {
                    selectedDate = pickedDate;
                    _birthDateController.text = formattedDate;
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            txtField(
              ctrl: _phoneController,
              keyboard: TextInputType.phone,
              hint: 'Nomor telepon',
            ),
            const SizedBox(height: 16),
            txtField(
              ctrl: TextEditingController(text: email),
              hint: 'Email',
              isReadOnly: true,
            ),
            const SizedBox(height: 24),
            MainButton(text: 'Simpan', onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget txtField({
    TextEditingController? ctrl,
    bool isReadOnly = false,
    String? hint,
    TextInputType keyboard = TextInputType.text,
  }) => TextField(
    readOnly: isReadOnly,
    decoration: InputDecoration(
      hintText: hint ?? '',
      filled: isReadOnly,
      fillColor: isReadOnly ? Color(0xFFF0F0F0) : Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    keyboardType: keyboard,
    controller: ctrl,
  );
}
