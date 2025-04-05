# flutter_adsense_web

A Flutter web plugin to easily integrate Google AdSense banner ads into your Flutter web apps using Google Publisher Tags (GPT).

---

## 🔧 Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_adsense_web:
    git:
      url: https://github.com/your-username/flutter_adsense_web.git
```

---

## 🌤 Usage

### Step 1: Add required scripts in `web/index.html`

```html
<!-- GPT script -->
<script async src="https://securepubads.g.doubleclick.net/tag/js/gpt.js" crossorigin="anonymous"></script>

<!-- Your custom ad logic -->
<script src="ad_manager.js"></script>
```

> 📝 Make sure `ad_manager.js` is located directly in the `web/` folder, NOT inside an `assets/` subfolder.

---

### Step 2: Add `ad_manager.js` to your project (`web/ad_manager.js`)

```js
function loadGPTAd(divId, slotId, width, height) {
  window.googletag = window.googletag || { cmd: [] };
  googletag.cmd.push(function () {
    const checkDiv = () => {
      const div = document.getElementById(divId);
      if (div) {
        googletag.defineSlot(slotId, [width, height], divId)
          .addService(googletag.pubads());
        googletag.enableServices();
        googletag.display(divId);
      } else {
        setTimeout(checkDiv, 100);
      }
    };
    checkDiv();
  });
}

// Listen for the custom event dispatched from Flutter
window.addEventListener('load-gpt-ad', function (e) {
  const { divId, slot, width, height } = e.detail;
  loadGPTAd(divId, slot, width, height);
});
```

---

### Step 3: Use the widget

```dart
import 'package:flutter/material.dart';
import 'package:flutter_adsense_web/flutter_adsense.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: AdsenseBanner(
            adModel: AdModel(
              divId: 'flutter-banner-ad',
              slot: '/6355419/Travel/Europe/France/Paris',
              width: 300,
              height: 250,
            ),
          ),
        ),
      ),
    );
  }
}
```

---

## 📁 Example

Check the `/example` directory for a working demo app.

To run it:

```bash
cd example
flutter run -d chrome
```

---

## 📦 File Structure

```
lib/
├── models/
│   └── ad_model.dart
├── src/
│   └── adsense_banner.dart
└── flutter_adsense.dart
```

---

## 💡 Notes

- This package currently supports **web** only.
- Make sure `divId` is unique per ad widget.
- Google AdSense must be set up properly with the correct `slot`.

---

## 📬 Contributions Welcome!

Feel free to open issues or PRs if you have improvements or suggestions.

---

## License

MIT