import 'package:fello_hackthon/resources/repository/banners_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/banners_model.dart';
import '../resources/events/banner_events.dart';
import '../resources/states/banner_states.dart';

class BannersBloc extends Bloc<BannerEvents, BannerStates> {
  final BannersRepo bannersRepo;

  BannersBloc()
      : bannersRepo = BannersRepo(),
        super(BannerUninitialized()) {
    on<FetchBanners>(_onFetchBanners);
  }
  _onFetchBanners(FetchBanners event, Emitter<BannerStates> emit) async {
    emit(FetchingBanners());
    try {
      final banners = await bannersRepo.fetchBanners();
      if (kDebugMode) {
        print('banners: $banners');
      }
      emit(FetchedBanners(banners: banners));
    } catch (e) {
      if (kDebugMode) {
        print('error fetching banners: $e');
      }
      emit(FailedToFetchBanners());
    }
  }
}
