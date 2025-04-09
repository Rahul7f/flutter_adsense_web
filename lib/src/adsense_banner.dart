import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../models/ad_model.dart';

// Use conditional imports
import 'adsense_banner_stub.dart'
    if (dart.library.html) 'adsense_banner_web.dart';

class AdsenseBanner extends StatelessWidget {
  final AdModel adModel;

  const AdsenseBanner({Key? key, required this.adModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return createAdsenseBanner(adModel: adModel);
    } else {
      // Return placeholder for non-web platforms
      return SizedBox();
    }
  }
}
