import 'dart:js_interop';
import 'dart:js_interop_unsafe';

// Define googletag interface
@JS('googletag')
@staticInterop
class GoTag {}

extension GoTagExt on GoTag {
  // cmd is an array that accepts functions
  external JSObject get cmd;
  external Slot defineSlot(String adUnitPath, JSAny? size, String divId);
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
    cmd.callMethodVarArgs("push" as JSAny, [callback]);
  }
}
