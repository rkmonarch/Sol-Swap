part of 'nft_bloc.dart';

@immutable
abstract class NftEvent {}

class GetNFTEvent extends NftEvent {
  String NFTAddress;
  GetNFTEvent({required this.NFTAddress});
}

class GetClaimEvent extends NftEvent {
  String walletAddress;
  GetClaimEvent({required this.walletAddress});
}