part of 'asset_bloc.dart';

@immutable
abstract class AssetEvent {}



class getAssetMarketEvent extends AssetEvent {
  final String coinname;
  getAssetMarketEvent({required this.coinname});
}

class GetAllAssets extends AssetEvent {}