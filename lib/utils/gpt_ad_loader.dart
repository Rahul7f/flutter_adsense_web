import 'dart:js_interop';
import 'package:flutter_adsense_web/src/adsense_interop.dart';
import 'package:universal_html/html.dart';
import 'package:universal_html/js_util.dart' as js_util;

class GptAdLoader {
  void registerGptAdLoader2() {
    window.addEventListener(
      'load-gpt-ad',
      js_util.allowInterop((event) {
        final detail = (event as CustomEvent).detail;
        final divId = detail['divId'] as String;
        final slotVal = detail['slot'] as String;
        final width = detail['width'] as int;
        final height = detail['height'] as int;

        // Access window.googletag directly
        if (!js_util.hasProperty(window, 'googletag')) {
          js_util.setProperty(window, 'googletag', js_util.jsify({'cmd': []}));
        }

        // Create the function that will check for the div
        final checkDivFunction = js_util.allowInterop(() {
          void checkDiv() {
            final div = document.getElementById(divId);
            if (div != null) {
              // Create a proper JS array for size
              final sizeArray = js_util.jsify([width, height]);

              // Access googletag through js_util or context
              final gtag = js_util.getProperty(window, 'googletag');
              final slot = js_util.callMethod(gtag, 'defineSlot', [slotVal, sizeArray, divId]);
              final pubads = js_util.callMethod(gtag, 'pubads', []);
              js_util.callMethod(slot, 'addService', [pubads]);
              js_util.callMethod(gtag, 'enableServices', []);
              js_util.callMethod(gtag, 'display', [divId]);
            } else {
              Future.delayed(const Duration(milliseconds: 100), checkDiv);
            }
          }
          checkDiv();
        });

        // Push the function to googletag.cmd using plain JS
        final gtag = js_util.getProperty(window, 'googletag');
        final cmd = js_util.getProperty(gtag, 'cmd');
        js_util.callMethod(cmd, 'push', [checkDivFunction]);
      }),
    );
  }

  // In your GptAdLoader class
  void registerGptAdLoader() {
    window.addEventListener(
      'load-gpt-ad',
      js_util.allowInterop((event) {
        final detail = (event as CustomEvent).detail;
        final divId = detail['divId'] as String;
        final slot = detail['slot'] as String;
        final width = detail['width'] as int;
        final height = detail['height'] as int;

        // Initialize googletag if needed
        if (!js_util.hasProperty(window, 'googletag')) {
          js_util.setProperty(window, 'googletag', js_util.jsify({'cmd': []}));
        }

        // Create a JS-compatible function
        final checkDivFunction = js_util.allowInterop(() {
          void innerCheckDiv() {
            final div = document.getElementById(divId);
            if (div != null) {
              // Create size array properly
              final sizeArray = js_util.jsify([width, height]);

              // Use the interop classes correctly
              if (googletag != null) {
                final gtag = googletag!;
                final adSlot = gtag.defineSlot(slot, sizeArray, divId);
                adSlot.addService(gtag.pubads());
                gtag.enableServices();
                gtag.display(divId);
              }
            } else {
              Future.delayed(const Duration(milliseconds: 100), innerCheckDiv);
            }
          }
          innerCheckDiv();
        });

        // Get the cmd array and push directly
        if (googletag != null) {
          pushToCmd(checkDivFunction as JSFunction);
        }
      }),
    );
  }
}