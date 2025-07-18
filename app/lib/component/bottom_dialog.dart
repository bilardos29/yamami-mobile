import 'package:app/component/add_cart_bottom_dialog.dart';
import 'package:app/component/delete_account_bottom.dart';
import 'package:app/component/lihat_pembayaran_bottom_dialog.dart';
import 'package:app/component/sort_bottom_dialog.dart';
import 'package:flutter/material.dart';

void showSortDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SortBottomDialog(
        selectedIndex: 0, // misal default "Paling Sesuai"
        onSelect: (int index) {
          print("Selected Index: $index");
          // lakukan sesuatu
        },
      );
    },
  );
}

void showPaymentInstructionSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return const LihatPembayaranBottomDialog();
    },
  );
}

void showAddToCartBottomSheet(BuildContext context, String modeCart) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) => AddCartBottomDialog(modeCart: modeCart),
  );
}

void showDeleteAccount(BuildContext context, {VoidCallback? onConfirm}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return DeleteAccountBottom(
        onConfirm: () {
          onConfirm!();
        },
        onCancel: () {
          Navigator.pop(context);
        },
      );
    },
  );
}


