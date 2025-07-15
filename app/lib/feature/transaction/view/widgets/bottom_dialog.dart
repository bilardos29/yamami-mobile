import 'package:flutter/material.dart';

class BottomDialog extends StatelessWidget {
  final String status;
  final List<OrderStep> steps;

  const BottomDialog({super.key, required this.status, required this.steps});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: steps.length == 2 ? 0.3 : 0.5,
      maxChildSize: 0.95,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          padding: const EdgeInsets.all(16),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const Text(
                'Status Pesanan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ...steps.map((step) => _buildStepItem(step)).toList(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildStepItem(OrderStep step) {
    final isCompleted = step.status == OrderStepStatus.completed;
    final isCurrent = step.status == OrderStepStatus.current;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Icon(
                isCompleted ? Icons.check_circle : Icons.circle,
                color: isCompleted || isCurrent ? Colors.green : Colors.grey,
                size: 14,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        step.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        step.date,
                        style: const TextStyle(
                          color: Color(0xff4A4337),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  if (step.subtitle != null || step.mapUrl != null) ...[
                    const SizedBox(height: 12),
                    if (step.subtitle != null)
                      Text(
                        step.subtitle!,
                        style: const TextStyle(color: Colors.black87),
                      ),
                    if (step.mapUrl != null) ...[
                      const SizedBox(height: 12),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('asset/images/${step.mapUrl!}'),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'asset/images/${step.courierImage}',
                            ),
                          ),
                          SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(step.courierName ?? ''),
                              Text(step.courierInfo ?? '')
                            ],
                          )
                        ],
                      ),
                    ],
                    Divider(height: 30),
                  ],
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}

enum OrderStepStatus { completed, current, pending }

class OrderStep {
  final String title;
  final String date;
  final String? subtitle;
  final String? mapUrl;
  OrderStepStatus status;
  final String? courierName;
  final String? courierInfo;
  final String? courierImage;

  OrderStep({
    required this.title,
    required this.date,
    this.subtitle,
    this.mapUrl,
    required this.status,
    this.courierName,
    this.courierInfo,
    this.courierImage,
  });
}
