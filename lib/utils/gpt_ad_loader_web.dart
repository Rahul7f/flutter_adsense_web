import 'dart:js_interop';

import 'package:flutter_adsense_web/src/adsense_interop.dart';
import 'package:flutter_adsense_web/utils/stub_gpt_ad_loader.dart';
import 'package:web/web.dart';

class GptAdLoaderWeb {
  // In your GptAdLoader class
  void registerGptAdLoader() {
    window.addEventListener(
      'load-gpt-ad',
      ((CustomEvent event) {
        final detail = event.detail?.dartify() as Map;
        final divId = detail['divId'] as String;
        final slot = detail['slot'] as String;
        final width = detail['width'] as int;
        final height = detail['height'] as int;

        final checkDivFunction = () {
          void innerCheckDiv() {
            final div = document.getElementById(divId);
            if (div != null) {
              // Use the interop classes correctly
              if (googletag != null) {
                final gtag = googletag!;
                final adSlot =
                    gtag.defineSlot(slot, [width, height].jsify(), divId);
                adSlot.addService(gtag.pubads());
                gtag.enableServices();
                gtag.display(divId);
              }
            } else {
              Future.delayed(const Duration(milliseconds: 100), innerCheckDiv);
            }
          }

          innerCheckDiv();
        }.toJS;
        // Get the cmd array and push directly
        if (googletag != null) {
          pushToCmd(checkDivFunction);
        }
      }).toJS,
    );
    print("GptAdLoaderWeb registered");
  }
}


GptAdLoaderWeb createPlatformGptAdLoader() => GptAdLoaderWeb();

