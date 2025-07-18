import 'package:app/component/bottom_dialog.dart';
import 'package:app/component/main_button.dart';
import 'package:app/feature/auth/login/view/login_page.dart';
import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class ProfileDeleteAkun extends StatefulWidget {
  @override
  _ProfileDeleteAkunState createState() => _ProfileDeleteAkunState();
}

class _ProfileDeleteAkunState extends State<ProfileDeleteAkun> {
  String? selectedReason;
  bool _obscurePassword = true;
  final TextEditingController _passwordController = TextEditingController();

  final List<String> reasons = [
    'Ingin menghapus data pribadi',
    'Tidak puas dengan layanan',
    'Ingin membuat akun baru',
    'Lainnya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: appText('Hapus Akun'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hapus akun saya secara permanen',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            const Text('Hai, Ramata.', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 24),
            const Text(
              'Mengapa Anda menghapus akun?',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedReason,
              hint: const Text('Pilih'),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
              items:
                  reasons.map((String reason) {
                    return DropdownMenuItem<String>(
                      value: reason,
                      child: Text(reason),
                    );
                  }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedReason = value;
                });
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Untuk melanjutkan, silakan masukkan kata sandi Anda',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: 'Kata Sandi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Ketika Anda menekan tombol di bawah ini, semua data akan dihapus pada 23 September 2024. '
              'Jika Anda berubah pikiran, Anda dapat masuk kembali sebelum tanggal itu dan akun Anda akan diaktifkan kembali.',
              style: TextStyle(color: Color(0xff271B09), fontSize: 12),
            ),
            const Spacer(),
            MainButton(
              text: 'Hapus Akun',
              onPressed: () {
                showDeleteAccount(
                  context,
                  onConfirm: () {
                    showAppSnackBar(context, message: 'Sukses Menghapus akun');
                    backToMainPage(context, LoginPage());
                  },
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
