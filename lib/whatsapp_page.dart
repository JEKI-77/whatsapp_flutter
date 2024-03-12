import 'package:flutter/material.dart';
import 'package:ui_whatsapp/theme/theme.dart';
import 'package:ui_whatsapp/widget/call_view.dart';
import 'package:ui_whatsapp/widget/chat_view.dart';
import 'package:ui_whatsapp/widget/status.dart';

class WhatsAppPage extends StatefulWidget {
  const WhatsAppPage({super.key});

  @override
  State<WhatsAppPage> createState() => _WhatsAppPageState();
}

class _WhatsAppPageState extends State<WhatsAppPage>
    with SingleTickerProviderStateMixin {
  final tabs = const [
    Tab(
      icon: Icon(Icons.camera_alt),
    ),
    Tab(text: "CHAT"),
    Tab(text: "STATUS"),
    Tab(text: "CALL"),
  ];

  TabController? tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController?.index = 1;
    tabController?.addListener(() {
      setState(() {
        switch (tabController?.index) {
          case 0:
            fabIcon = Icons.camera;
            break;
          case 1:
            fabIcon = Icons.message;
            break;
          case 2:
            fabIcon = Icons.camera_alt;
            break;
          case 3:
            fabIcon = Icons.call;
            break;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whatsappGreen,
        title: const Text("Whatsapp"),
        actions: const [
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.more_vert),
          )
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: tabs,
          indicatorColor: Colors.white,
        ),
      ),
      body: TabBarView(controller: tabController, children: const [
        Center(child: Icon(Icons.camera_alt)),
        // Center(child: Icon(Icons.message)),
        ChatView(),
        // Center(child: Icon(Icons.timeline)),
        StatusView(),
        // Center(child: Icon(Icons.call)),
        CallView()
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: whatsappLightGreen,
        child: Icon(fabIcon),
      ),
    );
  }
}
