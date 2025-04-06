import 'dart:js_interop';

import 'package:universal_html/js_util.dart' as js_util;

// Define googletag interface
@JS('googletag')
@staticInterop
class GoTag {}

extension GoTagExt on GoTag {
  // cmd is an array that accepts functions
  external JSObject get cmd;  // Using JSObject is more flexible here

  external Slot defineSlot(String adUnitPath, JSObject size, String divId);
  external PubAds pubads();
  external void enableServices();
  external void display(String divId);
}

@JS()
@staticInterop
class Slot {}

extension SlotExt on Slot {
  external Slot addService(PubAds service);
}

@JS()
@staticInterop
class PubAds {}

// Helper to access googletag from window
@JS('window.googletag')
external GoTag? get googletag;

// Helper function to properly push to cmd
JSVoid pushToCmd(JSFunction callback) {
  final cmd = googletag?.cmd;
  if (cmd != null) {
    js_util.callMethod(cmd, 'push', [callback]);
  }
}