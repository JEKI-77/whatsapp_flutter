import 'package:flutter/material.dart';
import 'package:ui_whatsapp/models/status.dart';
import 'package:ui_whatsapp/theme/theme.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: statusList.length,
      itemBuilder: (context, index) {
        final status = statusList[index];
        return ListTile(
          leading:
              const Icon(Icons.account_circle, color: Colors.black45, size: 48),
          title: Text(
            status.name,
            style: cumstomTextStyle,
          ),
          subtitle: Text(
            status.statudSate,
            style: const TextStyle(color: Colors.black45, fontSize: 16),
          ),
        );
      },
    );
  }
}
