import 'package:Sol_Swap/Bloc/NFT/nft_bloc.dart';
import 'package:Sol_Swap/main.dart';
import 'package:Sol_Swap/resources/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class NFT extends StatefulWidget {
  String nft_address;
  NFT({super.key, required this.nft_address});

  @override
  State<NFT> createState() => _NFTState();
}

class _NFTState extends State<NFT> {
  var data;
  @override
  void initState() {
    BlocProvider.of<NftBloc>(context)
        .add(GetNFTEvent(NFTAddress: widget.nft_address));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await storage.remove("PKEY");
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Congratulations, You got an NFT",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: BlocBuilder<NftBloc, NftState>(
          builder: (context, state) {
            if (state is NFTLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            } else if (state is NFTSuccess) {
              var data = state.model.metadata;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data?.name.toString() ?? "",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: screenHeight(context) * 0.3,
                      width: screenWidth(context) * 0.8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: NetworkImage(data?.image.toString() ?? ""),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      data?.description.toString() ?? "",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
