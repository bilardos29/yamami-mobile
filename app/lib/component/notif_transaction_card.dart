import 'package:flutter/material.dart';

enum TransactionStatus {
  waitingPayment,
  paymentSuccess,
  onProcess,
  onDelivery,
  done,
}

class TransactionNotificationCard extends StatelessWidget {
  final TransactionStatus status;
  final String title;
  final String? message;
  final String time;
  final String? dateText;
  final String? imageUrl;
  final String? itemTitle;
  final String? actionText;
  final VoidCallback? onActionPressed;

  const TransactionNotificationCard({
    super.key,
    required this.status,
    required this.title,
    required this.time,
    this.message,
    this.dateText,
    this.imageUrl,
    this.itemTitle,
    this.actionText,
    this.onActionPressed,
  });

  Color _getColor() {
    switch (status) {
      case TransactionStatus.waitingPayment:
        return Colors.orange;
      case TransactionStatus.paymentSuccess:
        return Colors.green;
      case TransactionStatus.onProcess:
        return Colors.blue;
      case TransactionStatus.onDelivery:
        return Colors.indigo;
      case TransactionStatus.done:
        return Colors.green;
    }
  }

  IconData _getIcon() {
    switch (status) {
      case TransactionStatus.waitingPayment:
        return Icons.receipt_long;
      default:
        return Icons.assignment;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: _getColor().withOpacity(0.1),
                radius: 16,
                child: Icon(_getIcon(), color: _getColor(), size: 18),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: const Icon(
                  Icons.fiber_manual_record,
                  color: Colors.red,
                  size: 10,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(message != null) ...[
                      Text(
                        message ?? '',
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 12,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    if (imageUrl != null && itemTitle != null) Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F7FA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            child: Image.asset(
                              'asset/images/$imageUrl',
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              itemTitle!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                          if (actionText != null)
                            TextButton(
                              onPressed: onActionPressed,
                              child: Text(
                                actionText!,
                                style: TextStyle(
                                  color:
                                  Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (dateText != null) Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F7FA),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          Icon(Icons.info, color: Colors.orange, size: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 14,
                            ),
                            child: VerticalDivider(
                              color: Colors.black12,
                              thickness: 1,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              dateText!,
                              style: const TextStyle(
                                fontSize: 14,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      time,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff52575C),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
