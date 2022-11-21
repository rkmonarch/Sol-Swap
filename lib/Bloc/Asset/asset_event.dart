part of 'asset_bloc.dart';

@immutable
abstract class AssetEvent {}

class getAssetEvent extends AssetEvent {
  final String coinname;
  getAssetEvent({required this.coinname});
}

class getAssetMarketEvent extends AssetEvent {
  final String coinname;
  getAssetMarketEvent({required this.coinname});
}

class GetAllAssets extends AssetEvent {}