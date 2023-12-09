import 'package:equatable/equatable.dart';

abstract class BannerEvents extends Equatable {
  const BannerEvents();

  @override
  List<Object> get props => [];
}

class FetchBanners extends BannerEvents {}
