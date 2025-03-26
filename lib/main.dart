import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Run WhatsApp')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              var whatsappNumber = "+02099487362"; // Replace with actual number
              var whatsappUrl = "https://wa.me/$whatsappNumber";

              if (await canLaunchUrl(Uri.parse(whatsappUrl))) {
                await launchUrl(
                  Uri.parse(whatsappUrl),
                  mode: LaunchMode.externalApplication,
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Could not open WhatsApp")),
                );
              }
            },
            child: const Text("Open WhatsApp"),
          ),
        ),
      ),
    );
  }
}
