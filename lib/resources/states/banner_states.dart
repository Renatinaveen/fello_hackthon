import 'package:equatable/equatable.dart';
import 'package:fello_hackthon/model/banners_model.dart';

abstract class BannerStates extends Equatable {
  const BannerStates();

  @override
  List<Object> get props => [];
}

class BannerUninitialized extends BannerStates {}

class FetchingBanners extends BannerStates {}

class FetchedBanners extends BannerStates {
  final SipBannerModel banners;

  const FetchedBanners({required this.banners});

  @override
  List<Object> get props => [banners];
}

class FailedToFetchBanners extends BannerStates {}
