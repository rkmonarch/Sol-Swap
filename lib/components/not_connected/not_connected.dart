import 'package:flutter/material.dart';
import 'package:Sol_Swap/resources/ui_helpers.dart';
import 'package:Sol_Swap/utils/logger.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'package:url_launcher/url_launcher.dart';

class NotConnected extends StatefulWidget {
  final PhantomConnect phantomConnectInstance;
  const NotConnected({super.key, required this.phantomConnectInstance});

  @override
  State<NotConnected> createState() => _NotConnectedState();
}

class _NotConnectedState extends State<NotConnected> {
  connectWallet() async {
    Uri launchUri = widget.phantomConnectInstance
        .generateConnectUri(cluster: 'devnet', redirect: '/connected');
    logger.d(launchUri);
    await launchUrl(
      launchUri,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            vSpaceLarge,
            Text(
              "Get better\nwith Solana.",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/solana2.png'),
                ),
              ],
            ),
            vSpaceMassive,
            vSpaceMassive,
            vSpaceMedium,
            Center(
              child: ElevatedButton.icon(
                onPressed: connectWallet,
                label: const Text("Connect Wallet"),
                icon: const Icon(Icons.link),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 50),
                  elevation: 4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
