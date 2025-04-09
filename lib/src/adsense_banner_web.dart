import 'dart:js_interop';
import 'package:web/web.dart';
import 'dart:ui_web';
import 'package:flutter/material.dart';
import '../models/ad_model.dart';

Widget createAdsenseBanner({required AdModel adModel}) {
  return _AdsenseBanner(adModel: adModel);
}

class _AdsenseBanner extends StatelessWidget {
  final AdModel adModel;

  const _AdsenseBanner({required this.adModel});

  @override
  Widget build(BuildContext context) {
    // Register the view
    createAd();
    return SizedBox(
      width: adModel.width.toDouble(),
      height: adModel.height.toDouble(),
      child: HtmlElementView(viewType: adModel.divId),
    );
  }

  void createAd() {
    platformViewRegistry.registerViewFactory(adModel.divId, (int viewId) {
      // Dispatch the ad event to JS

      window.dispatchEvent(
        CustomEvent(
            'load-gpt-ad', CustomEventInit(detail: adModel.toMap().jsify())),
      );

      // Create the div placeholder
      final element = HTMLDivElement()
        ..id = adModel.divId
        ..style.width = '${adModel.width}px'
        ..style.height = '${adModel.height}px';

      return element;
    });
  }

  void createAdOld() {
    // ui.platformViewRegistry.registerViewFactory(adModel.divId, (int viewId) {
    //   // Dispatch the ad event to JS
    //   html.window.dispatchEvent(
    //     html.CustomEvent('load-gpt-ad', detail: adModel.toMap()),
    //   );
    //
    //   // Create the div placeholder
    //   final element = html.DivElement()
    //     ..id = adModel.divId
    //     ..style.width = '${adModel.width}px'
    //     ..style.height = '${adModel.height}px';
    //
    //   return element;
    // });
  }
}

// To be used with a JS file loaded in index.html that handles GPT logic:
// <script src="assets/ad_manager.js"></script>
// It listens for `load-gpt-ad` event and renders the ad accordingly
