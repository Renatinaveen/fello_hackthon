import 'dart:convert';

import 'package:fello_hackthon/model/banners_model.dart';
import 'package:fello_hackthon/resources/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';

import '../../firebase_options.dart';

class BannersRepo {
  Future<SipBannerModel> fetchBanners() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.ensureInitialized();
      var res = await remoteConfig.fetchAndActivate();
      // Using default duration to force fetching from remote server.
      await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: Duration.zero,
      ));
      var remoteConfigData = remoteConfig.getString(Constants.sipBanner);
      if (!kReleaseMode) {
        debugPrint('app_config: $remoteConfigData');
      }
      var decodedData = jsonDecode(remoteConfigData);
      var bannerData = SipBannerModel.fromJson(decodedData);
      return bannerData;
    } catch (e) {
      if (kDebugMode) {
        print('error: $e');
      }
      rethrow;
    }
  }
}
