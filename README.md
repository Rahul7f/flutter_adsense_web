# flutter_adsense_web

A Flutter Web plugin to seamlessly integrate Google AdSense banner ads into your Flutter web applications.  
This package helps developers render AdSense ads using a simple widget and custom JavaScript logic.

---

## 📦 Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_adsense_web: latest_version
```

---

## ⚙️ Setup

1. **Add the GPT and ad_manager script in your `web/index.html`(in head tag) file**:

```html
<script async src="https://securepubads.g.doubleclick.net/tag/js/gpt.js" crossorigin="anonymous"></script>
<script src="ad_manager.js"></script>
```

2. **Create `web/ad_manager.js`** file:

```js
function loadGPTAd(event) {
  const detail = event.detail;
  const divId = detail.divId;
  const slotId = detail.slot;
  const width = detail.width;
  const height = detail.height;

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

window.addEventListener('load-gpt-ad', loadGPTAd);
```

---

## 🚀 Usage

```js
import 'package:flutter_adsense_web/flutter_adsense.dart';

AdsenseBanner(
  adModel: AdModel(
    divId: 'flutter-banner-ad',
    slot: '/6355419/Travel/Europe/France/Paris',
    width: 300,
    height: 250,
  ),
)
```

---

## 📝 Notes

- Only works on **Flutter Web**.
- Make sure your AdSense account has the correct ad slot IDs.
- Ensure the GPT and ad manager JS scripts are correctly included in `index.html`.

---

## 🤝 Contributions Welcome!

Feel free to open issues or pull requests to improve this package.

---

## 📄 License

[MIT](LICENSE)