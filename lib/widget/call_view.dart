import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_whatsapp/models/chat.dart';
import 'package:ui_whatsapp/theme/theme.dart';

class CallView extends StatelessWidget {
  const CallView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatList.length,
      itemBuilder: (context, index) {
        final chat = chatList[index];
        return ListTile(
          leading: Image.network(
            (chat.image),
          ),
          title: Text(
            chat.name,
            style: cumstomTextStyle,
          ),
          subtitle: Text(
            chat.mostRecentMessage,
            style: const TextStyle(color: Colors.black45, fontSize: 16),
          ),
          trailing: const Padding(
              padding: EdgeInsets.only(bottom: 25),
              child: Icon(
                Icons.call,
                color: Colors.green,
              )),
        );
      },
    );
  }
}
