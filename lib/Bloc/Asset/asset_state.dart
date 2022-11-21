part of 'asset_bloc.dart';

@immutable
abstract class AssetState {}

class AssetInitial extends AssetState {}

class AssetLoading extends AssetState {}

class AssetSuccess extends AssetState {
  final AssetResponse model;
  AssetSuccess({required this.model});
}

class AssetMarketLoading extends AssetState {}

class AssetMarketSuccess extends AssetState {
  final AssetPriceResponse model;
  AssetMarketSuccess({required this.model});
}

class AllAssetsLoading extends AssetState {}

class AllAssetsSuccess extends AssetState {
  final AllAssets model;
  AllAssetsSuccess({required this.model});
}
