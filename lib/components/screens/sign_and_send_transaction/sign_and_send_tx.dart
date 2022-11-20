import 'package:flutter/material.dart';
import 'package:Sol_Swap/components/screens/create_contact.dart';
import 'package:Sol_Swap/components/styled_text_feild.dart';
import 'package:Sol_Swap/providers/wallet_state_provider.dart';
import 'package:Sol_Swap/resources/app_assets.dart';
import 'package:Sol_Swap/resources/ui_helpers.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'package:provider/provider.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';
import 'package:url_launcher/url_launcher.dart';

class SignAndSendTransactionScreen extends StatefulWidget {
  final PhantomConnect phantomConnectInstance;
  final String pubkey;
  const SignAndSendTransactionScreen(
      {super.key, this.pubkey = '', required this.phantomConnectInstance});

  @override
  State<SignAndSendTransactionScreen> createState() =>
      _SignAndSendTransactionScreenState();
}

class _SignAndSendTransactionScreenState
    extends State<SignAndSendTransactionScreen> {
  // User input
  TextEditingController walletAddressController = TextEditingController();
  TextEditingController solAmountController = TextEditingController();

  signAndSendTransaction(WalletStateProvider walletStateProvider) async {
    int amount =
        ((double.parse(solAmountController.text)) * lamportsPerSol).toInt();
    final transferIx = SystemInstruction.transfer(
        fundingAccount: Ed25519HDPublicKey.fromBase58(
            widget.phantomConnectInstance.userPublicKey),
        recipientAccount:
            Ed25519HDPublicKey.fromBase58(walletAddressController.text),
        lamports: amount);
    final message = Message.only(transferIx);
    final blockhash = await RpcClient('https://api.devnet.solana.com')
        .getRecentBlockhash()
        .then((b) => b.blockhash);
    final compiled = message.compile(recentBlockhash: blockhash);

    final tx = SignedTx(
      messageBytes: compiled.data,
      signatures: [
        Signature(
          List.filled(64, 0),
          publicKey: Ed25519HDPublicKey.fromBase58(
              widget.phantomConnectInstance.userPublicKey),
        )
      ],
    ).encode();

    var launchUri = widget.phantomConnectInstance
        .generateSignAndSendTransactionUri(
            transaction: tx, redirect: '/signAndSendTransaction');
    await launchUrl(
      launchUri,
      mode: LaunchMode.externalApplication,
    );
  }

  @override
  void initState() {
    walletAddressController.text = widget.pubkey;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final walletState =
        Provider.of<WalletStateProvider>(context, listen: false);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CreateContactScreen()));
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: contactsGloble.length,
                  itemBuilder: (BuildContext, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            hSpaceSmall,
                            Container(
                              width: 190,
                              child: Text(
                                contactsGloble.elementAt(index)['name'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            hSpaceMassive,
                            InkWell(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              splashColor: Colors.white12,
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 0,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                  ),
                                  child: const Icon(Icons.send,
                                      color: Colors.white),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  walletAddressController.text = contactsGloble
                                      .elementAt(index)['address'];
                                });
                                showDialog(
                                    context: context,
                                    builder: (builder) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        actions: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.0, vertical: 30),
                                            child: Column(
                                              children: [
                                                styledTextFeild(
                                                    walletAddressController,
                                                    "User Wallet Address",
                                                    TextInputType.number,
                                                    true,
                                                    "Enter User wallet Address",
                                                    Icons.wallet),
                                                const SizedBox(height: 10),
                                                styledTextFeild(
                                                    solAmountController,
                                                    "1 SOL = 1,000,000,000 LAMPORTS",
                                                    TextInputType.number,
                                                    false,
                                                    "Enter amount to send in SOL",
                                                    Icons.circle_outlined),
                                                const SizedBox(height: 10),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    signAndSendTransaction(
                                                        walletState);
                                                    solAmountController.clear();
                                                    walletAddressController
                                                        .clear();
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                      "Sign and Send"),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    });
                              },
                            ),
                          ],
                        ),
                        vSpaceSmall,
                        Text(
                          (contactsGloble.elementAt(index)['address']),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        vSpaceSmall,
                        Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                        vSpaceSmall
                      ],
                    );
                  }),
            ],
          ),
        ));
  }
}
