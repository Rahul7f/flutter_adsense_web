import 'package:flutter/foundation.dart';
// Using conditional imports
import 'stub_gpt_ad_loader.dart'
    if (dart.library.html) 'gpt_ad_loader_web.dart';

class GptAdLoader {
  void registerGptAdLoader() {
    createPlatformGptAdLoader().registerGptAdLoader();
  }
}
