import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phantom_demo/Bloc/bloc/account_bloc.dart';
import 'package:flutter_phantom_demo/components/screens/screens.dart';
import 'package:flutter_phantom_demo/components/screens/sign_and_send_transaction/sign_and_send_tx.dart';
import 'package:flutter_phantom_demo/components/screens/sign_in_message/sign_in_message.dart';
import 'package:flutter_phantom_demo/components/screens/sign_transaction/sign_tx.dart';
import 'package:flutter_phantom_demo/providers/screen_provider.dart';
import 'package:flutter_phantom_demo/providers/wallet_state_provider.dart';
import 'package:flutter_phantom_demo/resources/ui_helpers.dart';
import 'package:phantom_connect/phantom_connect.dart';
import 'package:provider/provider.dart';
import 'package:solana/encoder.dart';
import 'package:solana/solana.dart';
import 'package:url_launcher/url_launcher.dart';

class Connected extends StatefulWidget {
  final PhantomConnect phantomConnectInstance;
  const Connected({super.key, required this.phantomConnectInstance});

  @override
  State<Connected> createState() => _ConnectedState();
}

class _ConnectedState extends State<Connected> {
  @override
  void initState() {
    BlocProvider.of<AccountBloc>(context).add(
        getBalanceEvent(pubkey: widget.phantomConnectInstance.userPublicKey));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scrrenProvider = Provider.of<ScreenProvider>(context, listen: true);

    return Container(
        color: Colors.black, child: _buildScreen(scrrenProvider.currentScreen));
  }

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

  Widget _buildScreen(Screens screen) {
    switch (screen) {
      case Screens.send:
        return SignAndSendTransactionScreen(
            phantomConnectInstance: widget.phantomConnectInstance);
      case Screens.message:
        return SignInMessageScreen(
            phantomConnectInstance: widget.phantomConnectInstance);
      case Screens.sign:
        return SignTransactionScreen(
            phantomConnectInstance: widget.phantomConnectInstance);
      default:
        return Center(
          child: Column(
            children: [
              BlocBuilder<AccountBloc, AccountState>(
                builder: (context, state) {
                  if (state is balanceLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  } else if (state is balanceSuccess) {
                    var amount = state.model.result!.value!;
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          vSpaceMedium,
                          Text(
                            "Total Balance",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Container(
                            child: Text(
                              (amount / lamportsPerSol).toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40),
                            ),
                          ),
                          vSpaceMedium,
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              label: const Text("Connect Wallet"),
                              icon: const Icon(Icons.link),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(500, 50),
                                elevation: 4,
                              ),
                            ),
                          ),
                          vSpaceMassive,
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        );
    }
  }
}
