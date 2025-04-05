import 'dart:ui_web' as ui;
import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';
import '../models/ad_model.dart';

class AdsenseBanner extends StatelessWidget {
  final AdModel adModel;

  const AdsenseBanner({super.key, required this.adModel});

  @override
  Widget build(BuildContext context) {
    // Register the view
    // Only register once — ideally move to a singleton setup
    // You can optimize this part later
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(adModel.divId, (int viewId) {
      // Dispatch the ad event to JS
      html.window.dispatchEvent(
        html.CustomEvent('load-gpt-ad', detail: adModel.toMap()),
      );

      // Create the div placeholder
      final element = html.DivElement()
        ..id = adModel.divId
        ..style.width = '${adModel.width}px'
        ..style.height = '${adModel.height}px';

      return element;
    });

    return SizedBox(
      width: adModel.width.toDouble(),
      height: adModel.height.toDouble(),
      child: HtmlElementView(viewType: adModel.divId),
    );
  }
}

// To be used with a JS file loaded in index.html that handles GPT logic:
// <script src="assets/ad_manager.js"></script>
// It listens for `load-gpt-ad` event and renders the ad accordingly
