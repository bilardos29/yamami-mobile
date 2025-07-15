import 'package:app/utils/utils.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String status;
  final Color statusColor;
  final String invoice;
  final String timeLimit;
  final String storeName;
  final String productName;
  final String quantity;
  final String additional;
  final String total;
  final VoidCallback onClick;

  const TransactionCard({
    super.key,
    required this.status,
    required this.statusColor,
    required this.invoice,
    required this.timeLimit,
    required this.storeName,
    required this.productName,
    required this.quantity,
    required this.additional,
    required this.total,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    if (invoice.isNotEmpty)
                      Text(
                        invoice!,
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                  ],
                ),
                const SizedBox(height: 14),
                dividerLine(padding: 0),
                const SizedBox(height: 16),
                if (timeLimit.isNotEmpty) ...[
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info, size: 18, color: Colors.orange),
                        const SizedBox(width: 16),
                        Text(
                          "Sebelum $timeLimit",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                Text(
                  storeName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        'asset/images/img_5.png',
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(quantity),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(additional, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Total Belanja',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        total,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
